const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const conexion = require('../database/basedatos');
const { promisify } = require('util');
const { jwtSecret, jwtExpiresIn, jwtCookieExpires } = require('../config/config');

exports.register = async (req, res) => {
    try {
        const { name, user, pass } = req.body;
        let passhash = await bcryptjs.hash(pass, 8);
        conexion.query('INSERT INTO users SET ?', { user, name, pass: passhash }, (error, result) => {
            if (error && error.code === 'ER_DUP_ENTRY') {
                console.log(error);
                req.flash('error_msg', 'El usuario ya existe');
                return res.redirect('/register');
            }
            req.flash('success_msg', 'Usuario registrado con éxito');
            res.redirect('/');
        });
    } catch (error) {
        console.log(error);
        req.flash('error_msg', 'Error en el servidor');
        res.redirect('/register');
    }
};

exports.login = async (req, res) => {
    try {
    
        const { user, pass } = req.body;

        if (!user || !pass) {
            req.flash('error_msg', 'Usuario o password no pueden estar vacíos');
            return res.redirect('/login');
        } else {
            conexion.query('SELECT * FROM users WHERE user = ?', [user], async (error, results) => {
                if (error || results.length == 0 || !(await bcryptjs.compare(pass, results[0].pass))) {
                    req.flash('error_msg', 'Usuario o password incorrectos');
                    return res.redirect('/login');
                } else {
                    const userid = results[0].userid;
                    const token = jwt.sign({ id: userid }, jwtSecret, {
                        expiresIn: jwtExpiresIn
                    });

                    console.log("Token: " + token + " Para el usuario: " + user);

                    const cookieOptions = {
                        expires: new Date(Date.now() + jwtCookieExpires * 24 * 60 * 60 * 1000),
                        httpOnly: true,
                        sameSite: 'Lax'
                    };
                    res.cookie('jwt', token, cookieOptions);
                    req.flash('success_msg', 'Ha iniciado sesión correctamente');
                    res.redirect('/');
                }
            });
        }
    } catch (error) {
        console.log(error);
        req.flash('error_msg', 'Error en el servidor');
        res.redirect('/login');
    }
};
exports.isAuthenticated = async (req, res, next) => {
    if (req.cookies.jwt) {
        try {
            // Decodifica el JWT
            const decodificada = await promisify(jwt.verify)(req.cookies.jwt, jwtSecret);
            
            // Consulta el usuario en la base de datos
            conexion.query('SELECT * FROM users WHERE userid = ?', [decodificada.id], (error, results) => {
                if (error) {
                    console.error('Error al consultar usuario:', error);
                    return next(); // Continua al siguiente middleware en caso de error
                }

                // Verifica si se encontró el usuario
                if (!results || results.length === 0) {
                    return res.redirect('/login'); // Redirige si no se encuentra el usuario
                }

                // Establece req.user con el primer resultado
                req.user = results[0];
                console.log('User:', req.user); // Verifica si req.user está definido
                return next(); // Continúa al siguiente middleware
            });
        } catch (error) {
            console.error('Error al verificar el JWT:', error);
            return res.redirect('/login'); // Redirige si hay un error al verificar el JWT
        }
    } else {
        res.redirect('/login'); // Redirige si no hay JWT
    }
};


exports.logout = (req, res)=>{
    res.clearCookie('jwt')
    return res.redirect('/')
}
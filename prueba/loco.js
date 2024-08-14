const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const conexion = require('../database/basedatos');
const { jwtSecret, jwtExpiresIn, jwtCookieExpires } = require('../config/config');

exports.register = async (req, res) => {
    try {
        const { name, user, pass } = req.body;
        let passhash = await bcryptjs.hash(pass, 8);
        conexion.query('INSERT INTO users SET ?', { user, name, pass: passhash }, (error, result) => {
            if (error) {
                console.log(error);
                req.flash('error_msg', 'Error al registrar usuario');
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
            console.log("noc");
            req.flash('error_msg', 'Usuario o password no pueden estar vacíos');
            return res.redirect('/login');
        } else {
            conexion.query('SELECT * FROM users WHERE user = ?', [user], async (error, results) => {
                if (error || results.length == 0 || !(await bcryptjs.compare(pass, results[0].pass))) {
                    req.flash('error_msg', 'Usuario o password incorrectos');
                    return res.redirect('/login');
                } else {
                    const id = results[0].id;
                    const token = jwt.sign({ id: id }, jwtSecret, {
                        expiresIn: jwtExpiresIn
                    });

                    console.log("Token: " + token + " Para el usuario: " + user);

                    const cookieOptions = {
                        expires: new Date(Date.now() + jwtCookieExpires * 24 * 60 * 60 * 1000),
                        httpOnly: true
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
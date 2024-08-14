const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const conexion = require('../database/basedatos');
const {promisify}= require('util');





//procedimiento para registrarse
exports.register = async (req, res)=>{
    try {
        const name = req.body.name;
        const user = req.body.user;
        const pass = req.body.pass;
        let passHash = await bcryptjs.hash(pass,8)
        conexion.query('INSERT INTO users SET ?', {name: name, user: user, pass: passHash}, (error, results)=>{
            if(error){console.log(error)}
            res.redirect('/register')
        })
    
    } catch (error) {
        console.log(error)
        return res.render('/register', {
            alertTilte: 'error',
            alertMessage: 'error al registrar usuario',
            alertIcon: 'error',
            showconfirmbutton: false,
            timer: false,
            ruta:'register'

        })
       
    } 
}    
 
exports.login = async (req, res)=>{
    try {
        const user = req.body.user
        const pass = req.body.pass
        
        if(!user || !pass){
            req.flash('error_msg', 'usuario o password no pueden estar vacios')
            return res.redirect('/login')

       
       
        }else{
            conexion.query('SELECT * FROM users WHERE user = ?', [user], async (error, results)=>{
                if(error || results.length == 0 || !(await bcryptjs.compare(pass, results[0].pass))) {
                    req.flash('error_msg', 'usuario o password incorrectos')
                    return res.redirect('/login')                    

                }else{
                    const id = results[0].id
                    const token = jwt.sign({ id:id }, process.env.JWT_SECRETO, {
                        expiresIn: process.env.JWT_TIEMPO_EXPIRA
                    })

                    console.log("token: "+ token + "Para el usuario: " + user)
                    
                    const cookieOptions = {
                        expires: new Date(Date.now() +process.env.JWT_COOKIE_EXPIRES *24 *60 * 60 *1000),
                        httpOnly: true
                    }
                    res.cookie('jwt', token, cookieOptions)
                    req.flash('success_msg', 'ha iniciado sesion correctamente')
                    res.redirect('/')
                    }
            })
            
        }

        
    } catch (error) {
        
    }
}      
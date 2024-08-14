const JWT = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const conexion = require('../database/basedatos')
const {promisify} = require('util')
const bcryptjs = require('bcryptjs')
const { NEWDATE } = require('mysql/lib/protocol/constants/types')
const cookieParser = require('cookie-parser')

exports.register = async (req, res)=>{
    try {    
        const name = req.body.name
        const user = req.body.user
        const pass = req.body.pass
        let passhash = await bcryptjs.hash(pass, 8)
        conexion.query('INSERT INTO users SET ?', {user:user, name:name, pass:passhash}, (error, result)=>{
            if (error){console.log(error)}
            res.redirect('/')
        })
    } catch (error) {
        console.log(error);
    }
    
        //console.log(passhash)
}
exports.login = async (req, res)=>{
    try {
        const user = req.body.user
        const pass = req.body.pass
        if(!user || !pass){
            res.render('login',{
                alert:true, 
                alertTitle: 'advertencia',
                alertMessage: 'Ingrese un usuario y contraseña',
                alertIcon: 'info',
                showConfirmButton: true,
                timer: false,
                ruta: 'login'
            })     
        }else{
            conexion.query('SELECT * FROM users WHERE user =?', [user], async (error, result)=>{
                if(result.length == 0 || ! (await bcryptjs.compare(pass, result[0].pass))){
                    res.render('login', {
                        alert: true,
                        alertTitle: "error",
                        alertMessage: "usuario y/o contraseña incorrectas",
                        alertIcon:'error',
                        showConfirmButton: true,
                        timer: false,
                        ruta: 'login'
                    })
                }else{
                    const id = result[0].id 
                    const token = JWT.sign({id:id}, process.env.JWT_SECRETO,{
                        expiresIn: process.env.JWT_TIEMPO_EXPIRA
                    })
                    console.log("TOKEN: "+token+" para el usuario: "+ user)
                    const cookiesOptions = {
                        expires: new Date(Date.now()+process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000),
                        httpOnly: true 
                    }
                    res.cookie('jwt', token, cookiesOptions)
                    res.render('login', {
                        alert: true,
                        alertTitle: "conexion exitosa",
                        alertMessage: "Logeado correctamente",
                        alertIcon: 'success',
                        showConfirmButton: false,
                        timer: 800,
                        ruta: ''
                    })
                }    
            })
               
        }

    } catch (error) {
        console.log (error)
    }
}
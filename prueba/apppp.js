const express = require('express')
const dotenv = require('dotenv')
const cookieParser = require('cookie-parser')
const app = express()
const session = require('express-session')
const flash = require('connect-flash')
require('dotenv').config(); 

app.use(session({
    secret: 'es un secreto',
    resave: false,
    saveUninitialized: true
}));

app.use(flash())

// Middleware para pasar mensajes flash a todas las vistas
app.use((req, res, next) => {
    res.locals.alert = req.flash('alert');
    res.locals.alertTitle = req.flash('alertTitle');
    next();
});

//se crea motor de plantillas
app.set('view engine', 'ejs');

// seteamos carpeta publica
app.use(express.static('public'));
// para procesar datos enviados desde forms

app.use(express.urlencoded({extended:true}));
app.use(express.json());

//variables de entorno
dotenv.config({path: './env/.env'})

//llamar al router
app.use('/', require('./routers/router'));

//cookies 
app.use(cookieParser())


app.listen(3000, ()=>{
    console.log('server corriendo en https://localhost:3000')
});
const express = require('express');
const dotenv = require('dotenv');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const flash = require('connect-flash');
const helmet = require('helmet');

const app = express();

// Configurar dotenv al principio
dotenv.config({ path: './env/.env' });

// Configuración de helmet
app.use(helmet({
    contentSecurityPolicy: {
        directives: {
            defaultSrc: ["'self'", "data:"],
            scriptSrc: ["'self'", ""],
            imgSrc: ["'self'", "data:", ""],
            fontSrc: ["'self'", "https://fonts.googleapis.com"],
            objectSrc: ["'none'"],
            upgradeInsecureRequests: [],
        }
    },
    frameguard: {
        action: 'deny'
    },
    referrerPolicy: {
        policy: 'no-referrer'
    },
    xssFilter: true,
    noSniff: true,
    hidePoweredBy: true
}));

// Configuración de middleware para sesiones y mensajes flash
app.use(session({
    secret: process.env.SESSION_SECRET || 'es un secreto',
    resave: false,
    saveUninitialized: true
}));

app.use(flash());

app.use(cookieParser());

// Middleware para procesar datos de formularios
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Configuración del motor de plantillas
app.set('view engine', 'ejs');

// Configuración de archivos estáticos
app.use(express.static('public'));


// Middleware para pasar el token CSRF y los mensajes flash a las vistas
app.use((req, res, next) => {
    res.locals.alert = req.flash('alert');
    res.locals.alertTitle = req.flash('alertTitle');
    res.locals.success_msg = req.flash('success_msg');
    res.locals.error_msg = req.flash('error_msg');
    next();
});

// Rutas
app.use('/', require('./routers/router'));

// Iniciar el servidor
app.listen(3000, () => {
    console.log('Server corriendo en http://localhost:3000');
});
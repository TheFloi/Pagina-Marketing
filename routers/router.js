const express = require('express');
const  router = express.Router();
const AuthController = require('../controllers/AuthController')
const conexion = require('../database/basedatos')
const nodemailer = require('nodemailer')

//router para  vistas users 
router.get('/plan', AuthController.isAuthenticated, (req, res)=>{
        res.render('planes')
});

//router para  vistas 
router.get('/', AuthController.isAuthenticated, (req, res)=>{
        res.render('comienzo')
});

router.get('/admin', AuthController.isAuthenticated, (req, res)=>{
        res.render('admin')
});

router.get('/login', (req, res)=>{
        res.render('login')
});

router.get('/cuenta', AuthController.isAuthenticated, (req, res)=>{
    res.render('cuenta')
})


router.get('/productos', AuthController.isAuthenticated, (req, res) => {
        const query = 'SELECT * FROM products';
        conexion.query(query, (err, results) => {
            if (err) {
                console.error('Error al consultar productos:', err);
                return res.status(500).send('Error al consultar productos');
            }
            res.render('productos', { products: results });
        });
    });

router.get('/register', (req, res)=>{
    res.render('register')
});

router.post('/carrito', AuthController.isAuthenticated, (req, res) => {
    const { product_id, price } = req.body;
    const user_id = req.user.id; // Asegúrate de que req.user esté definido
    const quantity = 1; // Puedes permitir que el usuario elija la cantidad en el frontend

    // Verifica si `price` es un número válido
    if (isNaN(price) || isNaN(quantity)) {
        console.error('El precio o la cantidad no son válidos');
        return res.status(400).send('Precio o cantidad no válidos');
    }

    // Calcula el precio total
    const total_price = parseFloat(price) * quantity;

    // Consulta SQL para insertar el producto en el carrito
    const query = 'INSERT INTO cart_items (user_id, product_id, quantity, total_price) VALUES (?, ?, ?, ?)';

    // Ejecuta la consulta
    conexion.query(query, [user_id, product_id, quantity, total_price], (err, result) => {
        if (err) {
            console.error('Error al agregar producto al carrito:', err);
            return res.status(500).send('Error al agregar producto al carrito');
        }

        // Redirige o responde con éxito
        console.log(req.body)
        res.redirect('/carrito'); // O puedes usar res.json({ success: true }); si es una API
    });
});


// Ruta para ver el carrito
router.get('/carrito', AuthController.isAuthenticated, (req, res) => {
    const user_id = req.user.id;

    const query = `
        SELECT ci.*, p.name, p.description, p.image_url 
        FROM cart_items ci
        JOIN products p ON ci.product_id = p.productid
        WHERE ci.user_id = ?
    `;

    conexion.query(query, [user_id], (err, results) => {
        if (err) {
            console.error('Error al obtener el carrito:', err);
            return res.status(500).send('Error al obtener el carrito');
        }
        res.render('carrito', { cartItems: results });
    });
});

router.get('/vista', (req, res)=>{
        res.render('vista')
});

router.post('/enviar-correo', (req, res) => {
    const { nombre, email, telefono, tipoPagina, tipologo, tipohosting, descripcion, } = req.body;

    // Configura el transporte para enviar el correo electrónico
    const transporter = nodemailer.createTransport({
        service: 'Gmail', // Puedes usar otro servicio de correo
        auth: {
            user: 'vjoel1122@gmail.com', // Tu correo electrónico
            pass: 'gibc mipx mglx gmcz' // Tu contraseña
        }
    });

    const mailOptions = {
        from: 'vjoel11222gmail.com',
        to: 'vjoel1122@gmail.com', // Correo del destinatario
        subject: 'Nueva Solicitud de Plan',
        text: `Nombre: ${nombre}\nCorreo: ${email}\nTelefono: ${telefono}\nTipo de página: ${tipoPagina}\nNecesito un logo?: ${tipologo}\nAyuda con el hosting?: ${tipohosting}\nDescripción: ${descripcion}`};

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.error('Error al enviar el correo:', error);
            return res.status(500).send('Error al enviar el correo');
        }
        res.send('Correo enviado correctamente');
    });
});

module.exports = router;

router.post('/login', AuthController.login)
router.post('/register', AuthController.register)
router.get('/logout', AuthController.logout)
//router para los metodos 



module.exports = router
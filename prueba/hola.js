exports.isAuthenticated = async (req, res, next)=>{
    if(req.cookies.jwt){
        try {
            const decodificada = await promisify(jwt.verify)(req.cookies.jwt, process.jwtSecret)
            conexion.query('SELECT FROM users WHERE id= ?', [decodificada.id], (error,results)=>{
                if (!results){return next()}
                req.user = results[0]
                return next()  
            })
        } catch (error) {
            console.log(error)
            return next()
        }
    }else{
        res.redirect('/login')
        next()
    }    
}


module.exports = {
    jwtSecret: config.get('jwtSecret'),
    jwtExpiresIn: config.get('jwtExpiresIn'),
    jwtCookieExpires: config.get('jwtCookieExpires')
  };


  exports.isAuthenticated = async (req, res, next) => {
    if (req.cookies.jwt) {
        try {
            // Decodifica el JWT
            const decodificada = await promisify(jwt.verify)(req.cookies.jwt, jwtSecret);
            
            // Consulta el usuario en la base de datos
            conexion.query('SELECT * FROM users WHERE id = ?', [decodificada.id], (error, results) => {
                if (error) {
                    console.error('Error al consultar usuario:', error);
                    return next();
                }

                // Verifica si se encontró el usuario
                if (!results || results.length === 0) {
                    return res.redirect('/login');
                }

                // Establece req.user con el primer resultado
                req.user = results[0];
                return next();
            });
        } catch (error) {
            console.error('Error al verificar el JWT:', error);
            return res.redirect('/login');
        }
    } else {
        res.redirect('/login');
        next();
    }
};
exports.logout = (req, res)=>{
    res.clearCookie('jwt')
    return res.redirect('/')
}



router.post('/carrito', AuthController.isAuthenticated, (req, res) => {
    const { product_id, price } = req.body;
    const user_id = req.user.id; // Asegúrate de que req.user esté definido
    const quantity = 1; // Puedes permitir que el usuario elija la cantidad en el frontend

    // Calcula el precio total
    const total_price = price * quantity;

    // Consulta SQL para insertar el producto en el carrito
    const query = 'INSERT INTO cart_items (user_id, product_id, quantity, total_price) VALUES (?, ?, ?, ?)';

    // Ejecuta la consulta
    conexion.query(query, [user_id, product_id, quantity, total_price], (err, result) => {
        if (err) {
            console.error('Error al agregar producto al carrito:', err);
            return res.status(500).send('Error al agregar producto al carrito');
        }

        // Redirige o responde con éxito
        res.redirect('/carrito'); // O puedes usar res.json({ success: true }); si es una API
    });
});
const conexion = require('../database/basedatos');

exports.products = async (req, res) => {
    try {   
        conexion.query('SELECT * FROM products ?', (error, results)=>{
            if (error && error.code === 'ER_DUP_ENTRY') {
                console.log(error);
                req.flash('error_msg', 'El usuario ya existe');
                return res.redirect('/productos');
            }
            req.flash('success_msg', 'Usuario registrado con éxito');
            res.redirect('/productos');  
        })
        
    } catch (error) {
        console.log(error) 
    }
}
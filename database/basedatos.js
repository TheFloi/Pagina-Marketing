const mysql = require('mysql');

const conexion = mysql.createConnection({
    host: "localhost",
    database: "base_merchandising",
    user: "",
    password: ""
})

conexion.connect((error)=>{
    if(error){
        console.log('error en conexion de basedatos: '+error)
        return
    }
    else console.log('conexion exitosa')
})

module.exports = conexion 
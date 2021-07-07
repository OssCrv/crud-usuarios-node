const mysql = require('mysql');

const connection = mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        database: process.env.DB_DATABASE,
        password: process.env.DB_PASSWORD,
        port: process.env.DB_PORT
});

connection.connect( (err) => {
    if(err){
        console.log(`El error de conexión a DB es: ${err}`)
        return;
    }
    console.log(`[DB] Conectado exitosamente`)
});

module.exports = connection;
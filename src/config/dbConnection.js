const mysql = require('mysql');

const connection = mysql.createConnection({
        host: "us-cdbr-east-04.cleardb.com",
        user: "b6fe1e3cf03490",
        database: "heroku_9d383d05ea87821",
        password: "528a8b07",
});

connection.connect( (err) => {
    if(err){
        console.log(`El error de conexión a DB es: ${err}`)
        return;
    }
    console.log(`[DB] Conectado exitosamente`)
});

module.exports = connection;
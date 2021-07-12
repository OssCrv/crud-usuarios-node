const mysql = require('mysql');

const conexion_bd = {
        host: "us-cdbr-east-04.cleardb.com",
        user: "b6fe1e3cf03490",
        database: "heroku_9d383d05ea87821",
        password: "528a8b07",
};

function handleDisconnect(conexion_bd) {
    connection = mysql.createPool(conexion_bd); // Recreate the connection, since
                                                    // the old one cannot be reused.
  
    connection.getConnection(function(err) {              // The server is either down
      if(err) {                                     // or restarting (takes a while sometimes).
        console.log('error when connecting to db:', err);
        setTimeout(handleDisconnect, 2000); // We introduce a delay before attempting to reconnect,
      }                                     // to avoid a hot loop, and to allow our node script to
    });                                     // process asynchronous requests in the meantime.
                                            // If you're also serving http, display a 503 error.
    connection.on('error', function(err) {
      console.log('db error', err);
      if(err.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
        handleDisconnect();                         // lost due to either server restart, or a
      } else {                                      // connnection idle timeout (the wait_timeout
        throw err;                                  // server variable configures this)
      }
    });
  }
  
handleDisconnect(conexion_bd);

module.exports = connection;
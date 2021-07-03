CREATE DATABASE IF NOT EXISTS reto_iush;

USE reto_iush;

CREATE TABLE users(
    cedula INT NOT NULL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    pass varchar(255) NOT NULL,
    rol ENUM('ADMIN', 'CLIENT'),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL
);

INSERT INTO users   (cedula,        full_name,       user_name, is_active,  rol,     pass   ) 
VALUES              (1020304050,    'Administrador', 'Admin',   1,          'ADMIN', '$2y$12$T6GQ6rZF7bl2ke0q1CHRYuVKFJIBdpDRtbTXjKeNr758Ia/ctKvQS');

UPDATE users                                                                                                                                                             
SET full_name = 'ADMINISTRADOR'                                                                                                                                          
WHERE cedula = 1020304050;
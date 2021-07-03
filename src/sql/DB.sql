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





INSERT INTO users   (cedula,        user_name, is_active, rol, pass, full_name) 
VALUES
(1152467711,	"brenda", 1, 'CLIENT',	"$2y$08$eUZcHyLjHVNpgOcIB6nuR.QNvCmidZ5HBa60h7hG2PmDcZf7PIE4e",	"Brenda Milena Arango Jimenez"),
(1017255394,	"laura", 1, 'CLIENT',	"$2y$08$q6plfbwV1ZznjIbkwe9OpOjx7nwRjC5TBxqrA5mUuOVQjiMZnQuHC",	"Laura Arboleda Sanchez"),
(1152458850,	"estefany", 1, 'CLIENT',	"$2y$08$kYhNp0fynC8OYsogyfdmVe7XCppR3VzRqWvmiscCNBcCiuuZVzMaW",	"Estefany Bedoya Cortes"),
(1152695241,	"jorge", 1, 'CLIENT',	"$2y$08$pGOc.utL95A3MBz5dp.Rg.rAsOhVm7oEe/Pb9H5s2QM6dUNNi1mty",	"Jorge Andres Bohorquez Bedoya"),
(1035920231,	"ana", 1, 'CLIENT',	"$2y$08$Wboutj7EfoQLaH.APi4OCe/OBDVCRt.4ohZhqJ3nn3OzbhkkBeo3O",	"Ana Maria Calderon Cardona"),
(1040757150,	"paula", 1, 'CLIENT',	"$2y$08$ZZcNKVpYPyAegdGod9U/oO5am20eiEAF7oObffCq3Ix2FbwoEj1H6",	"Paula Andrea Cardenas Cardona"),
(1020476326,	"yennifer", 1, 'CLIENT',	"$2y$08$mpKedAaOBu5TcAjKjtBQvubG2DFn0ffYlbk4P1FwuffcvqqSu8pvq",	"Yeniffer Andrea Cordoba González"),
(1152209688,	"johan", 1, 'CLIENT',	"$2y$08$Aamrz9DhT9YH/n0UI2KqVOLduNhcPubPLmkDMJWtLmN.lXNdbkP2y",	"Johan Alexander Correa Manco"),
(1035232997,	"sebastian", 1, 'CLIENT',	"$2y$08$VBy2vtQXbgqeRFNgVYBuH.5jdvNISJBCPTfToEXEys8H74j3ChVk2",	"Sebastian Gutierrez Montoya"),
(1040754611,	"seara", 1, 'CLIENT',	"$2y$08$y5Y1oZXMIPsXRXUNJKpkP.JF5jYlq5lDkqCbxKhdWxs98MA..7umG",	"Sara Gutierrez Tamayo"),
(1017231061,	"vivian", 1, 'CLIENT',	"$2y$08$KXfrGvB42fgeUoFkpXvPdult9xrkIMeZv7Xaa4Mz5KDzgEcNQzXjK",	"Vivian Londoño"),
(1214738679,	"juliana", 1, 'CLIENT',	"$2y$08$5qp7DKhtAM8C1zBgWgHk5e9qgqPgtHHs.ivkHCM2RAFMUQ9DDPJii",	"Juliana Maldonado Pérez"),
(1017255421,	"valentina", 1, 'CLIENT',	"$2y$08$PMoj6WfUrYEPkE8iXisrseW00zM5hpWIl5UE1OCr6.6YOEtiHV5QK",	"Valentina Muñeton Mejia"),
(1026155250,	"juan", 1, 'CLIENT',	"$2y$08$OlWgYAH8ibbHYeiAIxIxDuAFlRjmSvktjDADQOvt2tW2Xan9LdSxa",	"Juan David Pineda Henao"),
(1036659064,	"laura", 1, 'CLIENT',	"$2y$08$5FhnjbgbptQt9lCxeWxFCOShzDrRZI3mz.LNi65ToJUJIIo2AVL4y",	"Laura Ramirez Mora"),
(1152210040,	"susana", 1, 'CLIENT',	"$2y$08$KpHflscsH3XqEqb4.t1yJeDm.3fDOAgyhDmAKqGqqshusBfeV/L56",	"Susana Ruiz Cardona"),
(1152459490,	"maria", 1, 'CLIENT',	"$2y$08$0k7nuMoTpGE8aHsWD91CYeQJ./d7ptOebgdk.LPb9eJR8IcjhxCn2",	"Ana Maria Salgado Jaramillo"),
(1015196651,	"adrian", 1, 'CLIENT',	"$2y$08$IRtTCTFE.aphzRSCDf.u5u8GjZuoAlAkVPAo/BEImfsKFhXvxLGb2",	"Adrian Enrique Sanabria Mendoza"),
(1037631752,	"stefania", 1, 'CLIENT',	"$2y$08$FljLcRZcq8pvHBDF/x.04Opg4kmqjPoQdbl3OC/o4VYRmOeoeFJaO",	"Andrea Estefania Fierro Castrillon"),
(1101392712,	"crismargareth", 1, 'CLIENT',	"$2y$08$gC8tciJzvRiVga0VSX.iYusLRtT1dMlduKttKoa7jm4iOYVwJhcQm",	"Crismargareth Soria Rodriguez"),
(1035431085,	"santiago", 1, 'CLIENT',	"$2y$08$ZOioEfBEi68kYrVYl3A/QuPqZQAvS6sORjOlSjOVY5upuiovWVnQ6",	"Santiago Sosa Agudelo"),
(1017237519,	"danirami", 0, 'CLIENT',	"$2y$08$koD9QPeHf5ZBDxadnuExwe8M13JPeaY4N7JliXqi5mQMw4K3i1Kzq",	"Daniela Ramirez Daza"),
(1037638607,	"sanorre", 0, 'CLIENT',	"$2y$08$os.WsArKJabVCz37OoNeGut6GIxP8BqA31ujUXAENUEOYptPNJlpG",	"Santiago Orrego González"),
(1026160351,	"camitoro", 0, 'CLIENT',	"$2y$08$Jdyq8VHhUVs4BgrP9Nq/eu7Nh34lydY.uFL4fUZdwW5GfTbkA6Lb2",	"Camila Toro Arango"),
(1152448531,	"judithdiaz", 0, 'CLIENT',	"$2y$08$BV6fzWu4FxTiiT0eGBDSE.bE9TBIPOwjMKtX2UHKSHRANHdcTCraW",	"Judith Diaz Bertel"),
(1017213622,	"nataliapineda", 0, 'CLIENT',	"$2y$08$xvZb81b5j.eOTnreoyk0vOlGStgLxFeWQBfew1t5dEyUrIcC3vJC2",	"Natalia Pineda Arcila"),
(1152692831,	"davidguerra", 0, 'CLIENT',	"$2y$08$.dhyE2AEAzcFoitrHbk0LOqOYcKwqCWQdSWicLIBe/efKXNyxq8nu",	"Pablo David Guerra Echeverry"),
(1152203286,	"saraloza", 0, 'CLIENT',	"$2y$08$JNA/H/DwSzW8iA6sn9MW9.S/.4G2q6SX7HA4bra69F70G3dJwHiYe",	"Sara Isabel Loaiza Salazar"),
(1037633063,	"carlocardo", 0, 'CLIENT',	"$2y$08$HuXVh4xL.9KDXDKKYtM0VuDPU6Pk7k5Ia6ANxzQKLWuVffZsFL71W",	"Carlos Esteban Cardona Giraldo"),
(1017219439,	"gradynat", 0, 'CLIENT',	"$2y$08$u4jxgn/ftI1glRMrpYwqE.2..zWMoLnB1uYEq6kmghiXX9wlta/uS",	"Gladys Natalia Marquez Martinez"),
(1040748356,	"juliana", 0, 'CLIENT',	"$2y$08$KqObuAOgDYu8RD4vmhzHnu22YAVXKhXJLGReN.lDUarLOID.865TC",	"Juliana Usma Maya"),
(1216716616,	"dreisy", 0, 'CLIENT',	"$2y$08$IJks6kgo9Ka9FtEVwfy8y.5ckZrQ1/c1nnWO1jDc.lG9T9kTSuetG",	"Deisy Natalia Vanegas Cano"),
(1020464166,	"juanespina", 0, 'CLIENT',	"$2y$08$jM20mS9EtRpMUfXIYV0hSe86NqZ.0j3cDzcthH7LCk3XY.uTyBFdy",	"Juan Daniel Espinosa Marin"),
(1035432485,	"leidytati", 0, 'CLIENT',	"$2y$08$Agoj9dQTky7Do/Yd5o5TpeFspKtW3x2sCrFTIjU0cSK7ES.gzlAZK",	"Leidy Tatiana Valle"),
(1128460387,	"carlogarz", 0, 'CLIENT',	"$2y$08$nXXycZo3L7.Zd7.7WLCxyObBzdNu77sQRx7nhmx4N5RewHzij3ati",	"Carlos Andres Garzon Acosta"),
(1036660745,	"crisflor", 0, 'CLIENT',	"$2y$08$vm1VoHyJy./mAByE3AtYbuTIrJKYuNjDw1pOoaq4QRf.RUewIWoJa",	"Cristian Andres Florez Rojas");

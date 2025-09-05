# Gestor de Usuarios en Node.js/Express

Este proyecto es una aplicación web de gestión de usuarios creada como reto de programación. Está construida con **Node.js**, **Express** y **EJS** para el back‑end y el renderizado de vistas, y utiliza **MySQL** como motor de base de datos. Permite registrar usuarios, autenticarlos, editarlos, borrarlos, filtrar usuarios activos y gestionar roles básicos.

## Tabla de contenidos

- [Descripción](#descripción)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Configuración](#configuración)
- [Uso](#uso)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Características](#características)
- [Próximos pasos](#próximos-pasos)
- [Contribuir](#contribuir)
- [Licencia](#licencia)

## Descripción

La aplicación implementa un pequeño **CRUD (Create, Read, Update, Delete)** de usuarios con roles. Permite:

- Registrar nuevos clientes con contraseña encriptada mediante **bcryptjs**.
- Autenticación de usuarios usando sesiones con **express‑session**.
- Listar todos los usuarios y filtrar los usuarios activos.
- Editar la información de usuarios y activar/desactivar cuentas.
- Eliminar usuarios definitivos.
- Acceso a la administración sólo si se inicia sesión como administrador.

El proyecto sirve como ejemplo didáctico para aprender a integrar Express con EJS, sesiones, hashing de contraseñas y acceso a bases de datos MySQL.

## Requisitos

Antes de comenzar, asegúrate de contar con:

- [Node.js](https://nodejs.org/) (versión 14 o superior).
- [MySQL](https://www.mysql.com/downloads/).
- [Git](https://git-scm.com/downloads) para clonar el repositorio.

## Instalación

1. **Clona el repositorio**

   ```bash
   git clone https://github.com/OssCrv/reto-programacion.git
   cd reto-programacion
Instala dependencias

bash
Copiar código
npm install
Crea la base de datos

Ejecuta el script src/sql/DB.sql en tu servidor MySQL para crear la base de datos reto_iush, la tabla users y un usuario administrador inicial:

bash
Copiar código
mysql -u tu_usuario -p < src/sql/DB.sql
Configura las variables de entorno

Crea un archivo .env en la carpeta src/env con las siguientes variables (ajusta según tu entorno):

dotenv
Copiar código
DB_HOST=localhost
DB_USER=tu_usuario
DB_PASS=tu_contraseña
DB_DATABASE=reto_iush
PORT=6969
Configuración
La aplicación utiliza un pool de conexiones a MySQL definido en src/config/dbConnection.js, que se reconecta automáticamente en caso de caída de la base de datos. La configuración del servidor Express se encuentra en src/config/server.js, donde se establece el motor de vistas EJS, la carga de archivos estáticos y las sesiones.

Uso
Inicia la aplicación

bash
Copiar código
npm run dev
Esto arrancará el servidor en modo de desarrollo con nodemon en el puerto indicado (por defecto 6969). También puedes usar npm start para ejecutarlo sin nodemon.

Accede a la interfaz web

Abre tu navegador y visita http://localhost:6969.

Inicio de sesión

Utiliza el usuario administrador creado por defecto:

Usuario: Admin

Contraseña: Admin (la contraseña se guarda en la tabla como hash bcrypt). Si cambias este usuario en el script SQL, actualiza aquí la información.

Tras iniciar sesión, podrás ver la lista de usuarios, crear nuevos clientes, editarlos o eliminarlos. Para cerrar sesión usa el enlace “Log Out”.

Estructura del proyecto
text
Copiar código
reto-programacion/
├── package.json           # dependencias y scripts
├── src/
│   ├── index.js           # punto de entrada, inicia el servidor y rutas
│   ├── config/
│   │   ├── server.js      # configuración de Express y sesiones
│   │   └── dbConnection.js# conexión a MySQL (pool y reconexiones)
│   ├── app/
│   │   ├── routes/
│   │   │   └── navigation.js   # define las rutas de login, CRUD de usuarios y filtros
│   │   ├── views/
│   │   │   ├── pages/      # vistas EJS para login, usuarios y activos
│   │   │   └── partials/   # parciales para cabecera, pie y modales
│   │   └── utils/
│   │       └── date_transformation.js # utilidades para formatear fechas
│   ├── public/            # recursos estáticos (css, imágenes)
│   └── sql/
│       └── DB.sql         # script para crear la BD y tabla inicial
└── README.md              # este archivo (puede renombrarse)
Características
Gestión de usuarios: alta, baja, edición y listados (todos y activos).

Autenticación y sesiones: se usa express-session para mantener el estado del usuario logueado.

Contraseñas seguras: se cifran con bcryptjs antes de almacenarse.

Roles básicos: soporta rol ADMIN para administración y rol CLIENT para usuarios normales.

Fechas legibles: se formatean mediante la utilidad date_transformation para mostrar la creación y última actualización en un formato amigable.

UI con Bootstrap 5: las vistas utilizan Bootstrap para una interfaz responsive y modales de edición/agregado.

DataTables: para el listado de usuarios activos se integró DataTables (paginado y búsqueda).

Próximos pasos
Algunas ideas para seguir mejorando este proyecto:

Añadir validación de datos (por ejemplo, con express-validator) para las entradas del formulario.

Implementar un controlador separado para la lógica de autenticación y CRUD, siguiendo la arquitectura Model–View–Controller (MVC).

Mejorar la seguridad de sesiones y almacenar el secret en variables de entorno.

Añadir tests unitarios e integración (por ejemplo con jest o mocha).

Internacionalizar las vistas para soportar múltiples idiomas.

Desplegar la aplicación en un proveedor cloud (Heroku, Vercel, Render) usando variables de entorno.

Contribuir
¡Las contribuciones son bienvenidas! Si deseas colaborar:

Haz un fork del proyecto y crea una rama para tu funcionalidad (git checkout -b feature/NOMBRE).

Asegúrate de que tus cambios siguen un estilo coherente y se han probado.

Envía un pull request describiendo tus mejoras o correcciones.

Licencia
Este proyecto está bajo la licencia ISC. Consulta el archivo package.json para más información.

## Estructura de datos:
{
cedula: xxxxxx,
full_name: 'xxxxxx',
user_name: 'xxxxxx',
pass: 'xxxxxxxx',
rol: 'CLIENT',
date_creation: 2021-07-01T15:26:32.000Z,
last_update: 2021-07-01T15:26:32.000Z,
is_active: 1
}
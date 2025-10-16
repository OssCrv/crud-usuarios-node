# Gestor de Usuarios en Node.js/Express

Aplicación web sencilla para gestionar usuarios (crear, listar, editar y eliminar) construida con **Node.js**, **Express**, **EJS** y **MySQL**. Incluye autenticación basada en sesiones, hashing de contraseñas con **bcryptjs** y vistas renderizadas en servidor.

## Contenido
- [Requisitos previos](#requisitos-previos)
- [Instalación y configuración](#instalación-y-configuración)
- [Variables de entorno](#variables-de-entorno)
- [Inicializar la base de datos](#inicializar-la-base-de-datos)
- [Ejecución](#ejecución)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Características principales](#características-principales)
- [Scripts disponibles](#scripts-disponibles)
- [Credenciales de demostración](#credenciales-de-demostración)
- [Próximos pasos sugeridos](#próximos-pasos-sugeridos)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Requisitos previos
Antes de comenzar asegúrate de tener instalado:
- [Node.js](https://nodejs.org/) 14 o superior (se recomienda la última LTS).
- [npm](https://www.npmjs.com/) (se instala junto a Node.js).
- [MySQL](https://dev.mysql.com/downloads/) 5.7 o superior.
- [Git](https://git-scm.com/downloads) para clonar el repositorio.

## Instalación y configuración
1. **Clona el repositorio**
   ```bash
   git clone https://github.com/OssCrv/crud-usuarios-node.git
   cd crud-usuarios-node
   ```
2. **Instala las dependencias**
   ```bash
   npm install
   ```
3. **Crea el archivo de variables de entorno** (ver siguiente sección).
4. **Inicializa la base de datos** ejecutando el script SQL proporcionado.

## Variables de entorno
La aplicación carga la configuración desde un archivo `.env` ubicado en `src/env/.env`. Si la carpeta `env` no existe, créala manualmente.

Ejemplo de contenido del archivo `.env`:
```dotenv
DB_HOST=localhost
DB_USER=tu_usuario
DB_PASS=tu_contraseña
DB_DATABASE=reto_iush
PORT=6969
```

## Inicializar la base de datos
Ejecuta el script `src/sql/DB.sql` en tu servidor MySQL para crear la base de datos, la tabla `users` y un usuario administrador por defecto:

```bash
mysql -u tu_usuario -p < src/sql/DB.sql
```

Asegúrate de que las credenciales configuradas en el `.env` coincidan con las del servidor MySQL donde se ejecutó el script.

## Ejecución
Inicia el servidor en modo desarrollo (con recarga automática):
```bash
npm run dev
```

Para ejecutar en modo producción simple:
```bash
npm start
```

El servidor queda disponible por defecto en `http://localhost:6969`, aunque puedes modificar el puerto mediante la variable `PORT`.

## Estructura del proyecto
```
crud-usuarios-node/
├── package.json
├── README.md
└── src/
    ├── index.js                 # Punto de entrada; levanta el servidor Express
    ├── app/
    │   ├── routes/
    │   │   └── navigation.js    # Rutas de autenticación y CRUD de usuarios
    │   ├── utils/
    │   │   └── date_transformation.js
    │   └── views/               # Vistas EJS (login, listado, usuarios activos, parciales)
    ├── config/
    │   ├── dbConnection.js      # Pool de conexiones MySQL y lógica de reconexión
    │   └── server.js            # Configuración de Express, sesiones y motor de vistas
    ├── public/                  # Recursos estáticos servidos desde /resources
    └── sql/
        └── DB.sql               # Script de creación y seed de la base de datos
```

## Características principales
- CRUD completo de usuarios con distinción entre roles `ADMIN` y `CLIENT`.
- Autenticación mediante sesiones utilizando **express-session**.
- Hashing de contraseñas con **bcryptjs** antes de persistir en la base de datos.
- Vistas server-side renderizadas con **EJS** y estilos basados en **Bootstrap 5**.
- Listados de usuarios (todos y solo activos) con formateo de fechas legibles.
- Manejo básico de reconexión a la base de datos mediante un pool de conexiones de MySQL.

## Scripts disponibles
Definidos en `package.json`:
- `npm run dev`: ejecuta el servidor con **nodemon** para recarga en caliente.
- `npm start`: ejecuta el servidor con Node.js sin recarga automática.

## Credenciales de demostración
El script SQL crea un usuario administrador inicial:
- **Usuario:** `Admin`
- **Contraseña:** `Admin`

> La contraseña se guarda como hash `bcrypt`. Si modificas las credenciales en el script, recuerda actualizar esta sección para futuras referencias.

## Próximos pasos sugeridos
- Añadir validaciones de formularios (por ejemplo con `express-validator`).
- Implementar controladores y modelos para separar responsabilidades y adoptar un patrón MVC.
- Almacenar el `session secret` y demás secretos exclusivamente en variables de entorno.
- Incorporar pruebas unitarias/integración con Jest, Mocha u otra librería.
- Preparar scripts de despliegue (Docker, Render, Railway, etc.) para un entorno productivo.

## Contribuciones
¡Se aceptan contribuciones! Si deseas colaborar:
1. Haz un fork del repositorio y crea una rama con tu mejora (`git checkout -b feature/nueva-funcionalidad`).
2. Implementa los cambios asegurando que el proyecto siga funcionando.
3. Envía un Pull Request describiendo claramente tus aportes.

## Licencia
Este proyecto está licenciado bajo los términos de la licencia ISC. Consulta `package.json` para más detalles.

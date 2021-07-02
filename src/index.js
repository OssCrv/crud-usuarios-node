const app = require('./config/server');

const rutas = require('./app/routes/navigation'); // require('./app/routes/login_registro')(app)
rutas(app);

app.listen(app.get('port'), () => {
    console.log(`Server running at http://localhost:${app.get('port')}`)
})
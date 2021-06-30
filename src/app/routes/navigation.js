const connection = require('../../config/dbConnection');
const bcryptjs = require("bcryptjs");

module.exports = app => {    
    app.get('/', (req, res) => {
        res.render("../views/pages/users");
    })


    app.get('/login', (req, res) => {
        res.render("../views/pages/login");
    })

    //Metodos post
    app.post("/auth", (req, res) => {
        const {username, pass} = req.body;
        if (username && pass) {
            connection.query("SELECT * FROM users WHERE user_name = ?", [username], async(err, result) => {
                if (err) {
                    console.log(err);
                } else {
                    //Codigo de login
                    if(result.length === 0 || !(await bcryptjs.compare(pass, result[0].pass))){
                        res.send("Usuario y/o password incorrectos")
                    } else {
                        res.send("Si esta en la BD")
                    }
                }
            });
        }
    });
}

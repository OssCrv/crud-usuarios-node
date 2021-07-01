const connection = require('../../config/dbConnection');
const bcryptjs = require("bcryptjs");

module.exports = app => {    
    app.get('/', (req, res) => {
        if (req.session.isLoggedIn){
            connection.query("SELECT * FROM users WHERE rol != 'admin'", (err,results) => {
                res.render("../views/pages/users", {
                    login: true,
                    userList: results
                });
            })
        } else {
            res.redirect("/login");
        }
        
    })


    app.get('/login', (req, res) => {
        res.render("../views/pages/login");
    })
    
    app.get('/logout', (req,res) =>{
        req.session.destroy(() => {
            res.redirect('/');
        })
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
                        req.session.isLoggedIn = true;
                        req.session.rol = result[0].rol;
                        res.redirect('/');
                    }
                }
            });
        }
    });
}

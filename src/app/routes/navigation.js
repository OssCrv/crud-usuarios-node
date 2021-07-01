const connection = require('../../config/dbConnection');
const bcryptjs = require("bcryptjs");

module.exports = app => { 
    //Ruta principal   
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
    
    //Ruta de usuarios activos
    app.get('/active', (req,res) => {
        if (req.session.isLoggedIn){
            connection.query("SELECT * FROM users WHERE is_active != 0 AND rol = 'client'", (err,results) => {
                res.render("../views/pages/active", {
                    login: true,
                    userList: results
                });
            })
        } else {
            res.redirect("/login");
        }
    })

    //Ruta login
    app.get('/login', (req, res) => {
        res.render("../views/pages/login");
    })
    
    //Logout sesion
    app.get('/logout', (req,res) =>{
        req.session.destroy(() => {
            res.redirect('/');
        })
    })

    //Delete tabla usuarios
    app.get('/delete/:id', (req, res) => {
        const id = req.params.id;
        connection.query('DELETE FROM users WHERE cedula = ?', [id], (err, results) => {
            if(err){
                console.log(err)
            } else {
                res.redirect('/');
            }
        })
    })

    //Edit tabla usuarios
    app.post('/edit/:id', (req, res) => {
        const id = req.params.id;
        const {cedula, full_name, user_name, is_active} = req.body;
        connection.query('UPDATE users SET full_name = ?, user_name = ?, is_active = ? WHERE cedula = ?', 
        [full_name, user_name, is_active, id], (err,results) => {
            if(err){
                console.log(err);
            } else {
                res.redirect("/");
            }
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

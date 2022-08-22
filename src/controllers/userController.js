const path = require('path');
const fs = require('fs');
const { markAsUntransferable } = require('worker_threads');
const { join } = require('path');
const pathUserDB = path.join(__dirname, '../database/users.json');
const userDB = JSON.parse(fs.readFileSync(pathUserDB, 'utf-8'));
const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const User = require('../models/User');

let allUsers = userDB.map ( e => {
    return {
        id: e.id,
        nombre: e.nombre,
        apellido: e.apellido,
        email: e.email,
        telefono: e.telefono,
        domicilio: e.domicilio,
        password: e.password,
        confirmPassword: e.confirmPassword,
        fotoPerfil: e.fotoPerfil
    }
});



const userController = {
    login : (_req, res) => {
       res.render(path.join(__dirname,'../views/users/login')) // login ejs
    },
    processLogin: (req,res)=>{
        const resultValidation = validationResult(req);
        errors = resultValidation.mapped();
        oldData = req.body;
        
        const { email,
        password}=req.body;
        let userToLogin = User.findByField('email', email);
        if(userToLogin){
            let passwordMatch = bcrypt.compareSync(password, userToLogin.password);
            if(passwordMatch){
                delete userToLogin.password 
                req.session.userLogged = userToLogin

                if (req.body.remember) {
                    res.cookie('userEmail', req.body.email, {maxAge: 1000 * 120});   
                }

                return res.redirect('/')

            }else{
                res.render('users/login', {
                    errors: {
                        password: {
                            msg: 'Las credenciales son inválidas'
                        }               
                    }, oldData: req.body
                })
            }
        }else{
                res.render('users/login' , {
                    errors: {
                        email: {
                            msg: 'El email no se encuentra registrado'
                        }               
                    }, oldData: req.body
                })        
        }
    },
    registro : (req, res) => {
        res.render(path.join(__dirname,'../views/users/register.ejs')) // registro.ejs
    },
    productCart : (_req, res) => {
        res.render(path.join(__dirname,'../views/users/productCart.ejs')) //  productCart.ejs
    },
    userCreate: (req, res) => {
        const resultValidation = validationResult(req);
        const userInDb = User.findByField('email', req.body.email);

        if (resultValidation.errors.length > 0) {
            console.log(resultValidation)
            res.render('users/register', {
                
                errors: resultValidation.mapped(),
                oldData: req.body
            });
        } else if (userInDb) {
            return res.render('users/register', {
                errors: {
                    email: {
                        msg: 'El email ya se encuentra registrado'
                    }               
                }, oldData: req.body
            });
        } else {                 
        
            let readJSON = fs.readFileSync(pathUserDB, 'utf-8');
            let jsonParseado = JSON.parse(readJSON);
        
            const id = jsonParseado[jsonParseado.length - 1].id;
            const newId = id + 1;

            let newUser = {
                id: newId,
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                email: req.body.email,
                telefono: req.body.telefono,
                domicilio: req.body.domicilio,
                password: bcrypt.hashSync(req.body.password, 10),
                fotoPerfil: req.file ? req.file.filename : ""
            }


            let newUserlist = [...jsonParseado, newUser];
            // let newUserList = userDB.push(newUser);
            let newUserListString = JSON.stringify(newUserlist, null, ' ');

            let guardar = fs.writeFileSync(pathUserDB, newUserListString)
            guardar
            let allUsers = JSON.parse(fs.readFileSync(pathUserDB, 'utf-8'));
            res.redirect('/login');
        }
        
    },
    quienesSomos : (_req,res) => {
        res.render (path.join(__dirname,'../views/users/quienesSomos.ejs'))  //quienesSomos.ejs
    },

    preguntasFrecuentes : (_req,res) => {
        res.render (path.join(__dirname,'../views/users/preguntasFrecuentes.ejs')) //preguntasFrecuentes.ejs
    },

    contacto : (_req,res) => {
        res.render (path.join(__dirname,'../views/users/contacto.ejs')) //contacto.ejs
    },
    usersList: (req, res) => {

      let allUsers =  User.getAllUsers();
        res.render('users/userList', {allUsers})
        
    },
    userEdit: (req, res) => {
        const id = parseInt(req.params.id);
        const userEdit = User.findByPk(id);
        res.render('users/userEdit', {userEdit})  //  pagina de deición de usuario
    },
    userUpdate: (req, res) => {
        const resultValidation = validationResult(req);
        // const userInDb = User.findByField('email', req.body.email);
        const userEdit = User.findByPk(req.body.id);
        // res.send(userEdit);
        if (resultValidation.errors.length > 0) {
            console.log(resultValidation)
            res.render('users/userEdit', {
                
                errors: resultValidation.mapped(),
                oldData: req.body,
                userEdit: userEdit,
            }); 
        } else {
            const nuevoId = parseInt(req.body.id);
            const nuevoNombre = req.body.nombre;
            const nuevoApellido = req.body.apellido;
            const nuevoEmail = req.body.email;
            const nuevoTelefono = req.body.telefono;
            const nuevoDomicilio = req.body.domicilio;
            const nuevofotoPerfil = req.file ? req.file.filename : "";

            const userInDb = User.findByField('email', req.body.email);

        if ( userInDb && (userInDb.email != userEdit.email) ) {
            return res.render('users/userEdit', {
                errors: {
                    email: {
                        msg: 'El email ya se encuentra registrado'
                    }               
                }, oldData: req.body,
                userEdit,
            });  
        } else {
            let allUsers = JSON.parse(fs.readFileSync(pathUserDB, 'utf-8'));     
            allUsers.map( e => {
                if (e.id == nuevoId) {
                    e.id = nuevoId
                    e.nombre = nuevoNombre;
                    e.apellido = nuevoApellido;
                    e.email = nuevoEmail;
                    e.telefono = nuevoTelefono;
                    e.domicilio = nuevoDomicilio;
                    e.fotoPerfil =  nuevofotoPerfil == "" ? e.fotoPerfil:  nuevofotoPerfil;
                }
            });
    
            fs.writeFile(pathUserDB, JSON.stringify(allUsers, null, " "), (error) => {
                if (error) {
                    res.send(error);
                } else {
                    const userEdit = User.findByPk(req.body.id);
                  
                    req.file ? req.body.fotoPerfil = req.file.filename: req.body.fotoPerfil = userEdit.fotoPerfil
                    req.session.userLogged = req.body
                    req.session.userLogged.fotoPerfil = req.body.fotoPerfil;
                    
                    
                    res.locals.userLogged = req.session.userLogged
                    res.locals.userLogged.fotoPerfil = req.session.userLogged.fotoPerfil;

                    res.render('users/userList', {allUsers})
                }
                
            })
    
            }
    
        }      
    },
    userDelete: (req, res) => {
        const id = parseInt(req.params.id);
        let allUsers = JSON.parse(fs.readFileSync(pathUserDB, 'utf-8')); 
        const newUsers = allUsers.filter( e => e.id != id);

        fs.writeFile(pathUserDB, JSON.stringify(newUsers, null, " "), (error) => {
            if (error) {
                res.send('Error ' + error);
            } else {
                let newDB = JSON.parse(fs.readFileSync(pathUserDB, 'utf-8'));
                
                const allUsers = newDB.map ( e => {
                    return {
                        id: e.id,
                        nombre: e.nombre,
                        apellido: e.apellido,
                        email: e.email,
                        telefono: e.telefono,
                        domicilio: e.domicilio,
                        password: e.password,
                        confirmPassword: e.confirmPassword,
                        fotoPerfil: e.fotoPerfil
                    }
                });
                res.redirect('/usuarios')
                
            }
        })
    },
    userDetail: (req, res) => {
        const id = parseInt(req.params.id);
        let userDetail = User.findByPk(id);
        if (userDetail) {
            res.render('users/userDetail', {userDetail});
        } else {
            res.send(`No se encontro a usuario ${id}`);
        }      
    },
    logout: (req, res) => {
		res.clearCookie('userEmail');
		req.session.destroy();
		return res.redirect('/');
	}
 };


module.exports = userController;

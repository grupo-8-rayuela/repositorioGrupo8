const path = require('path');
const fs = require('fs');
const { markAsUntransferable } = require('worker_threads');
const User = require('../model/User');
const bcrypt = require('bcryptjs');
const { findByField } = require('../model/User');
const { send } = require('process');
// const usersJson = require('../database/users.json',)


const userController = {
    login : (_req, res) => {
       res.render(path.join(__dirname,'../views/users/login')) // login ejs
    },
    processLogin: (req,res)=>{
        const {email, password} =req.body;
        let userToLogin = User.findByField('email', email);
        if(userToLogin){
            let passwordMatch = bcrypt.compareSync(password, userToLogin.password);
            if(passwordMatch){
                delete userToLogin.password 
                req.session.userLogged = userToLogin
                 res.redirect('/')
        if(req.body.recordame != undefined) {
            res.cookie ('recordame',
            usertoLogin.email, {maxAge:120000}
            )
        }
              }else{
                res.send('Contra invalida')
            }
              }else{
                res.send('no se encontro el mail registrado')
        }
    },
    registro : (_req, res) => {
        res.render(path.join(__dirname,'../views/users/register.ejs')) // registro.ejs
    },
    productCart : (_req, res) => {
        res.render(path.join(__dirname,'../views/users/productCart.ejs')) //  productCart.ejs
    },
    userCreate: (req, res) => {    

        let userInDB = User.findByField('email', req.body.email);                    
        if(userInDB){ 
                res.render(path.join(__dirname,'../views/users/register.ejs'), {errors: { email:
                { msg: "Este email ya se encuentra registrado"}},
                 old: req.body})          
        }else{
            let data = {...req.body,
                password: bcrypt.hashSync(req.body.password, 10),
                fotoPerfil: req.file ? req.file.filename : ""
            } 
         User.createUser(data)
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
    userEditSave: (req, res) => {
            const nuevoId = parseInt(req.body.id);
            const nuevoNombre = req.body.nombre;
            const nuevoApellido = req.body.apellido;
            const nuevoEmail = req.body.email;
            const nuevoTelefono = req.body.telefono;
            const nuevoDomicilio = req.body.domicilio;
            const nuevopassword = req.body.password;
            const nuevoconfirmpassword = req.body.confirmPassword;
            const nuevofotoPerfil = req.file ? req.file.filename : "";
    
            let allUsers = JSON.parse(fs.readFileSync(User.filename, 'utf-8'));     
            allUsers.map( e => {
                if (e.id == nuevoId) {
                    e.id = nuevoId
                    e.nombre = nuevoNombre;
                    e.apellido = nuevoApellido;
                    e.email = nuevoEmail;
                    e.telefono = nuevoTelefono;
                    e.domicilio = nuevoDomicilio;
                    e.password = nuevopassword;
                    e.confirmPassword = nuevoconfirmpassword;
                    e.fotoPerfil =  nuevofotoPerfil == "" ? e.fotoPerfil:  nuevofotoPerfil;
                }
            });
    
            fs.writeFile(User.filename, JSON.stringify(allUsers, null, " "), (error) => {
                if (error) {
                    res.send(error);
                } else {
                    res.render('users/userList', {allUsers})
                }
                
            })
        
        
    },
    userDelete: (req, res) => {
    const id = parseInt(req.params.id);
      let finalUsers= User.delete(id)
       res.redirect('/usuarios')
       res.render('users/userList', {allUsers: finalUsers})
      
    },
    userDetail: (req, res) => {
        const id = parseInt(req.params.id);
        let userDetail = User.findByPk(id);
        if (userDetail) {
            res.render('users/userDetail', {userDetail});
        } else {
            res.send(`No se encontro a usuario ${id}`);
        }            
        
    }
 };


module.exports = userController;

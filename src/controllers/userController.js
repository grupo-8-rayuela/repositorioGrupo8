const path = require('path');
//const login= path.join(__dirname,'/views/users/login')
const fs = require('fs');
const { markAsUntransferable } = require('worker_threads');
const { join } = require('path');
const pathUserDB = path.join(__dirname, '../database/users.json');
const userDB = JSON.parse(fs.readFileSync(pathUserDB, 'utf-8'));
const User = require('../model/User');
const bcrypt = require('bcryptjs');

/*let allUsers = userDB.map ( e => {
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
});*/



const userController = {
    login : (_req, res) => {
       res.render(path.join(__dirname,'../views/users/login')) // login ejs
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
        User.edit()
        res.render('users/userList', {allUsers})
        
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

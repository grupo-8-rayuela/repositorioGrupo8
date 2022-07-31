const path = require('path');
//const login= path.join(__dirname,'/views/users/login')
const fs = require('fs');
const { markAsUntransferable } = require('worker_threads');
const pathUserDB = path.join(__dirname, '../database/users.json');
const userDB = JSON.parse(fs.readFileSync(pathUserDB, 'utf-8'));

const allUsers = userDB.map(e => {
    return {
        id: e.id,
        nombre: e.nombre,
        apellido: e.apellido,
        email: e.email,
        telefono: e.telefono,
        domicilio: e.domicilio,
        passWord: e.password,
        confirmPassword: e.confirmPassword,
        fotoPerfil: e.fotoPerfil
    }
});



const userController = {
    login: (req, res) => {
        res.render(path.join(__dirname, '../views/users/login')) // login ejs
    },
    registro: (req, res) => {
        res.render(path.join(__dirname, '../views/users/register.ejs')) // registro.ejs
    },
    productCart: (req, res) => {
        res.render(path.join(__dirname, '../views/users/productCart.ejs')) //  productCart.ejs
    },
    userCreate: (req, res) => {
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
            password: req.body.password,
            confirmPassword: req.body.confirmPassword,
            fotoPerfil: req.body.fotoPerfil
        }


        let newUserlist = [...jsonParseado, newUser];
        // let newUserList = userDB.push(newUser);
        let newUserListString = JSON.stringify(newUserlist, null, ' ');

        let guardar = fs.writeFileSync(pathUserDB, newUserListString)
        guardar

        res.redirect('/login');
    },
    quienesSomos: (req, res) => {
        res.render(path.join(__dirname, '../views/users/quienesSomos.ejs'))  //quienesSomos.ejs
    },

    preguntasFrecuentes: (req, res) => {
        res.render(path.join(__dirname, '../views/users/preguntasFrecuentes.ejs')) //preguntasFrecuentes.ejs
    },

    contacto: (req, res) => {
        res.render(path.join(__dirname, '../views/users/contacto.ejs')) //contacto.ejs
    },
};


module.exports = userController;

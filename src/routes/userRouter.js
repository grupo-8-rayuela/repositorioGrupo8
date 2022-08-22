const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
let guestMiddleware = require ('../middlewares/guestMiddleware.js'); //Para no usuarios - Invitados
let authMiddleware = require ('../middlewares/authMiddleware.js'); //Solo para usuarios
const path = require('path')
const multer = require('multer');
const {body,check,validationResult} = require('express-validator')

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        const folderPath = path.join(__dirname,'../../public/img/users');
        cb (null, folderPath);
    },
    filename: (req, file, cb) => {
        const newFileName = "img-user-" + Date.now() + path.extname(file.originalname);
        cb(null, newFileName)
    }  
});

 const validations = [ 
     check('email').isEmail().withMessage("Debe ingresar un mail válido").bail(),
     check('passoword').isEmpty().withMessage("Debe ingresar una contraseña").bail()
     .isLength({min:4}).withMessage("La contraseña debe tener al menos 4 dígitos")
 ]

const uploadFile = multer({storage}); 

//Solo los administradores deberían ingresar
router.get('/usuarios', authMiddleware, userController.usersList) // todos los usuarios
router.get('/usuario/:id', authMiddleware, userController.userDetail) // detalle de usuario


router.get('/login', guestMiddleware, userController.login); // login
router.post('/login', guestMiddleware, validations, userController.processLogin)

router.get('/registro', guestMiddleware, userController.registro);  // trae formulario registro
router.post('/registro', uploadFile.single('fotoPerfil'), userController.userCreate)  //  post de registro de usuarios graba data

router.get('/edicion-usuario/:id', userController.userEdit) // trae formulario edición
router.put('/edicion-usuario', uploadFile.single('fotoPerfil'), userController.userEditSave) // graba edición usuario
router.delete('/delete/:id', userController.userDelete) // borra usuario

router.get('/check', function (req,res){
    if (req.session.userToLogin== undefined){
        res.send("No estas logueado");
    }else{
        res.send("El usuario logueado es " + req.session.userToLogin.email);
    }});

router.get('/carrito', userController.productCart);
router.get('/quienesSomos', userController.quienesSomos);
router.get('/preguntasFrecuentes', userController.preguntasFrecuentes);
router.get('/contacto', userController.contacto);


module.exports = router;
const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const path = require('path')
const multer = require('multer');

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

const uploadFile = multer({storage}); 


router.get('/usuarios', userController.usersList) // todos los usuarios
router.get('/usuario/:id', userController.userDetail) // detalle de usuario

router.get('/login', userController.login); // login
router.post('/login', userController.processLogin)

router.get('/registro', userController.registro);  // trae formulario registro
router.post('/registro', uploadFile.single('fotoPerfil'), userController.userCreate)  //  post de registro de usuarios graba data

router.get('/edicion-usuario/:id', userController.userEdit) // trae formulario edición
router.put('/edicion-usuario', uploadFile.single('fotoPerfil'), userController.userEditSave) // graba edición usuario
router.delete('/delete/:id', userController.userDelete) // borra usuario

router.get('/carrito', userController.productCart);
router.get('/quienesSomos', userController.quienesSomos);
router.get('/preguntasFrecuentes', userController.preguntasFrecuentes);
router.get('/contacto', userController.contacto);


module.exports = router;
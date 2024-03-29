const { body } = require('express-validator');
const path = require('path');
const { nextTick } = require('process');

const validateRegister = [
    body('nombre').notEmpty().withMessage('Debes ingresar tu nombre').bail()
        .isLength( {min: 2} ).withMessage('El nombre debe tener al menos 2 caracteres'),
    body('apellido').notEmpty().withMessage('Debes ingresar tu apellido')
    .isLength( {min: 2} ).withMessage('El apellido debe tener al menos 2 caracteres'),
    body('email')
        .notEmpty().withMessage('Debes ingresar tu email').bail()
        .isEmail().withMessage('Debes ingresar un email válido'),
    body('telefono')
        .notEmpty().withMessage('Debes ingresar tu numero telefónico').bail()
        .isInt().withMessage('Debes ingresar un numero de teléfono válido'),
    body('domicilio').notEmpty().withMessage('Debes ingresar tu domicilio'),
    body('dni').notEmpty().withMessage('Debes ingresar tu DNI'),
    body('password')
        .notEmpty().withMessage('Debes ingresar una contraseña').bail()
        .isLength( { min: 8 } ).withMessage('La contraseña debe tener un mínimo de 8 caracteres').bail(),
    body('confirmPassword')
        .notEmpty().withMessage('Debes ingresar tu contraseña').bail()
        .custom( (value, {req} ) => {
        if ( value !== req.body.password) {
            throw new Error('La confirmación de contraseña no coincide con la contraseña')
        }
        return true;
    }),
    body('fotoPerfil')
        .custom((value, { req } ) => {
            let file = req.file;
            let acceptedExtensions = ['.jpg', '.png', '.jpeg', '.gif'];

            if (file) {
                let fileExtension = path.extname(file.originalname);

                if (!acceptedExtensions.includes(fileExtension)) {
                    throw new Error(`Las extensiones de archivo permitidas son ${acceptedExtensions.join(' y ')}`)
                } else if (acceptedExtensions.includes(fileExtension)) {
                    return true;
                }
                
            } 
            return true
    })
];

module.exports = validateRegister;
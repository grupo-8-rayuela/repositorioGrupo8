const { body } = require('express-validator');
const path = require('path');
const { nextTick } = require('process');

const validateUserUpdate = [
    body('nombre').notEmpty().withMessage('Debes ingresar un nombre'),
    body('apellido').notEmpty().withMessage('Debes ingresar un apellido'),
    body('email')
        .notEmpty().withMessage('Debes ingresar un email').bail()
        .isEmail().withMessage('Debes ingresar un email válido'),
    body('telefono')
        .notEmpty().withMessage('Debes ingresar un número telefónico').bail()
        .isInt().withMessage('Debes ingresar un número de teléfono válido'),
    body('domicilio').notEmpty().withMessage('Debes ingresar un domicilio'),
    body('fotoPerfil')
        .custom((value, { req } ) => {
            let file = req.file;
            let acceptedExtensions = ['.jpg', '.png'];

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

module.exports = validateUserUpdate;
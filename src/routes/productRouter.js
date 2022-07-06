const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');


router.get('/', (req, res) => {
    res.send('Hola');
})

router.get('/kit-musical', productController.kitmusical);

router.get('/alta-productos', productController.create);

router.post('/alta-productos', productController.guardar)


router.get('/alta-productos-SKU', productController.createSKU);

router.post('/alta-productos-SKU', productController.guardarSKU)


module.exports = router;
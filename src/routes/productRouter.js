const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const path=require('path')


router.get('/productos/', productController.productList);

router.get('/edad/:edadrecomendada', productController.getEdad)

router.get('/juguetes/:id', productController.productDetail);

router.get('/categorias/:categoria', productController.getCategory);

router.get('/crearProducto', productController.crearProducto );

router.post('/crearProducto',productController.guardar );
  


module.exports = router;
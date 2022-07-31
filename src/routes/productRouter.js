const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const path=require('path')


router.get('/productos/', productController.productList);

/********CONTROL PANEL PARA EDITAR/BORRAR PRODUCTOS***********/
router.get('/controlPanel', productController.editDelete);

/********PRODUCT LIST por categoria y edad***********/
router.get('/edad/:edadrecomendada', productController.getEdad);
router.get('/categorias/:categoria', productController.getCategory);


/********GET PRODUCT DETAIL***********/
router.get('/juguetes/:id', productController.productDetail);

/********CREATE A PRODUCT***********/
router.get('/crearProducto', productController.create );
router.post('/crearProducto',productController.saveNewProduct );
 
/********EDIT A PRODUCT***********/
router.get('/edit/:id', productController.edit );
router.put('/edit/:id', productController.saveEdit );

/********DELETE A PRODUCT***********/
router.delete('/:id' , productController.delete)

/********SEARCH A PRODUCT***********/
router.get('/search', productController.search);


module.exports = router;
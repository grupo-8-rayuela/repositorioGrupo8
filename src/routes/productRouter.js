const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const validateCreateForm = require('../middlewares/validateCreateProductForm');
const validateUpdateForm = require('../middlewares/validateUpdateProductForm');
const path=require('path')

const onlyAdminMiddleware = require('../middlewares/onlyAdminMiddleware');

router.get('/productos', productController.productList);

/********CONTROL PANEL PARA EDITAR/BORRAR PRODUCTOS***********/
router.get('/product-panel', onlyAdminMiddleware, productController.productPanel);

/********PRODUCT LIST por categoria y edad***********/
router.get('/edad/:edadrecomendada', productController.getEdad);
router.get('/categorias/:categoria', productController.getCategory);


/********GET PRODUCT DETAIL***********/
router.get('/juguetes/:id', productController.productDetail);

/********CREATE A PRODUCT***********/

router.get('/crear-producto', onlyAdminMiddleware, productController.create );
router.post('/crear-producto', validateCreateForm, productController.saveNewProduct );

 
/********EDIT A PRODUCT***********/
router.get('/edit/:id', onlyAdminMiddleware, productController.edit );
router.put('/edit/:id', validateUpdateForm, productController.saveEdit );

/********DELETE A PRODUCT***********/
router.delete('/:id' , productController.deleteProduct)

/********SEARCH A PRODUCT***********/
router.get('/search', onlyAdminMiddleware, productController.search);


module.exports = router;
const express = require('express');
const router = express.Router();
const userController = require('../../controllers/api/userController');

router.get('/api/users', userController.getUsers);
router.get('/api/users/:id', userController.userDetail);
router.get('/api/orders', userController.getOrders);
router.get('/api/sales', userController.salesByProduct)

module.exports = router;
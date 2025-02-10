const express = require('express');
const orderController = require('../controllers/order.controller');

const router = express.Router();

router.get("/", orderController.getOrders);
router.get("/:id", orderController.getSingleOrder);
router.post("/create", orderController.createOrder);

module.exports = router;

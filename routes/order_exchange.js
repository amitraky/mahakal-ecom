const express = require('express');
const orderExchangeController = require('../controllers/order.exchange.controller');

const router = express.Router();

router.get("/", orderExchangeController.getExchangeOrders);
router.get("/:id", orderExchangeController.getSingleExchangeOrder);
router.post("/create", orderExchangeController.createExchangeOrder);
router.put("/update/:status/:id", orderExchangeController.updateExchangeOrder);

module.exports = router;

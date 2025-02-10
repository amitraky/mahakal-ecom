const express = require('express');
const orderReturnController = require('../controllers/order.return.controller');

const router = express.Router();

router.get("/", orderReturnController.getReturnOrders);
router.get("/:id", orderReturnController.getSingleReturnOrder);
router.post("/create", orderReturnController.createReturnOrder);
router.put("/update/:status/:id", orderReturnController.updateReturnOrder);

module.exports = router;

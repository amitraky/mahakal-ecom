const models = require("../models");
function createOrder(req, res) {
  const post = {
    order_status: "Delivered",
    order_number: "ORD" + Date.now(),
    discounts_charges_id: 2,
    payment_mode: "COD",
    payment_status: "Paid",
    user_id: 1,
  };

  try {
   let data =  models.orders.create(post)
    res.send("Done")
    console.log("order created")
  } catch (error) {
    res.send({message:error.message})
  }
    
}

async function getOrders(req, res) {
  try {
    let orders = await models.orders.findAll();
    res.send(orders);
  } catch (error) {
    res.send({ message: error.message });
  }
}
async function getSingleOrder(req, res) {
  let pkId = req.params.id;
  let order = await models.orders.findByPk(pkId);
  res.send(order);
}

module.exports = {
  getSingleOrder,
  getOrders,
  createOrder,
};

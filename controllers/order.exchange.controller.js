const models = require("../models");


async function createExchangeOrder(req, res) {
  const post = {
    order_id: 1,
    product_id: 52,
    exchange_quantity: 1,
    exchange_amount: 850,
    taxes: 150,
    total_amount: 850,
    status: 'Pending',
  };

  try {
   let data = await models.order_exchange.create(post)
   
    res.send(data._previousDataValues)
    console.log("order created")
  } catch (error) {
    res.status(400).send({message:error.message})
  }
    
}

async function createProductOrders(order) {

    let orderDetails = await models.orders.findByPk(order.order_id);
  
  const post = {
    product_variant_id: 1,
    product_id: order.product_id,
    order_id: order.order_id,
    quantity: 1,
    tax_amount_id: 1,
    transaction_type: orderDetails.payment_mode,
    address_id: 1,
    logistics_tracking_link: "http:localhost/order/traking?id=1",
  };

  try {
    console.log("order created")
   return  await models.order_exchange.create(post)
  } catch (error) {
    return false
  }
    
}

async function getExchangeOrders(req, res) {
  try {
    let orders = await models.order_exchange.findAll();
    res.send(orders);
  } catch (error) {
    res.status(400).send({ message: error.message });
  }
}
async function getSingleExchangeOrder(req, res) {
  let pkId = req.params.id;
  let order = await models.order_exchange.findByPk(pkId);
  res.send(order);
}


async function updateExchangeOrder(req, res) {
  let pkId = req.params.id;
  let status = req.params.status;
  let order = await models.order_exchange.findByPk(pkId);
  if(!order) return res.status(400).send({message:"Invalid order id"})
    //validation for order pending or already return etc.

  if(!['Pending','Processed','Cancelled'].includes(status)){
    return res.status(400).send({message:"status should be 'Pending','Processed','Cancelled'"})
  }

  let fromDate = new Date(order._previousDataValues.created_at).getTime()
  let to = Date.now();
  let diff = to - fromDate;
  let diffInMinuts = diff/(1000*60);
  let userRole =  req.headers['x-user-type'];
  
 
  if(!userRole){
    return res.status(400).send({message:"x-user-type  header filed is required ? example 1=admin,2=seller"})
  }

  //after  grator then 1 hour only admin can modified
  if(diffInMinuts>59 && userRole >= 2){
    return res.status(400).send({message:"You don't have permission to take access !"})
  }
  
  try {
    console.log(status)
    let data = await createProductOrders(order._previousDataValues)
    models.order_exchange.update({status:status},{where:{id:pkId}})  
    res.send(`Order ${status} success`);
  } catch (error) {
    console.log(error)
    res.status(500).send({message:error.message})
  }
  
}




module.exports = {
  getSingleExchangeOrder,
  getExchangeOrders,
  createExchangeOrder,
  updateExchangeOrder
};

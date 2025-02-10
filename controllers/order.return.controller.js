const models = require("../models");


async function createReturnOrder(req, res) {
  const post = {
    order_id: 1,
    product_id: 52,
    return_quantity: 1,
    return_amount: 850,
    taxes: 150,
    total_amount: 850,
    status: 'Pending',
  };

  try {
   let data = await models.order_returns.create(post)
   
    res.send(data._previousDataValues)
    console.log("order created")
  } catch (error) {
    res.status(400).send({message:error.message})
  }
    
}

async function getReturnOrders(req, res) {
  try {
    let orders = await models.order_returns.findAll();
    res.send(orders);
  } catch (error) {
    res.status(400).send({ message: error.message });
  }
}
async function getSingleReturnOrder(req, res) {
  let pkId = req.params.id;
  let order = await models.order_returns.findByPk(pkId);
  res.send(order);
}


async function updateReturnOrder(req, res) {
  let pkId = req.params.id;
  let status = req.params.status;
  let order = await models.order_returns.findByPk(pkId);
  if(!order) return res.status(400).send({message:"Invalid order id"})
    //validation for order pending or already return etc.

  if(!['Pending','Approved','Rejected'].includes(status)){
    return res.status(400).send({message:"status should be 'Pending','Approved','Rejected'"})
  }

  let fromDate = new Date(order._previousDataValues.created_at).getTime()
  let to = Date.now();
  let diff = to - fromDate;
  let diffInMinuts = diff/(1000*60);
  let userRole =  req.headers['x-user-type'];

  if(!userRole){
    return res.status(400).send({message:"x-user-type  header filed is required ? example 1=admin,2=seller"})
  }
  if(diffInMinuts>59 && userRole >= 2){
    return res.status(400).send({message:"You don't have permission to take access !"})
  }

  models.order_returns.update({status:status},{where:{id:pkId}})  
  res.send(`Order ${status} success`);
}




module.exports = {
  getSingleReturnOrder,
  getReturnOrders,
  createReturnOrder,
  updateReturnOrder
};

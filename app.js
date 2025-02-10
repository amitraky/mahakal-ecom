const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');

const ordersRoute = require('./routes/orders');
const ordersReturnRoute = require('./routes/order_returns');
const ordersExchagneRoute = require('./routes/order_exchange');
const app = express();

app.use(morgan("dev"));
app.use(bodyParser.json());

app.use("/orders_return", ordersReturnRoute);
app.use("/orders_exchange", ordersExchagneRoute);
app.use("/orders", ordersRoute);

app.listen(8000,()=>console.log("server Running on port 8000"))
module.exports = app;
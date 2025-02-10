const {sequelize,DataTypes} = require("../config/db")
const orders = require("./Order")(sequelize,DataTypes)
const order_exchange = require("./order_exchange")(sequelize,DataTypes)
const order_returns = require("./order_return")(sequelize,DataTypes)
const product_orders = require("./product_orders")(sequelize,DataTypes)

module.exports = {
  orders,
  order_exchange,
  order_returns,
  product_orders
}
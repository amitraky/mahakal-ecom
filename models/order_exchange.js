
module.exports = (sequelize, DataTypes) => {
  const Order = sequelize.define('order_exchange', {
    order_id: DataTypes.INTEGER,
    product_id: DataTypes.INTEGER,
    exchange_quantity: DataTypes.INTEGER,
    exchange_amount: DataTypes.INTEGER,
    taxes: DataTypes.INTEGER,
    discount: DataTypes.INTEGER,
    total_amount: DataTypes.INTEGER,
    status: DataTypes.STRING
  },{createdAt: 'created_at',updatedAt: 'updated_at',});  
  return Order;
};

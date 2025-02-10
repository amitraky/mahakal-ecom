
module.exports = (sequelize, DataTypes) => {
  const Order = sequelize.define('order_returns', {
    order_id: DataTypes.INTEGER,
    product_id: DataTypes.INTEGER,
    return_quantity: DataTypes.INTEGER,
    return_amount: DataTypes.INTEGER,
    taxes: DataTypes.INTEGER,
    discount: DataTypes.INTEGER,
    total_amount: DataTypes.INTEGER,
    status: DataTypes.STRING
  },{createdAt: 'created_at',updatedAt: 'updated_at',});  
  return Order;
};

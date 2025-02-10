
module.exports = (sequelize, DataTypes) => {
  const Order = sequelize.define('orders', {
    order_status: DataTypes.TEXT,
    order_number: DataTypes.STRING,
    discounts_charges_id: DataTypes.STRING,
    payment_mode: DataTypes.STRING,
    payment_status: DataTypes.STRING,
    user_id: DataTypes.INTEGER
  },{createdAt: 'created_at',updatedAt: 'updated_at',});  
  return Order;
};

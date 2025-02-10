
module.exports = (sequelize, DataTypes) => {
  const Order = sequelize.define('orders', {
    product_variant_id: DataTypes.INTEGER,
    product_id: DataTypes.INTEGER,
    order_id: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER,
    tax_amount_id: DataTypes.INTEGER,
    transaction_type: DataTypes.STRING,
    address_id: DataTypes.INTEGER,
    logistics_tracking_link: DataTypes.TEXT,
    coupon_discount: DataTypes.INTEGER,
  },{createdAt: 'created_at',updatedAt: 'updated_at',});  
  return Order;
};

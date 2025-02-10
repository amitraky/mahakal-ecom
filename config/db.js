const {Sequelize,DataTypes} = require("sequelize");


const sequelize = new Sequelize("indiazona_db","root","",{
    dialect:"mysql"
})
let db = {};
async function connect(){
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
      }
}
connect()
db.sequelize = sequelize;
db.DataTypes = DataTypes;


module.exports = db;

  
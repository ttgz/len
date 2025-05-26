const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Product = sequelize.define('Product', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    price: {
        type: DataTypes.INTEGER
    },
    search: DataTypes.STRING,
    image: {
        type: DataTypes.TEXT
    }
}, {
    timestamps: false
});

module.exports = Product;
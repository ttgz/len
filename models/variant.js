const { DataTypes } = require('sequelize');
const sequelize = require('./index');
const Product = require('./product');

const Variant = sequelize.define('Variant', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    price: DataTypes.INTEGER,
    image: DataTypes.TEXT,
    product_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
}, {

    timestamps: false,
    tableName: 'variants',
    underscored: true
});

Product.hasMany(Variant, { foreignKey: 'product_id' });
Variant.belongsTo(Product, { foreignKey: 'product_id' });

module.exports = Variant;
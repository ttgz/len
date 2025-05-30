const { DataTypes } = require('sequelize');
const sequelize = require('./index');
const { generateSlugAndSearchKey } = require('../untils/slugHelper');

const Product = sequelize.define('Product', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    slug: {
        type: DataTypes.STRING,
        unique: true
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


Product.beforeCreate((product) => {
    const { slug, search } = generateSlugAndSearchKey(product.name);
    product.slug = slug;
    product.search = search;
    console.log(search);
});

Product.beforeUpdate((product) => {
    const { slug, search } = generateSlugAndSearchKey(product.name);
    product.slug = slug;
    product.search = search;
});

module.exports = Product;
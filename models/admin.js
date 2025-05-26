const { DataTypes } = require('sequelize');
const sequelize = require('./index');

const Admin = sequelize.define('Admin', {
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    password: DataTypes.STRING
});

module.exports = Admin;
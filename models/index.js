const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('len', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    logging: false, // Tắt log nếu muốn gọn
    dialectOptions: {
        charset: 'utf8mb4', // hỗ trợ tiếng Việt
    }
});

module.exports = sequelize;

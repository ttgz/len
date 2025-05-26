const db = require('better-sqlite3')('len.db');
const Product = require('../models/product');
const Variant = require('../models/variant');

async function variantsByProductId(req, res) {
    const id = req.params.id;

    try {
        // Kiểm tra sản phẩm có tồn tại không
        const product = await Product.findByPk(id);
        if (!product) {
            return res.status(404).json({ error: 'Không tìm thấy sản phẩm' });
        }

        // Lấy danh sách biến thể theo productId
        const variants = await Variant.findAll({
            where: { product_id: id },

        });

        res.json({
            product,
            variants
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Lỗi khi lấy danh sách biến thể của sản phẩm' });
    }
}

async function allProducts(req, res) {
    try {
        const products = await Product.findAll({
            order: [['created_at', 'DESC']]
        }
        ); // Sequelize tương đương Eloquent::all()
        res.json(products);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Lỗi khi lấy danh sách sản phẩm' });
    }
}



module.exports = { variantsByProductId, allProducts };


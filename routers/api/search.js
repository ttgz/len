

const { Op } = require('sequelize');
const Variant = require('../../models/variant');
const Product = require('../../models/product');
const productsRouter = require('./products');
async function searchRouter(req, res) {
    const keyword = req.query.q;
    if (!keyword) {
        productsRouter.allProducts(req, res);
        return;
    }

    try {
        const results = await Product.findAll({
            where: {
                [Op.or]: [
                    { name: { [Op.like]: `%${keyword}%` } },
                    { search: { [Op.like]: `%${keyword}%` } }
                ]
            }

        }
        );

        res.json(results);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Lỗi khi tìm kiếm' });
    }
}

async function searchVariants(req, res) {
    const keyword = req.query.q;
    const productId = req.query.id;

    try {
        const results = await Variant.findAll({
            where: {
                name: { [Op.like]: `%${keyword}%` },
                product_id: productId

            },
        }
        );

        res.status(200).json(results);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Lỗi khi tìm kiếm' });
    }

}


module.exports = { searchRouter, searchVariants };
const Product = require('../../models/product');
const Variant = require('../../models/variant');
const express = require('express');
const router = express.Router();

router.get('/', async (req, res) => {
    const totalProduct = await Product.count();

    return res.status(200).json({ products: totalProduct });
})

module.exports = router;
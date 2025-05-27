const Product = require('../../models/product');
const Variant = require('../..//models/variant');
const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');


const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/images/') // thư mục lưu file
    },
    filename: function (req, file, cb) {
        const ext = path.extname(file.originalname);
        cb(null, Date.now() + '-' + (Math.random() * (10)).toFixed(0) + ext);
    }
});

const upload = multer({ storage: storage });

router.post('/', upload.single('image'), async (req, res) => {
    console.log(req.params.id);
    console.log(req.body);
    console.log(req.file);
    try {
        const data = {
            name: req.body.name,
            price: req.body.price,
            product_id: req.body.productId,
            image: req.file ? '/public/images/' + req.file.filename : null,
        }
        await Variant.create(data);
        res.status(201).json({ message: 'Thêm biến thể thành công' });
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: 'Lỗi hệ thống' });
    }
});


router.put('/:id', upload.single('image'), async (req, res) => {

    try {

        const data = {
            name: req.body.name,
            price: req.body.price,
        }
        if (req.file) {
            console.log(req.file);
            fileName = '/public/images/' + req.file.filename;
            data.image = fileName
        }
        await Variant.update(data, { where: { id: req.params.id } });
        res.status(200).json('message', 'cập nhật biến thể thành công');
    } catch (e) {
        console.log(e);
        res.status(500).json({ 'error': 'lỗi hệ thống' });
    }
});


router.get('/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const variant = await Variant.findByPk(id);
        res.status(200).json(variant);
    } catch (e) {
        console.log(e);
        res.status(500).json({ message: 'lỗi hệ thống' });
    }
});

router.delete('/:id', async (req, res) => {
    try {
        const id = req.params.id;
        await Variant.destroy({
            where: { id }
        });
        res.status(200).json({ message: 'Xóa biến thể thành công' });
    } catch (e) {
        console.log(e);
        res.status(500).json({ message: 'lỗi hệ thống' });
    }
});

module.exports = router;
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


router.post('/products', upload.single('image'), async (req, res) => {
    console.log(req.body.name, req.file.filename);
    try {
        const data = {
            name: req.body.name,
            price: req.body.price,
            search: req.body.search,
            image: '/public/images/' + req.file.filename
        }
        const product = await Product.create(data);
        if (product)
            res.status(201).json('message', 'thêm sản phẩm thành công');
    } catch (e) {
        console.log(e);
        res.status(500).json('error', 'Lỗi hệ thống');
    }
});


router.put('/products/:id', upload.single('image'), async (req, res) => {
    try {
        if (req.file) {
            fileName = '/public/images/' + req.file.filename;
            await Product.update({ image: 'public/images/' + fileName }, { where: { id: req.body.id } });
        }
        const data = {
            name: req.body.name,
            price: req.body.price,
            search: req.body.search,
        }
        await Product.update(data, { where: { id: req.body.id } });
        res.status(200).json('message', 'cập nhật thành công');
    } catch (e) {
        console.log(e);
        res.status(500).json({ 'error': 'lỗi hệ thống' });
    }
});

router.delete('/products/:id', async (req, res) => {
    try {
        const id = req.params.id
        await Product.destroy({
            where: {
                id: id
            }
        });
        res.status(200).json({message: 'Xóa thành công'});
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: 'Lỗi hệ thống' });
    }
});

module.exports = router;

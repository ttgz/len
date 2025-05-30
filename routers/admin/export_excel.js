// routes/downloadExcel.js

const express = require('express');
const router = express.Router();
const ExcelJS = require('exceljs');
const Product = require('../../models/product');
const Variant = require('../../models/variant');

router.get('/download-excel', async (req, res) => {
    try {
        // Tạo workbook và worksheet
        const workbook = new ExcelJS.Workbook();
        const worksheet = workbook.addWorksheet('Sản phẩm');

        // Thêm tiêu đề cột
        worksheet.columns = [
            { header: 'ID', key: 'id', width: 10 },
            { header: 'Tên sản phẩm', key: 'name', width: 30 },
            { header: 'Giá', key: 'price', width: 20 },
        ];

        const data = await Product.findAll();

        // Dữ liệu giả

        // Ghi dữ liệu
        data.forEach((item, index) => {
            worksheet.addRow({
                id: item.id,
                name: item.name,
                price: item.price,
            });
        });

        // Thiết lập header để tải file
        res.setHeader(
            'Content-Type',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        );
        res.setHeader(
            'Content-Disposition',
            'attachment; filename="sanpham.xlsx"'
        );

        // Ghi ra response
        await workbook.xlsx.write(res);
        res.end();
    } catch (err) {
        console.error('Lỗi tạo file Excel:', err);
        res.status(500).json({ error: 'Không tạo được file Excel' });
    }
});


router.get('/download-excel-variants', async (req, res) => {
    try {
        // Tạo workbook và worksheet
        const workbook = new ExcelJS.Workbook();
        const worksheet = workbook.addWorksheet('Biến thể');

        // Thêm tiêu đề cột
        worksheet.columns = [
            { header: 'ID', key: 'id', width: 10 },
            { header: 'Tên biến thể', key: 'name', width: 30 },
            { header: 'Giá', key: 'price', width: 20 },
            { header: 'Mã sản phẩm', key: 'product_id', width: 50 }
        ];

        const data = await Variant.findAll();

        // Dữ liệu giả

        // Ghi dữ liệu
        data.forEach((item, index) => {
            worksheet.addRow({
                id: item.id,
                name: item.name,
                price: item.price,
                product_id: item.product_id
            });
        });

        // Thiết lập header để tải file
        res.setHeader(
            'Content-Type',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        );
        res.setHeader(
            'Content-Disposition',
            'attachment; filename="bienthe.xlsx"'
        );

        // Ghi ra response
        await workbook.xlsx.write(res);
        res.end();
    } catch (err) {
        console.error('Lỗi tạo file Excel:', err);
        res.status(500).json({ error: 'Không tạo được file Excel' });
    }
});


module.exports = router;

const express = require('express');
const router = express.Router();
const multer = require('multer');
const ExcelJS = require('exceljs');

// Nếu bạn dùng Sequelize
const Product = require('../../models/product'); // thay bằng model thực tế

// Cấu hình multer – lưu tạm file lên ổ đĩa
const upload = multer({ dest: 'uploads/' });

router.post('/import-excel', upload.single('file'), async (req, res) => {
    try {
        if (!req.file) {
            return res.status(400).json({ error: 'Chưa chọn file Excel' });
        }
        console.log(req.file);

        const workbook = new ExcelJS.Workbook();
        await workbook.xlsx.readFile(req.file.path);

        const worksheet = workbook.getWorksheet(1); // sheet đầu tiên
        const imported = [];

        worksheet.eachRow((row, rowNumber) => {
            if (rowNumber === 1) return; // bỏ qua dòng tiêu đề

            const [stt, name, price] = row.values.slice(1); // bỏ index 0
            imported.push({ name, price });
        });

        // Lưu vào DB (giả sử bạn dùng Sequelize)
        for (const item of imported) {
            console.log(item);
            await Product.create(item);
        }

        res.json({ message: 'Import thành công', count: imported.length });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Lỗi khi import dữ liệu' });
    }
});

module.exports = router;
const express = require('express');
const bcrypt = require('bcrypt');
const router = express.Router();
const Admin = require('../../models/admin');
const routerProduct = require('./product');

function isAdminAuthenticated(req, res, next) {
    if (req.session.adminId) {
        return next();
    }
    return res.redirect('/admin/login');
}


router.use('/', routerProduct);
router.post('/login', async (req, res, next) => {
    const { name, password } = req.body;

    const admin = await Admin.findOne({ where: { name } });

    if (!admin) {
        return res.status(401).json({ error: 'Sai tài khoản' });
    }

    const match = await bcrypt.compare(password, admin.password);
    if (!match) {
        return res.status(401).json({ error: 'Sai mật khẩu' });
    }

    // Lưu session
    req.session.adminId = admin.id;
    req.session.adminname = admin.name;

    res.redirect('/admin');
});

router.get('/logout', (req, res) => {
    req.session.destroy(() => {
        res.json({ message: 'Đã đăng xuất' });
    });
    res.render('admin/login');
});

router.get('/login', (req, res) => {
    res.render('admin/login');
})

router.get('/', isAdminAuthenticated, (req, res) => {
    res.render('admin/index');
})

module.exports = router;
const express = require('express');
const bcrypt = require('bcrypt');
const router = express.Router();
const Admin = require('../../models/admin');
const routerProduct = require('./product');
const routerVariant = require('./variant');

function isAdminAuthenticated(req, res, next) {
    if (req.session.adminId) {
        return next();
    }
    return res.redirect('/admin/login');
}

router.get('/orders', isAdminAuthenticated, (req, res) => {
    res.render('pages/order', {
        title: 'Quản lý đơn hàng',
        subTitle: 'Quản lý đơn hàng',
        currentPage: 'orders'
    });
});

router.get('/', isAdminAuthenticated, (req, res) => {
    res.render('pages/dashboard', {
        title: 'Dashboard',
        subTitle: 'Dasboard',
        currentPage: 'dashboard'
    })
})
router.use('/variants', routerVariant);
router.use('/', routerProduct);

router.post('/login', async (req, res, next) => {
    const { name, password } = req.body;

    const admin = await Admin.findOne({ where: { name } });

    if (!admin) {
        req.session.message = "Sai mật khẩu";
        return res.redirect('/admin/login');
    }

    const match = await bcrypt.compare(password, admin.password);
    if (!match) {
        req.session.message = "Sai mật khẩu";
        return res.redirect('/admin/login');
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
    const message = req.session.message;
     delete req.session.message;
    res.render('admin/login', {
        layout: false,
        message
    });
})

router.get('/products', isAdminAuthenticated, (req, res) => {
    res.render('pages/product', { title: 'Quản lý sản phẩm', subTitle: 'Quản lý len và phụ kiện', currentPage: 'prouducts' });
})

module.exports = router;
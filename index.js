const express = require('express');
require('dotenv').config();
const app = express();
const path = require('path')
const port = 3000;
const routerSearch = require('./routers/search');
const routerProduct = require('./routers/products');
const sequelize = require('./models');
const Product = require('./models/product');
const Variant = require('./models/variant');
const importRouter = require('./routers/admin/import_excel');
const exportRouter = require('./routers/admin/export_excel');
const session = require('express-session');
const bcrypt = require('bcrypt');
const Admin = require('./models/admin');
const authRouter = require('./routers/admin/auth');
app.set('view engine', 'ejs');

app.use(session({
    secret: 'dong',  // đổi thành chuỗi bí mật riêng của bạn
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: 24 * 60 * 60 * 1000 // 1 ngày
    }
}));




app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use('/public', express.static(path.join(__dirname, 'public')));
app.use('/', importRouter);
app.use('/export', exportRouter);

app.get('/env.js', (req, res) => {
    res.setHeader('Content-Type', 'application/javascript');
    res.send(`window.ENV = {
        API_URL: "${process.env.APP_URL}"
    };`);
});
app.get('/variants/search', (req, res) => routerSearch.searchVariants(req, res));
app.get('/products/:id', (req, res) => routerProduct.variantsByProductId(req, res));
app.get('/products', (req, res) => routerProduct.allProducts(req, res));
app.get('/search', (req, res) => routerSearch.searchRouter(req, res));
app.get('/', (req, res) => {
    res.render('index');
});


app.use('/admin', authRouter);





app.listen(port, async () => {
    try {
        console.log(process.env.APP_URL);
        await sequelize.sync(); // Sync DB nếu cần
        console.log('Server chạy tại http://localhost:3000');
    } catch (err) {
        console.error('Lỗi kết nối DB:', err);
    }
});

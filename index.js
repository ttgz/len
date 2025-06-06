const express = require('express');
require('dotenv').config();
const app = express();
const path = require('path')
const routerSearch = require('./routers/api/search');
const routerProduct = require('./routers/api/products');
const sequelize = require('./models');
const importRouter = require('./routers/admin/import_excel');
const exportRouter = require('./routers/admin/export_excel');
const session = require('express-session');
const authRouter = require('./routers/admin/auth');
const exphbs = require('express-handlebars');
const mainRouterApi = require('./routers/api/index');



app.set('view engine', 'hbs');


app.engine('hbs', exphbs.engine({
    extname: '.hbs',
    defaultLayout: 'main', // layout mặc định: views/layouts/main.hbs
    layoutsDir: 'views/layouts',
    partialsDir: 'views/partials',
    helpers: {
        eq: function (a, b) {
            return a === b;
        },

        section: function (name, options) {
            if (!this._sections) this._sections = {};
            this._sections[name] = options.fn(this);
            return null;
        }
    }
}));
app.use(session({
    secret: 'dong',  // đổi thành chuỗi bí mật riêng của bạn
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: 24 * 60 * 60 * 1000,
        secure: false,
        httpOnly: true,
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


app.use('/api', mainRouterApi);
app.get('/api/variants/search', (req, res) => routerSearch.searchVariants(req, res));
app.get('/api/products/:id', (req, res) => routerProduct.variantsByProductId(req, res));
app.get('/api/products', (req, res) => routerProduct.allProducts(req, res));
app.get('/api/search', (req, res) => routerSearch.searchRouter(req, res));
app.get('/', (req, res) => {
    res.render('index', {
        layout: false,
    });
});

app.use('/admin', authRouter);





app.listen(80, async () => {
    try {
        console.log(process.env.APP_URL);
        await sequelize.sync(); // Sync DB nếu cần
        console.log('Server chạy tại http://localhost');
    } catch (err) {
        console.error('Lỗi kết nối DB:', err);
    }
});

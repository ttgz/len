const express = require('express');
const router = express.Router();
const routerDashboard = require('./dashboard');

router.use('/dashboard', routerDashboard);

module.exports = router;


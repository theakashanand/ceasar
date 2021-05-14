/* routes/measureRoutes.js */

var express = require('express');
var router = express.Router();
var measurements = require('../controllers/measureControllers');

var passport = require('passport')
var basicAuth = passport.authenticate('basic', { session: false })

router.post('/', basicAuth, measurements.postMeasurement);
router.get('/latest/', basicAuth, measurements.getLatestMeasurement);

module.exports = router;

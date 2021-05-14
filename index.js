/* index.js */
require('dotenv').config({ path: __dirname + '/.env' })
var pool = require('./config/database');
const express = require('express')
const app = express()
const port = 3000
const passport = require('./config/passport');
const measurementsRouter = require('./routes/measureRoutes');

app.use(express.json());

app.use('/measurements', measurementsRouter);

app.listen(port, () => {
  console.log(`Habitat is up and running at http://localhost:${port}`)
})

require('dotenv').config({ path: __dirname + '/.env' })
const pool = require('./config/database');

const express = require('express')
const app = express()
const port = 3000
const measurementsRouter = require('./routes/measureRoutes');

app.use(express.json());

app.use('/measurements', measurementsRouter);

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'web_app_database2',
  password: 'admin',
  port: 5431,
  charset: 'utf8', // Agrega esta línea
});

module.exports = pool;

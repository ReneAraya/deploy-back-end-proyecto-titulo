// restore.js
const fs = require('fs');
const pool = require('./db');

const sql = fs.readFileSync('./db/web_app_database2_plain.sql').toString();

(async () => {
  try {
    await pool.query(sql);
    console.log('✅ Base de datos restaurada exitosamente en Render');
  } catch (err) {
    console.error('❌ Error al restaurar la base:', err);
  } finally {
    pool.end();
  }
})();

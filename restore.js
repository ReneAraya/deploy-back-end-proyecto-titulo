// restore.js
const fs = require('fs');
const pool = require('./db');

(async () => {
  try {
    const sql = fs.readFileSync('./DB/web_app_database2_plain.sql', 'utf8');
    console.log('⏳ Restaurando base de datos...');
    await pool.query(sql);
    console.log('✅ Base de datos restaurada correctamente.');
  } catch (err) {
    console.error('❌ Error al restaurar la base de datos:', err.message);
  } finally {
    pool.end();
  }
})();

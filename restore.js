// restore.js
const fs = require('fs');
const pool = require('./db');

(async () => {
  try {
    console.log('⏳ Iniciando restauración de la base de datos...');

    const sql = fs.readFileSync('./DB/web_app_database2_plain.sql', 'utf8');

    // Dividir el archivo en sentencias separadas por punto y coma
    const statements = sql
      .split(/;\s*$/m)
      .map(s => s.trim())
      .filter(s => s.length > 0);

    for (const statement of statements) {
      try {
        await pool.query(statement);
      } catch (innerErr) {
        console.warn('⚠️ Error en sentencia, se continúa:', innerErr.message);
      }
    }

    console.log('✅ Restauración completada con éxito.');
  } catch (err) {
    console.error('❌ Error al restaurar la base de datos:', err.message);
  } finally {
    await pool.end();
  }
})();

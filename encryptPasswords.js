const bcrypt = require('bcrypt');
const pool = require('./db'); // Asegúrate de que esta línea apunta al archivo correcto donde está configurada tu conexión a la base de datos

const encriptarContrasenas = async () => {
  try {
    // Selecciona todas las contraseñas actuales que no están encriptadas
    const result = await pool.query('SELECT id, contrasena FROM usuarios');
    
    for (const usuario of result.rows) {
      const hashedPassword = await bcrypt.hash(usuario.contrasena, 10);

      // Actualiza cada contraseña con la versión encriptada
      await pool.query(
        'UPDATE usuarios SET contrasena = $1 WHERE id = $2',
        [hashedPassword, usuario.id]
      );
    }

    console.log('Contraseñas encriptadas correctamente');
  } catch (error) {
    console.error('Error al encriptar las contraseñas:', error);
  } finally {
    // Cierra la conexión a la base de datos cuando se termine
    await pool.end();
  }
};

// Llama a la función para encriptar contraseñas
encriptarContrasenas();

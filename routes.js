const express = require('express');
const router = express.Router();
const pool = require('./db');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const cors = require('cors');
const axios = require('axios');
const { readFileSync } = require('fs');
const path = require('path');
const nodemailer = require('nodemailer');
const fs = require('fs');

// Cargar la clave secreta JWT desde el entorno
const JWT_SECRET = process.env.JWT_SECRET;

// =====================
// Configuración CORS
// =====================
router.use(cors({ origin: 'http://localhost:3000' }));

// =====================
// Ruta para la raíz
// =====================
router.get('/', (req, res) => {
  res.send('Backend funcionando correctamente');
});

// =====================
// Insertar un usuario administrador
// =====================

// Añade el administrador general con contraseña encriptada
async function addAdminUser() {
  try {
    // Encripta la contraseña antes de insertarla
    const hashedPassword = await bcrypt.hash('Postulacion.ayudantias.EII.2025', 10);
    
    // Inserta el usuario administrador en la base de datos
    await pool.query(
      'INSERT INTO usuarios (nombre, email, contrasena, rol_id) VALUES ($1, $2, $3, $4) ON CONFLICT (email) DO NOTHING',
      ['Administrador General', 'postulacion.ayudantias.eii@pucv.cl', hashedPassword, 1]
    );
    console.log('Administrador general añadido con éxito.');
  } catch (error) {
    console.error('Error al añadir el administrador general:', error);
  }
}

// Ejecuta la función para añadir el administrador general
addAdminUser();

// =====================
// Rutas para inicio de sesion
// =====================

// Función para generar el token JWT
function generarToken(usuario) {
  const payload = {
    id: usuario.id,
    nombre: usuario.nombre,
    email: usuario.email,
    rol_id: usuario.rol_id,
  };
  
  // Generar el token usando jsonwebtoken
  return jwt.sign(payload, JWT_SECRET, { expiresIn: '10m' }); // Token válido por 20 minutos
}

// Middleware para verificar el token JWT
function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.sendStatus(401);

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
}

// Middleware para verificar el rol del usuario
function authorizeRole(role) {
  return (req, res, next) => {
    if (req.user.rol_id !== role) {
      return res.status(403).send('Acceso denegado');
    }
    next();
  };
}

// Ruta para iniciar sesión
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    // Paso 1: Verifica si el email está registrado
    const result = await pool.query('SELECT * FROM usuarios WHERE email = $1', [email]);
    
    if (result.rows.length === 0) {
      console.error('Usuario no encontrado para el email:', email);
      return res.status(401).json({ message: 'Correo incorrecto o usuario no registrado.' });
    }

    const usuario = result.rows[0];

    // Paso 2: Comparar contraseñas usando bcrypt
    const passwordMatch = await bcrypt.compare(password, usuario.contrasena);
    
    if (!passwordMatch) {
      console.error('Contraseña incorrecta para el usuario:', email);
      return res.status(401).json({ message: 'Contraseña incorrecta' });
    }

    // Paso 3: Generar token JWT
    try {
      const token = generarToken(usuario);  // Usar la función para generar el token
      res.json({ token });
    } catch (tokenError) {
      console.error('Error al generar el token:', tokenError);
      res.status(500).json({ message: 'Error al generar el token' });
    }
    
  } catch (error) {
    console.error('Error al intentar hacer login:', error);
    res.status(500).json({ message: 'Error al intentar hacer login' });
  }
});

// Rutas protegidas según el rol del usuario
// Obtener la lista de ramos solo para profesores
router.get('/profesor/ramos', authenticateToken, authorizeRole(2), async (req, res) => {
  const profesorId = req.user.id;

  try {
    const result = await pool.query(
      `SELECT r.* 
       FROM ramos r
       JOIN profesores_ramos pr ON r.id = pr.ramo_id
       WHERE pr.profesor_id = $1`,
      [profesorId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener los ramos del profesor:', error);
    res.status(500).send('Error al obtener los ramos del profesor');
  }
});

// Ruta para administradores - Gestionar usuarios (solo accesible para administradores)
router.get('/admin/usuarios', authenticateToken, authorizeRole(1), async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM usuarios');
    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener los usuarios:', error);
    res.status(500).send('Error al obtener los usuarios');
  }
});


// =====================
// Rutas para Carreras
// =====================

// Obtener todas las carreras
router.get('/carreras', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM carreras');
    res.setHeader('Content-Type', 'application/json; charset=utf-8');
    res.json(result.rows);
  } catch (err) {
    console.error('Error al obtener las carreras:', err.message);
    res.status(500).send('Error al obtener las carreras');
  }
});

// =====================
// Rutas para Ramos
// =====================

// Obtener ramos por carrera utilizando carrera_id
router.get('/ramos/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query(
      `SELECT r.*
       FROM ramos r
       JOIN carreras c ON r.carrera_id = c.id
       WHERE c.id = $1`,
      [id]
    );
    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'No se encontraron ramos para esta carrera' });
    }
    res.setHeader('Content-Type', 'application/json; charset=utf-8');
    res.json(result.rows);
  } catch (err) {
    console.error('Error al obtener los ramos:', err.message);
    res.status(500).send('Error al obtener los ramos');
  }
});


// Obtener profesores asignados a un ramo por carrera
router.get('/ramos/:ramo_id/carrera/:carrera_id/profesores', async (req, res) => {
  const { ramo_id, carrera_id } = req.params;
  try {
    const result = await pool.query(
      `SELECT u.id, u.nombre, u.email
       FROM usuarios u
       JOIN profesores_ramos pr ON u.id = pr.profesor_id
       WHERE pr.ramo_id = $1 AND pr.carrera_id = $2`,
      [ramo_id, carrera_id]
    );
    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener profesores asignados:', error);
    res.status(500).send('Error al obtener profesores asignados');
  }
});

// Asignar un profesor a un ramo en una carrera específica
router.post('/ramos/:ramo_id/carrera/:carrera_id/asignar-profesor', async (req, res) => {
  const { ramo_id, carrera_id } = req.params;
  const { profesor_id } = req.body;

  try {
    const checkExisting = await pool.query(
      'SELECT * FROM profesores_ramos WHERE ramo_id = $1 AND profesor_id = $2 AND carrera_id = $3',
      [ramo_id, profesor_id, carrera_id]
    );

    if (checkExisting.rowCount > 0) {
      return res.status(400).json({ message: 'El profesor ya está asignado a este ramo para esta carrera' });
    }

    await pool.query(
      'INSERT INTO profesores_ramos (ramo_id, profesor_id, carrera_id) VALUES ($1, $2, $3)',
      [ramo_id, profesor_id, carrera_id]
    );

    res.status(201).json({ message: 'Profesor asignado correctamente' });
  } catch (error) {
    console.error('Error al asignar el profesor al ramo:', error);
    res.status(500).json({ error: 'Error al asignar el profesor al ramo' });
  }
});

// Eliminar un profesor asignado a un ramo en una carrera específica
router.delete('/ramos/:ramo_id/carrera/:carrera_id/eliminar-profesor/:profesor_id', async (req, res) => {
  const { ramo_id, carrera_id, profesor_id } = req.params;
  try {
    await pool.query(
      `DELETE FROM profesores_ramos
       WHERE ramo_id = $1 AND carrera_id = $2 AND profesor_id = $3`,
      [ramo_id, carrera_id, profesor_id]
    );
    res.send('Profesor eliminado correctamente');
  } catch (error) {
    console.error('Error al eliminar profesor:', error);
    res.status(500).send('Error al eliminar profesor');
  }
});

// =====================
// Rutas para Estado de Oferta
// =====================

// Obtener el estado de oferta para una carrera específica
router.get('/estado-oferta/:carrera_id', async (req, res) => {
  const { carrera_id } = req.params;
  try {
    const result = await pool.query(
      `SELECT eo.ramo_id, eo.activo, r.sigla, r.nombre
       FROM estado_oferta eo
       JOIN ramos r ON eo.ramo_id = r.id
       WHERE eo.carrera_id = $1`,
      [carrera_id]
    );
    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'No se encontraron estados de oferta para esta carrera' });
    }
    res.json(result.rows);
  } catch (err) {
    console.error('Error al obtener el estado de la oferta:', err);
    res.status(500).send('Error al obtener el estado de la oferta');
  }
});


// Obtener el estado de oferta de un ramo por carrera
router.get('/ramos/:ramo_id/carrera/:carrera_id/estado-oferta', async (req, res) => {
  const { ramo_id, carrera_id } = req.params;
  try {
    const result = await pool.query(
      `SELECT activo FROM estado_oferta
       WHERE ramo_id = $1 AND carrera_id = $2`,
      [ramo_id, carrera_id]
    );
    res.json(result.rows[0] || { activo: false });
  } catch (error) {
    console.error('Error al obtener el estado de la oferta:', error);
    res.status(500).send('Error al obtener el estado de la oferta');
  }
});

// Activar o desactivar una oferta de ayudantía
router.put('/ramos/:ramo_id/carrera/:carrera_id/estado-oferta', async (req, res) => {
  const { ramo_id, carrera_id } = req.params;
  const { activo } = req.body;

  if (isNaN(parseInt(ramo_id)) || isNaN(parseInt(carrera_id)) || typeof activo !== 'boolean') {
    return res.status(400).json({ error: 'Parámetros inválidos' });
  }

  try {
    const result = await pool.query(
      `INSERT INTO estado_oferta (ramo_id, carrera_id, activo)
       VALUES ($1, $2, $3)
       ON CONFLICT (ramo_id, carrera_id) DO UPDATE SET activo = $3
       RETURNING *`,
      [parseInt(ramo_id), parseInt(carrera_id), activo]
    );

    if (result.rowCount === 0) {
      return res.status(500).json({ error: 'No se pudo actualizar el estado de la oferta' });
    }

    res.json({ message: `Estado de oferta actualizado a ${activo}`, data: result.rows[0] });
  } catch (error) {
    console.error('Error al actualizar el estado de la oferta:', error);
    res.status(500).json({ error: 'Error al actualizar el estado de la oferta' });
  }
});

// Actualizar esta ruta para obtener todos los campos necesarios
router.get('/ofertas/:carrera', async (req, res) => {
  const { carrera } = req.params;
  try {
    const result = await pool.query(
      `SELECT r.id AS ramo_id, r.carrera_id, r.sigla, r.nombre 
       FROM estado_oferta eo
       JOIN ramos r ON eo.ramo_id = r.id
       JOIN carreras c ON eo.carrera_id = c.id
       WHERE c.nombre = $1 AND eo.activo = true`,
      [carrera]
    );
    res.json(result.rows);
  } catch (err) {
    console.error('Error al obtener ofertas activas:', err);
    res.status(500).send('Error al obtener ofertas activas');
  }
});


// =====================
// Rutas para Formularios
// =====================

// Obtener la información de un ramo (enlace de formulario)
router.get('/ramos/:ramo_id/informacion', async (req, res) => {
  const { ramo_id } = req.params;
  try {
    const formularioResult = await pool.query(
      `SELECT enlace FROM formularios WHERE ramo_id = $1`,
      [ramo_id]
    );
    const enlaceFormulario = formularioResult.rows[0]?.enlace || '';

    const profesoresResult = await pool.query(
      `SELECT p.id, p.nombre, p.correo 
       FROM profesores p
       JOIN profesores_ramos rp ON p.id = rp.profesor_id
       WHERE rp.ramo_id = $1`,
      [ramo_id]
    );
    const profesoresAsignados = profesoresResult.rows;

    res.json({ enlaceFormulario, profesoresAsignados });
  } catch (err) {
    console.error('Error al obtener la información del ramo:', err);
    res.status(500).send('Error al obtener la información del ramo');
  }
});


// Obtener todos los profesores
router.get('/profesores', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM profesores');
    res.json(result.rows);
  } catch (err) {
    console.error('Error al obtener los profesores:', err);
    res.status(500).send('Error al obtener los profesores');
  }
});

// =====================
// Ruta para obtener formId del ramo
// =====================
router.get('/ramos/:ramo_id/formulario', async (req, res) => {
  const { ramo_id } = req.params;
  try {
    const result = await pool.query(
      `SELECT form_id FROM respuestas_formularios_ramos WHERE ramo_id = $1`,
      [ramo_id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'No se encontró formId para el ramo especificado' });
    }

    res.json({ formId: result.rows[0].form_id });
  } catch (error) {
    console.error('Error al obtener el formId del ramo:', error);
    res.status(500).send('Error al obtener el formId del ramo');
  }
});

// =====================
// Rutas para manejo de formularios de ramos por carrera para vista de profesores
// =====================

// Añadir rutas relacionadas con el manejo de formularios de ramos

// Ruta para obtener la lista de carreras disponibles
router.get('/carreras', authenticateToken, async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM carreras');
    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener las carreras:', error);
    res.status(500).send('Error al obtener las carreras');
  }
});

// Ruta para obtener los ramos asignados a un profesor para una carrera específica
router.get('/profesor/:carreraId/ramos', authenticateToken, authorizeRole(2), async (req, res) => {
  const { carreraId } = req.params;
  const profesorId = req.user.id;

  try {
    const result = await pool.query(
      `SELECT r.* 
       FROM ramos r
       JOIN profesores_ramos pr ON r.id = pr.ramo_id
       WHERE pr.profesor_id = $1 AND pr.carrera_id = $2`,
      [profesorId, carreraId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener los ramos del profesor:', error);
    res.status(500).send('Error al obtener los ramos del profesor');
  }
});

// Ruta para obtener las respuestas del formulario de un ramo por carrera
router.get('/ramos/:ramoId/carrera/:carreraId/respuestas', authenticateToken, authorizeRole(2), async (req, res) => {
  const { ramoId, carreraId } = req.params;

  try {
    const result = await pool.query(
      `SELECT rf.*
       FROM respuestas_formularios_ramos rf
       WHERE rf.ramo_id = $1 AND rf.carrera_id = $2`,
      [ramoId, carreraId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener las respuestas del formulario:', error);
    res.status(500).send('Error al obtener las respuestas del formulario');
  }
});

// Ruta para asignar a un postulante como ayudante de un ramo específico
// Actualizar el estado de asignación de un ayudante (asignar/des-asignar)
router.put('/ramos/:ramoId/carrera/:carreraId/asignar-ayudante', authenticateToken, authorizeRole(2), async (req, res) => {
  const { ramoId, carreraId } = req.params;
  const { id, asignado } = req.body;

  try {
    // Actualizar el registro para cambiar el estado de asignación
    const result = await pool.query(
      `UPDATE respuestas_formulario_local 
       SET asignado = $1
       WHERE id = $2 AND ramo_id = $3 AND carrera_id = $4`,
      [asignado, id, ramoId, carreraId]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ error: 'No se encontró el registro para actualizar el estado de asignación' });
    }

    res.json({ message: asignado ? 'Ayudante asignado correctamente' : 'Ayudante des-asignado correctamente' });
  } catch (error) {
    console.error('Error al actualizar el estado de asignación del postulante:', error);
    res.status(500).send('Error al actualizar el estado de asignación');
  }
});


// =============
// Ruta de vista profesor
// =============

// Ruta para obtener todas las carreras donde el profesor tiene ramos asignados
router.get('/profesor/carreras', authenticateToken, authorizeRole(2), async (req, res) => {
  const profesorId = req.user.id;

  try {
    const result = await pool.query(
      `SELECT DISTINCT c.id, c.nombre 
       FROM carreras c
       JOIN profesores_ramos pr ON c.id = pr.carrera_id
       WHERE pr.profesor_id = $1`,
      [profesorId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener las carreras del profesor:', error);
    res.status(500).send('Error al obtener las carreras del profesor');
  }
});

// Ruta para obtener los ramos asignados a un profesor dentro de una carrera específica
router.get('/profesor/carrera/:carreraId/ramos', authenticateToken, authorizeRole(2), async (req, res) => {
  const { carreraId } = req.params;
  const profesorId = req.user.id;

  try {
    const result = await pool.query(
      `SELECT r.id, r.nombre, r.sigla 
       FROM ramos r
       JOIN profesores_ramos pr ON r.id = pr.ramo_id
       WHERE pr.carrera_id = $1 AND pr.profesor_id = $2`,
      [carreraId, profesorId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener los ramos del profesor en la carrera:', error);
    res.status(500).send('Error al obtener los ramos del profesor en la carrera');
  }
});

// Ruta para obtener las respuestas del formulario de un ramo específico
router.get('/profesor/ramo/:ramoId/formulario', authenticateToken, authorizeRole(2), async (req, res) => {
  const { ramoId } = req.params;

  try {
    const result = await pool.query(
      `SELECT * 
       FROM respuestas_formulario_local 
       WHERE ramo_id = $1`,
      [ramoId]
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener las respuestas del formulario:', error);
    res.status(500).send('Error al obtener las respuestas del formulario');
  }
});


// =====================
// Formulario local
// =====================

// Endpoint para obtener el nombre del ramo y la carrera
router.get('/ramos/:ramoId/carrera/:carreraId', async (req, res) => {
  const { ramoId, carreraId } = req.params;

  try {
    const result = await pool.query(`
      SELECT r.nombre AS ramo_nombre, c.nombre AS carrera_nombre
      FROM ramos r
      JOIN carreras c ON c.id = $1
      WHERE r.id = $2
    `, [carreraId, ramoId]);

    if (result.rows.length > 0) {
      res.json(result.rows[0]);
    } else {
      res.status(404).send('Ramo o carrera no encontrados');
    }
  } catch (error) {
    console.error('Error al obtener el nombre del ramo y carrera:', error);
    res.status(500).send('Error al obtener los datos del ramo y la carrera');
  }
});


// Ruta para verificar si el correo institucional ya ha respondido el formulario
router.post('/formulario/verificar', async (req, res) => {
  const { respondent_email, ramoId, carreraId } = req.body;
  console.log('Datos recibidos:', respondent_email, ramoId, carreraId);

  try {
    const result = await pool.query(
      `SELECT * FROM respuestas_formulario_local 
       WHERE TRIM(LOWER(respondent_email)) = TRIM(LOWER($1)) 
       AND ramo_id = $2 AND carrera_id = $3`,
      [respondent_email, ramoId, carreraId]
    );

    if (result.rows.length > 0) {
      return res.status(200).json({ responded: true });
    } else {
      return res.status(200).json({ responded: false });
    }
  } catch (error) {
    console.error('Error al verificar el correo:', error);
    res.status(500).send('Error al verificar el correo institucional');
  }
});

// Ruta para obtener los ayudantes seleccionados de un ramo por carrera
router.get('/ramos/:ramoId/carrera/:carreraId/ayudante', async (req, res) => {
  const { ramoId, carreraId } = req.params;

  try {
    // Obtener toda la información de los ayudantes asignados para el ramo y carrera especificados
    const result = await pool.query(
      `SELECT nombres, apellidos, rut, respondent_email 
       FROM respuestas_formulario_local 
       WHERE ramo_id = $1 AND carrera_id = $2 AND asignado = true`,
      [ramoId, carreraId]
    );

    if (result.rows.length > 0) {
      res.json(result.rows); // Enviar todos los ayudantes asignados
    } else {
      res.json([]); // Si no hay ayudantes asignados, devolver un array vacío
    }
  } catch (error) {
    console.error('Error al obtener los ayudantes del ramo:', error);
    res.status(500).json({ error: 'Error al obtener los ayudantes del ramo' });
  }
});


// Ruta para responder un formulario (almacenar las respuestas)

// Inserción actualizada de los datos del formulario
router.post('/formulario/responder', async (req, res) => {
  const {
    ramo_id,
    carrera_id,
    anio,
    semestre,
    respondent_email,
    rut,
    nombres,
    apellidos,
    carrera,
    anio_ingreso,
    veces_curso,
    nota_aprobacion,
    ayudantias,
    experiencia_evaluaciones,
    tutorias,
    talleres_umdu,
    nivel_riesgo,
    motivo_ayudantia,
    bloques_disponibles
  } = req.body;

  try {
    const query = `
      INSERT INTO respuestas_formulario_local (
        ramo_id, carrera_id, anio, semestre, respondent_email, rut, nombres, apellidos,
        carrera, anio_ingreso, veces_curso, nota_aprobacion, ayudantias, experiencia_evaluaciones,
        tutorias, talleres_umdu, nivel_riesgo, motivo_ayudantia, bloques_disponibles, created_at, updated_at
      )
      VALUES (
        $1, $2, $3, $4, $5, $6, $7, $8, $9,
        $10, $11, $12, $13, $14, $15,
        $16, $17, $18, $19, NOW(), NOW()
      )
    `;

    const values = [
      ramo_id, carrera_id, anio, semestre, respondent_email, rut, nombres, apellidos,
      carrera, anio_ingreso, veces_curso, nota_aprobacion, ayudantias, experiencia_evaluaciones,
      tutorias, talleres_umdu, nivel_riesgo, motivo_ayudantia, JSON.stringify(bloques_disponibles)
    ];

    await pool.query(query, values);

    res.status(200).send({ message: 'Respuestas del formulario almacenadas correctamente' });
  } catch (error) {
    console.error('Error al almacenar las respuestas del formulario:', error);
    res.status(500).send({ error: 'Error al almacenar las respuestas del formulario' });
  }
});


// Obtener respuestas para profesores
router.get('/respuestas_formulario/:ramo_id/:carrera_id', async (req, res) => {
  const { ramo_id, carrera_id } = req.params;
  try {
    const result = await pool.query(
      'SELECT * FROM respuestas_formulario_local WHERE ramo_id = $1 AND carrera_id = $2',
      [ramo_id, carrera_id]
    );
    res.json(result.rows);
  } catch (error) {
    console.error('Error al obtener respuestas del formulario:', error);
    res.status(500).send('Error al obtener respuestas del formulario');
  }
});



module.exports = router;
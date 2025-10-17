// controllers/ramosController.js
const pool = require('../db'); // Asumiendo que usas un pool de conexiones

// Controlador para obtener ramos por carrera
const obtenerRamosPorCarrera = async (req, res) => {
    const { carreraId } = req.params; // Obtener el ID de la carrera de los parámetros de la URL
    try {
        const resultado = await pool.query(
            'SELECT * FROM ramos WHERE carrera_id = $1',
            [carreraId]
        );
        res.json(resultado.rows);
    } catch (error) {
        console.error('Error al obtener los ramos por carrera:', error);
        res.status(500).json({ error: 'Error al obtener los ramos' });
    }
};

module.exports = { obtenerRamosPorCarrera };

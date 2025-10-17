require('dotenv').config();
console.log('JWT_SECRET:', process.env.JWT_SECRET); // Agregar esta línea para verificar


const express = require('express');
const app = express();
const routes = require('./routes'); // Importa el archivo de rutas
const cors = require('cors');

const PORT = 3001; // Puerto en el que el servidor va a escuchar

// Middleware
app.use(express.json()); // Permite el procesamiento de JSON en los requests
app.use('/api', routes); // Rutas - Agrega el prefijo /api para todas las rutas
app.use(cors());

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

app.use((req, res, next) => {
  console.log(`Solicitud recibida: ${req.method} ${req.url}`);
  next();
});

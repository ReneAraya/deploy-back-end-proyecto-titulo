const { google } = require('googleapis');
const readline = require('readline');
const fs = require('fs');

// Ruta al archivo JSON con tus credenciales de OAuth 2.0
const keyPath = 'client_secret_892427375724-frki1bbq1ib5de38p1nnq6ujipch44c3.apps.googleusercontent.com.json';
const credentials = JSON.parse(fs.readFileSync(keyPath, 'utf8'));
// Desestructurar las credenciales para configurarlas en el cliente OAuth 2.0
const { client_secret, client_id } = credentials.web;

// URL de redirección autorizada en la consola de Google Cloud
const redirect_uri = 'http://localhost'; // Cambia esto por la URL registrada en la consola si es diferente

// Crear el cliente OAuth 2.0
const oAuth2Client = new google.auth.OAuth2(client_id, client_secret, redirect_uri);

// Alcances a APIS requeridas (Google Sheets, Drive, Forms, etc.)
const SCOPES = [
  'https://www.googleapis.com/auth/forms.responses.readonly',
  'https://www.googleapis.com/auth/spreadsheets',
  'https://www.googleapis.com/auth/drive',
  'https://www.googleapis.com/auth/drive.file',
  'https://www.googleapis.com/auth/drive.readonly',
  'https://www.googleapis.com/auth/drive.metadata'
];

// Generar la URL de autorización
const authUrl = oAuth2Client.generateAuthUrl({
  access_type: 'offline', // 'offline' es necesario para obtener el refresh_token
  scope: SCOPES,
});

console.log('Autoriza esta aplicación visitando esta URL:', authUrl);
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Ingresar el código de autorización recibido desde el navegador
rl.question('Introduce el código de esa página aquí: ', (code) => {
  rl.close();
  oAuth2Client.getToken(code, (err, token) => {
    if (err) {
      return console.error('Error al obtener el token de acceso', err);
    }

    console.log('Token obtenido:');
    console.log(JSON.stringify(token, null, 2));

    // Guardar el token en un archivo (puedes cambiar esto si prefieres almacenarlo de otra manera)
    fs.writeFileSync('token.json', JSON.stringify(token, null, 2));
    console.log('El token ha sido guardado en token.json');
  });
});

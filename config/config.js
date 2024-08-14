const config = require('config');

module.exports = {
  jwtSecret: 'tu_secreto_jwt',
  jwtExpiresIn: '1h',
  jwtCookieExpires: 90 // Días
};


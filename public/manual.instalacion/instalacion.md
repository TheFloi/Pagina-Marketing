# Manual de Instalación de la Página Web de Marketing

## 1. Introducción

### Descripción del Proyecto
Este proyecto es una página web dedicada a la venta de servicios de marketing, incluyendo la creación de páginas web y la comercialización de merchandising personalizado. La plataforma está diseñada para ser intuitiva y fácil de navegar, brindando a las microempresas una herramienta poderosa para comenzar su crecimiento en el mercado digital.

### Requisitos Previos
Antes de proceder con la instalación, asegúrate de cumplir con los siguientes requisitos previos:

- **Servidor WAMP**: Un servidor local WAMP instalado en tu computadora. Este entorno incluye Apache, MySQL y PHP, que son esenciales para ejecutar el backend y la base de datos de la aplicación.
- **Node.js**: Asegúrate de tener la última versión de Node.js instalada. Node.js es crucial para ejecutar el código JavaScript del servidor y para gestionar las dependencias a través de npm (Node Package Manager).
- **Visual Studio Code**: Este es el editor de código recomendado para el proyecto. Visual Studio Code ofrece una gran cantidad de extensiones útiles para el desarrollo web, como linters, depuradores, y herramientas de integración con Git.

### Público Objetivo
El proyecto está dirigido a **microempresas** que desean expandir su presencia en el mercado digital. Estas empresas buscan soluciones asequibles y eficaces para iniciar su propio marketing, incluyendo la creación de una página web que refleje su marca y servicios.

## 2. Requisitos del Sistema

### Servidor Web
- **WAMP**: El servidor WAMP es esencial para ejecutar el backend de la aplicación en un entorno local. Asegúrate de que el servidor esté correctamente configurado y funcionando antes de proceder con la instalación.
- **Especificaciones**: El servidor debe ser capaz de manejar aplicaciones que requieren una combinación de PHP, MySQL y Apache.

### Lenguaje de Programación
- **Node.js**: El proyecto utiliza Node.js, un entorno de ejecución para JavaScript. La versión más reciente de Node.js es recomendada para asegurar la compatibilidad con todas las dependencias del proyecto.
- **EJS, CSS, JavaScript, .md**: El front-end de la aplicación está construido utilizando EJS para la generación de plantillas HTML dinámicas, junto con CSS para el diseño y JavaScript para la interactividad.

### Base de Datos
- **MySQL**: La base de datos MySQL es utilizada para almacenar la información de los usuarios, productos, y otros datos relevantes del proyecto.

### Extensiones y Módulos
El proyecto depende de varias extensiones y módulos de Node.js, los cuales son cruciales para su correcto funcionamiento:

  "@mysql/xdevapi": "^8.0.35",

  "bcrypt": "^5.1.1",
  
  "bcryptjs": "^2.4.3",
  
  "config": "^3.3.12",
  
  "connect-flash": "^0.1.1",
  
  "cookie-parser": "^1.4.6",
  
  "csurf": "^1.11.0",
  
  "dotenv": "^16.4.5",
  
  "ejs": "^3.1.10",
  
  "express": "^4.19.2",
  
  "express-session": "^1.18.0",
  
  "helmet": "^7.1.0",
  
  "jsonwebtoken": "^9.0.2",
  
  "mysql": "^2.18.1",
  
  "nodemailer": "^6.9.14",
  
  "sweetalert2": "^11.6.13"

## Espacio en Disco y Memoria RAM
Memoria RAM: El proyecto requiere un mínimo de 4 GB de RAM para funcionar correctamente, aunque se recomienda 8 GB de RAM para un rendimiento óptimo, especialmente en un entorno de desarrollo local donde múltiples servicios pueden estar ejecutándose simultáneamente.
Espacio en Disco: Asegúrate de contar con suficiente espacio en disco para manejar la base de datos y el código fuente, con un mínimo recomendado de 10 GB libres.
Sistema Operativo
# Multiplataforma:
 Gracias al uso de Bootstrap, el proyecto es compatible con diferentes sistemas operativos, incluyendo Windows, macOS y Linux.
## 3. Preparación del Entorno
Configuración del Servidor
Archivo Principal
El archivo principal de la aplicación es app.js. Este archivo contiene la configuración inicial del servidor Express, la gestión de rutas, y la configuración de middleware esencial para la aplicación.

Instalación de Dependencias
Antes de ejecutar la aplicación, es necesario instalar todas las dependencias utilizando npm. Ejecuta el siguiente comando en el directorio raíz del proyecto:

npm install
Esto descargará e instalará todas las dependencias listadas en el archivo package.json, que son necesarias para que el proyecto funcione correctamente.

Instalación de Nodemon
Para facilitar el desarrollo y evitar tener que reiniciar manualmente el servidor cada vez que realices cambios en el código, se recomienda instalar nodemon de forma global:

npm install -g nodemon
Configuración de Permisos
Asegúrate de que todos los archivos y carpetas tengan los permisos adecuados para la ejecución en el servidor. Esto incluye permisos de lectura, escritura y ejecución según sea necesario.

## Base de Datos
Creación de la Base de Datos
Acceso a MySQL: Inicia sesión en MySQL utilizando la línea de comandos o una herramienta de gestión de bases de datos como phpMyAdmin.
Ejecutar Script SQL: Ejecuta el script SQL proporcionado para crear la base de datos y las tablas necesarias para el proyecto.
Configuración de Usuarios
Configura los usuarios y permisos necesarios para acceder a la base de datos. Asegúrate de que el usuario que utilizará la aplicación tenga permisos adecuados para leer y escribir en la base de datos.

Importación de Datos
Si es necesario, importa los datos iniciales utilizando el script SQL de importación proporcionado.

## 4. Instalación del Código Fuente
Obteniendo el Código
Clonación del Repositorio
El código fuente está alojado en un repositorio GitHub. Para clonar el repositorio, utiliza el siguiente comando:

git clone <URL del repositorio>
Esto descargará una copia completa del proyecto en tu máquina local.

Descarga Directa
Alternativamente, puedes descargar el código fuente como un archivo comprimido (ZIP) directamente desde la página del repositorio en GitHub. Una vez descargado, descomprime el archivo en el directorio deseado.

Configuración Inicial
Archivos de Configuración
Crea un archivo .env en el directorio raíz del proyecto. Este archivo contendrá variables de entorno críticas, como claves API, credenciales de base de datos, y configuraciones de seguridad.

Instalación de Dependencias
Navega hasta el directorio del proyecto y ejecuta:

npm install
Esto instalará todas las dependencias necesarias para el correcto funcionamiento de la aplicación.

Configuración de Rutas
Ajuste de Rutas Base
Revisa y ajusta las rutas base y URLs en los archivos de configuración según sea necesario. Asegúrate de que todas las rutas estén correctamente configuradas para reflejar la estructura de tu servidor.

Configuración de Seguridad
Implementación de HTTPS
Configura HTTPS utilizando un certificado SSL válido. Esto es crucial para proteger la información sensible transmitida entre el cliente y el servidor.

Configuración de Firewall
Establece reglas de firewall para limitar el acceso no autorizado. Implementa medidas de protección contra ataques comunes como CSRF (Cross-Site Request Forgery) y XSS (Cross-Site Scripting).

## 5. Despliegue de la Aplicación
Subida de Archivos al Servidor
Métodos Recomendados
Utiliza métodos seguros como FTP, SFTP o SCP para subir los archivos al servidor de producción. Asegúrate de que todos los archivos se transfieran correctamente y de que las carpetas con permisos especiales mantengan sus configuraciones.

Configuración del Servidor
Configuración de vHosts y SSL
Configura los virtual hosts (vHosts) en Apache para manejar múltiples dominios o subdominios si es necesario. Asegúrate de que el SSL esté correctamente configurado y que los redireccionamientos de HTTP a HTTPS funcionen como se espera.

Configuración de Dominio y DNS
Asegúrate de que el dominio esté correctamente configurado en los registros DNS. Esto incluye la configuración de registros A, CNAME, y cualquier otro tipo de registro necesario para el correcto funcionamiento del sitio web.

Instalación Automática o Manual
Ejecución de Scripts de Instalación
Si el proyecto incluye scripts de instalación automatizados, ejecútalos para configurar rápidamente el entorno de producción. Alternativamente, sigue las instrucciones manuales para configurar cada componente según sea necesario.

Migraciones y Seeders
Ejecución de Migraciones
Las migraciones son esenciales para estructurar la base de datos según el esquema definido en el proyecto. Ejecuta las migraciones utilizando el ORM o las herramientas de base de datos que el proyecto esté utilizando.

Ejecución de Seeders
Si el proyecto lo requiere, ejecuta los seeders para cargar datos iniciales en la base de datos, tales como productos, categorías, o configuraciones predeterminadas.

## 6. Configuración de Funcionalidades Adicionales
Integraciones Externas
Configuración de APIs Externas
El proyecto puede requerir la integración con servicios externos, como pasarelas de pago, servicios de envío de correos electrónicos, o APIs de terceros. Configura estas integraciones siguiendo las guías oficiales de cada proveedor.

Multilenguaje
Configuración de Idiomas Adicionales
Si el proyecto necesita soportar múltiples idiomas, asegúrate de que la configuración multilenguaje esté activada y correctamente configurada. Esto puede incluir la configuración de archivos de idioma y la implementación de lógica para seleccionar el idioma adecuado basado en la preferencia del usuario.

E-commerce
Configuración de Gestión de Productos
Configura el sistema de gestión de productos, incluyendo la adición, edición, y eliminación de productos desde el panel de administración.

Configuración de Inventario
Asegúrate de que el sistema de inventario esté correctamente configurado para manejar el stock de productos y las alertas de bajo inventario.

Configuración del Carrito de Compras
Configura y prueba el carrito de compras, asegurándote de que los usuarios puedan agregar, modificar y eliminar productos de su carrito, y que el proceso de compra funcione sin problemas.

## 7. Pruebas y Verificación
Pruebas de Funcionalidad
Lista de Pruebas
Realiza pruebas exhaustivas en todas las funcionalidades principales de la aplicación. Asegúrate de que el flujo de usuario desde la navegación inicial hasta la finalización de una compra funcione sin errores.

Pruebas de Seguridad
Verificación de SSL
Verifica que los certificados SSL estén correctamente implementados y que todas las conexiones se realicen a través de HTTPS.

Pruebas de Vulnerabilidades
Utiliza herramientas de análisis de seguridad para realizar pruebas de vulnerabilidades y asegurarte de que la aplicación no sea susceptible a ataques comunes como SQL Injection, XSS, y CSRF.

Pruebas de Rendimiento
Evaluación de Velocidad
Utiliza herramientas de evaluación de rendimiento para medir la velocidad del sitio web. Optimiza el tiempo de carga minimizando archivos CSS y JavaScript, y utilizando técnicas como el lazy loading para imágenes.

## 8. Solución de Problemas Comunes
Errores Comunes
Listado de Errores
A continuación se listan algunos errores comunes que podrían surgir durante la instalación y cómo solucionarlos:

Error de Conexión a la Base de Datos: Verifica que las credenciales de la base de datos en el archivo .env sean correctas y que el servidor MySQL esté funcionando.
Problemas con Dependencias: Asegúrate de que todas las dependencias estén correctamente instaladas ejecutando npm install nuevamente.
Verificación de Logs
Acceso a Logs
Accede a los logs del servidor web, de la aplicación, y de la base de datos para identificar y solucionar problemas. Revisa los logs de errores y de acceso para obtener más información sobre el comportamiento del sistema.

## 9. Configuración Post-Instalación
Mantenimiento Regular
Tareas Programadas
Establece tareas de mantenimiento regulares, como la creación de backups automáticos de la base de datos y la actualización periódica de las dependencias del proyecto.

Documentación Adicional
Referencias a Documentación Oficial
Consulta la documentación oficial de cada tecnología utilizada en el proyecto para configuraciones avanzadas o resolución de problemas específicos. Mantén un registro de todas las guías útiles y recursos adicionales que puedan ser necesarios en el futuro.

## 10. Conclusión
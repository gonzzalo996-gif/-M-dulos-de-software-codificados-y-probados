# GeStore - Sistema web para la gestión de tiendas

## Descripción del proyecto

GeStore es un proyecto académico enfocado en el desarrollo de un sistema web para la gestión de una tienda, sirviendo para administrar procesos básicos del negocio mediante tecnologías web basadas en Java.

El sistema incluye autenticación de credenciales de usuarios, manejo de sesiones, acceso administrativo y gestión de información mediante páginas conectadas a una base de datos.

Este proyecto fue desarrollado aplicando tecnologías backend orientadas al desarollo de aplicaciones empresariales web.

# Objetivo del proyecto

Desarrollar un sistema web funcional para la gestión de tiendas, aplicando conceptos de:

- Programación web con Java
- Formularios HTML
- Servlets
- Métodos HTTP, GET y POST
- Manejo de sesiones
- Control de versiones

# Tecnologías utilizadas

- Java
- JSP
- Jakarta Servlets
- JDBC
- MySQL
- Apache Maven
- HTML
- CSS
- Apache Tomcat
- Git y GitHub

# Funcionalidades implementadas

## Autenticación de usuarios

El sistema permite:

- Inicio de sesión mediante usuario y contraseña
- Validación de credenciales almacenadas en base de datos
- Restricción de acceso
- Manejo de sesiones de usuario

## Gestión administrativa

El sistema incorpora módulos para:

- Acceso a panel administrativo
- Navegación entre módulos
- Gestión interna del sistema

## Gestión de sesiones

Implementación de:

- Creación de sesiones mediante HttpSession
- Persistencia temporal de usuario autenticado
- Cierre de sesión

# Estructura del proyecto

## Código Java

Contiene: 

- Servlets
- Configuración del proyecto
- Lógica Backend

Ubicación: 

src/main/java/

## Recursos web

Contiene:

- Formularios
- Interfaces JSP

Ubicación:

src/main/webapp

# Evidencias de cumplimiento de requisitos

## Formularios HTML

Implementados mediante formularios web para la captura de información del usuario.

Archivo principal:

- index.jsp

Funciones: 

- Captura de usuario
- Captura de contraseña
- Envío de información al servidor

## Servlets implementados

Servlet principal:

ingresar.java

Funciones:

- Recepción de solicitudes HTTP
- Validación de credenciales
- Manejo de sesiones
- Redirecciones

## Implementación método POST

Implementación mediante:

doPost()

Utilizado en:

- Recepción de credenciales
- Procesamiento de autenticación

## Implementación método GET

Implementación mediante:

doGet()

Utilizado para:

- Controlar accesos directos
- Responder solicitudes GET

## Páginas JSP implementadas

- index.jsp
- administracion.jsp
- dashboard.jsp
- productos.jsp
- logout.jsp

## Persistencia de datos

Implementada mediante:

- JDBC
- MySQL
- Consultas SQL

Base de datos utilizada:

jsp_adso_15

# Pruebas realizadas

Se realizaron pruebas sobre:

- Inicio de sesión correcto
- Inicio de sesión incorrecto
- Redirecciones entre páginas
- Funcionamiento de sesiones
- Comunicación formulario -> Servlet -> JSP
- Conexión a base de datos

# Ejecución del proyecto

1. Clonar repositorio
2. Importar proyecto Maven
3. Configurar Apache Tomcat
4. Crear base de datos MySQL
5. Ejecutar aplicación
6. Acceder desde un navegador

# Control de versiones

El proyecto utiliza Git y GitHub para almacenamiento, seguimiento y control de cambios en el proyecto.

# Autor

Gonzalo Salcedo
Proyecto web - GeStore

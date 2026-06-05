package com.mycompany.evidencia_adso;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// Servlet encargado de procesar la autenticación de usuarios
@WebServlet("/ingresar")
public class IngresarServlet extends HttpServlet {

    // Método POST utilizado para recibir y validar credenciales
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Obtiene usuario y contraseña enviados desde el formulario
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        System.out.println("USUARIO: [" + usuario + "]");
        System.out.println("CLAVE: [" + clave + "]");

        if (usuario != null) usuario = usuario.trim();
        if (clave != null) clave = clave.trim();

        //Conexión a base de datos 
        String url = "jdbc:mysql://localhost:3306/jsp_adso_15";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            
            // Consulta para la validación de credenciales
            ResultSet rs = stmt.executeQuery(
                "SELECT * FROM usuario WHERE usuario = '" + usuario + "' AND clave = '" + clave + "'"
            );

            response.setContentType("text/html;charset=UTF-8");

            // Redireccionamientos según la validación de las credenciales
            if (rs.next()) {
                
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                
                response.sendRedirect(request.getContextPath() + "/administracion.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/?error=Usuario o clave incorrectos");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    //Bloqueo accesos a través de solicitudes GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("ACCESO NO PERMITIDO");
    }
}
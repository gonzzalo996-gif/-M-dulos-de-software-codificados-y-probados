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

@WebServlet("/ingresar")
public class IngresarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        System.out.println("USUARIO: [" + usuario + "]");
        System.out.println("CLAVE: [" + clave + "]");

        if (usuario != null) usuario = usuario.trim();
        if (clave != null) clave = clave.trim();

        String url = "jdbc:mysql://localhost:3306/jsp_adso_15";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(
                "SELECT * FROM usuario WHERE usuario = '" + usuario + "' AND clave = '" + clave + "'"
            );

            response.setContentType("text/html;charset=UTF-8");

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("ACCESO NO PERMITIDO");
    }
}
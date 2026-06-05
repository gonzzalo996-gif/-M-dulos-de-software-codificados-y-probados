<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("./?error=No tienes permisos");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/jsp_adso_15";
    String user = "root";
    String password = "";

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        st = con.createStatement();

        if ("crear".equals(request.getParameter("accion"))) {
            String u = request.getParameter("usuario");
            String c = request.getParameter("clave");

            st.executeUpdate("INSERT INTO usuario(usuario, clave) VALUES('" + u + "','" + c + "')");

            response.sendRedirect("administracion.jsp");
            return;
        }

        if (request.getParameter("eliminar") != null) {
            int id = Integer.parseInt(request.getParameter("eliminar"));

            st.executeUpdate("DELETE FROM usuario WHERE id=" + id);

            response.sendRedirect("administracion.jsp");
            return;
        }

        rs = st.executeQuery("SELECT * FROM usuario");

%>

<!DOCTYPE html>
<html>
<head>
    <title>Administrador - Usuarios</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial;
        }

        body {
            margin: 0;
            background: #eef2f7;
        }

        .navbar {
            background: #2c3e50;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            font-weight: bold;
        }

        .navbar a:hover {
            opacity: 0.7;
        }

        .logout {
            color: red !important;
        }

        .container {
            background: white;
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input {
            padding: 10px;
            margin: 5px;
            width: 25%;
        }

        button {
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            background: #28a745;
            color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #4facfe;
            color: white;
        }

        a.delete {
            color: red;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div>🛒 Gestore</div>

    <div>
        <a href="dashboard.jsp">🏠 Inicio</a>
        <a href="administracion.jsp">👤 Usuarios</a>
        <a href="productos.jsp">📦 Productos</a>
        <a class="logout" href="logout.jsp">🚪 Salir</a>
    </div>
</div>

<div class="container">

    <h2>Gestión de Usuarios</h2>

    <form method="POST">
        <input type="hidden" name="accion" value="crear">

        <input type="text" name="usuario" placeholder="Usuario" required>
        <input type="password" name="clave" placeholder="Clave" required>

        <button type="submit">Crear</button>
    </form>

    <table>
        <tr>
            <th>ID</th>
            <th>Usuario</th>
            <th>Clave</th>
            <th>Acciones</th>
        </tr>

        <%
            while (rs.next()) {
        %>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("usuario") %></td>
            <td><%= rs.getString("clave") %></td>
            <td>
                <a class="delete"
                   href="?eliminar=<%= rs.getInt("id") %>"
                   onclick="return confirm('¿Eliminar usuario?')">
                   Eliminar
                </a>
            </td>
        </tr>

        <%
            }
        %>

    </table>

</div>

</body>
</html>

<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    }
%>
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

    int totalUsuarios = 0;
    int totalProductos = 0;

    Connection con = null;
    Statement st = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        st = con.createStatement();

        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM usuario");
        if (rs1.next()) totalUsuarios = rs1.getInt(1);

        ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM producto");
        if (rs2.next()) totalProductos = rs2.getInt(1);

%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>

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
            padding: 25px;
        }

        h2 {
            margin-bottom: 20px;
        }

        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            width: 220px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        .number {
            font-size: 30px;
            font-weight: bold;
            color: #2c3e50;
            margin-top: 10px;
        }

        .label {
            color: #666;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div>🛒 GeStore </div>

    <div>
        <a href="dashboard.jsp">🏠 Inicio</a>
        <a href="administracion.jsp">👤 Usuarios</a>
        <a href="productos.jsp">📦 Productos</a>
        <a class="logout" href="logout.jsp">🚪 Salir</a>
    </div>
</div>

<div class="container">

    <h2>Bienvenido, <%= session.getAttribute("usuario") %> 👋</h2>

    <div class="cards">

        <div class="card">
            <div class="label">Usuarios</div>
            <div class="number"><%= totalUsuarios %></div>
        </div>

        <div class="card">
            <div class="label">Productos</div>
            <div class="number"><%= totalProductos %></div>
        </div>

    </div>

</div>

</body>
</html>

<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (st != null) st.close();
        if (con != null) con.close();
    }
%>
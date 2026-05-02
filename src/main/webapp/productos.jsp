<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("./?error=No tienes permisos");
        return;
    }
%>

<style>
    body {
        margin: 0;
        font-family: Arial;
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
        padding: 20px;
    }
</style>

<div class="navbar">
    <div>🛒 Tienda Abarrotes</div>

    <div>
        <a href="dashboard.jsp">🏠 Inicio</a>
        <a href="administracion.jsp">👤 Usuarios</a>
        <a href="productos.jsp">📦 Productos</a>
        <a class="logout" href="logout.jsp">🚪 Salir</a>
    </div>
</div>

<%
    String url = "jdbc:mysql://localhost:3306/jsp_adso_15";
    String user = "root";
    String pass = "";

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
        st = con.createStatement();

        // ================= CREAR =================
        if ("crear".equals(request.getParameter("accion"))) {
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int stock = Integer.parseInt(request.getParameter("stock"));

            st.executeUpdate(
                "INSERT INTO producto(nombre, precio, stock) VALUES('" +
                nombre + "'," + precio + "," + stock + ")"
            );
        }

        // ================= ELIMINAR =================
        if (request.getParameter("eliminar") != null) {
            int id = Integer.parseInt(request.getParameter("eliminar"));
            st.executeUpdate("DELETE FROM producto WHERE id=" + id);
        }

        // ================= LISTAR =================
        rs = st.executeQuery("SELECT * FROM producto");

%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Productos</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
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
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button {
            padding: 10px 15px;
            border: none;
            background: #28a745;
            color: white;
            border-radius: 8px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #3498db;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .btn {
            padding: 6px 10px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-size: 13px;
        }

        .delete {
            background: red;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Gestión de Productos</h2>

    <!-- FORM CREAR -->
    <form method="POST">

        <input type="hidden" name="accion" value="crear">

        <input type="text" name="nombre" placeholder="Nombre" required>
        <input type="number" step="0.01" name="precio" placeholder="Precio" required>
        <input type="number" name="stock" placeholder="Stock" required>

        <button type="submit">Crear</button>

    </form>

    <!-- TABLA -->
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
        </tr>

        <%
            while (rs.next()) {
        %>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("nombre") %></td>
            <td><%= rs.getDouble("precio") %></td>
            <td><%= rs.getInt("stock") %></td>
            <td>
                <a class="btn delete"
                   href="?eliminar=<%= rs.getInt("id") %>"
                   onclick="return confirm('¿Eliminar producto?')">
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
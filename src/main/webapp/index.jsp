<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .login-box {
            width: 360px;
            padding: 30px;
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            color: white;
            text-align: center;
        }

        .login-box h2 {
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            outline: none;
        }

        input[type="submit"] {
            background: #00c6ff;
            color: white;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #0072ff;
        }

        .error {
            background: rgba(255,0,0,0.25);
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .title {
            font-size: 22px;
            font-weight: bold;
        }

        .subtitle {
            font-size: 13px;
            opacity: 0.8;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="login-box">

    <div class="title">🛒 Tienda Abarrotes</div>
    <div class="subtitle">Acceso al sistema administrativo</div>

    <%
        String mensaje = request.getParameter("error");
        if (mensaje != null) {
    %>
        <div class="error"><%= mensaje %></div>
    <%
        }
    %>

    <form action="/evidencia_adso/ingresar" method="POST">

        <input type="text" name="usuario" placeholder="Usuario" required>

        <input type="password" name="clave" placeholder="Clave" required>

        <input type="submit" value="Ingresar">

    </form>

</div>

</body>
</html>
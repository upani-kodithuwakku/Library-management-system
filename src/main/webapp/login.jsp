<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Login - SLIIT Library</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<header class="header">
    <div class="logo-section">
        <div class="logo-box">SL</div>
        <div>
            <h1>SLIIT Library Management System</h1>
            <p>User Login</p>
        </div>
    </div>

    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="register.jsp">Register</a>
    </nav>
</header>

<section class="dashboard">
    <h2>Login</h2>

    <%
        String error = request.getParameter("error");
        String success = request.getParameter("success");

        if ("invalid".equals(error)) {
    %>
    <p class="error-message">Invalid email or password.</p>
    <%
        }

        if ("registered".equals(success)) {
    %>
    <p class="success-message">Registration successful. Please login.</p>
    <%
        }

        if ("logout".equals(success)) {
    %>
    <p class="success-message">You have logged out successfully.</p>
    <%
        }
    %>

    <form action="login" method="post" class="user-form">

        <input type="email" name="email" placeholder="Email Address" required>

        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>

        <p>New user? <a href="register.jsp">Register here</a></p>
    </form>
</section>

<footer class="footer">
    <p>&copy; 2026 SLIIT Library Management System</p>
</footer>

</body>
</html>
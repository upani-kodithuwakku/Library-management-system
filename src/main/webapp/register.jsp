<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration - SLIIT Library</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>

<header class="header">
    <div class="logo-section">
        <div class="logo-box">SL</div>
        <div>
            <h1>SLIIT Library Management System</h1>
            <p>User Registration</p>
        </div>
    </div>

    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
    </nav>
</header>

<section class="dashboard">
    <h2>Register New User</h2>

    <%
        String error = request.getParameter("error");

        if ("emailExists".equals(error)) {
    %>
    <p class="error-message">Email already exists. Please use another email.</p>
    <%
        }
    %>

    <form action="register" method="post" class="user-form">

        <input type="text"
               name="fullName"
               placeholder="Full Name"
               required>

        <input type="email"
               name="email"
               placeholder="Email Address"
               required>

        <input type="text"
               name="phone"
               placeholder="Phone Number"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <select name="membershipType" required>
            <option value="">Select Membership Type</option>
            <option value="Student">Student</option>
            <option value="Lecturer">Lecturer</option>
            <option value="Staff">Staff</option>
        </select>

        <button type="submit">Register</button>

        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </form>
</section>

<footer class="footer">
    <p>&copy; 2026 SLIIT Library Management System</p>
</footer>

</body>
</html>
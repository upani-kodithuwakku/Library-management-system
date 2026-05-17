<%@ page import="com.library.model.User" %>

<%
    User loggedUser = (User) session.getAttribute("loggedUser");

    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - SLIIT Library</title>
    <link rel="stylesheet" href="css/user-dashboard.css">
</head>
<body>

<header class="header">
    <div class="logo-section">
        <div class="logo-box">SL</div>
        <div>
            <h1>SLIIT Library Management System</h1>
            <p>User Dashboard</p>
        </div>
    </div>

    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<section class="dashboard">
    <h2>Welcome, <%= loggedUser.getFullName() %></h2>

    <div class="dashboard-actions">
        <p>Use your account to manage borrowing records and profile details.</p>
        <a href="logout" class="primary-btn">Logout</a>
    </div>

    <div class="profile-card">
        <h3>Your Profile</h3>

        <p><strong>User ID:</strong> <%= loggedUser.getUserId() %></p>
        <p><strong>Full Name:</strong> <%= loggedUser.getFullName() %></p>
        <p><strong>Email:</strong> <%= loggedUser.getEmail() %></p>
        <p><strong>Phone:</strong> <%= loggedUser.getPhone() %></p>
        <p><strong>Membership Type:</strong> <%= loggedUser.getMembershipType() %></p>
        <p><strong>Role:</strong> <%= loggedUser.getRole() %></p>
        <p><strong>Status:</strong> <%= loggedUser.getStatus() %></p>
    </div>
</section>

<footer class="footer">
    <p>&copy; 2026 SLIIT Library Management System</p>
</footer>

</body>
</html>
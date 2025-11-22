<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI';
            background: #f0f2f5;
        }

        .sidebar {
            width: 240px;
            height: 100vh;
            position: fixed;
            background: #2c3e50;
            padding-top: 20px;
        }

        .sidebar a {
            display: block;
            padding: 14px 18px;
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
        }

        .sidebar a:hover {
            background: #34495e;
        }

        .content {
            margin-left: 240px;
            padding: 20px;
        }

        h2 {
            color: #2c3e50;
        }
    </style>
</head>

<body>

<div class="sidebar">
    <h3 style="color:white; text-align:center;">USER MENU</h3>
    <a href="${pageContext.request.contextPath}/profile">👤 Profile</a>
    <a href="${pageContext.request.contextPath}/logout">🚪 Logout</a>
</div>

<div class="content">
    <h2>Xin chào, ${sessionScope.account.username}</h2>
    <p>Chào mừng bạn đến với trang quản lý người dùng.</p>
</div>

</body>
</html>

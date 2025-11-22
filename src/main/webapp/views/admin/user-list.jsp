<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body { background:#f4f6f9; font-family:'Segoe UI'; }
    .sidebar {
        width:240px; height:100vh; background:#1f2937;
        position:fixed; left:0; top:0; padding-top:20px;
    }
    .sidebar a{
        display:block; color:#cbd5e1; padding:12px 20px; text-decoration:none; font-size:16px;
    }
    .sidebar a:hover{ background:#334155; color:white; }
    .sidebar .title{ color:white; font-size:20px; text-align:center; margin-bottom:25px; }
    .content{ margin-left:250px; padding:30px; }
</style>
</head>

<body>

<div class="sidebar">
    <div class="title">⚙ Admin Panel</div>
    <a href="${pageContext.request.contextPath}/admin/home">🏠 Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/category/list">📂 Category</a>
    <a href="${pageContext.request.contextPath}/admin/video/list">🎬 Video</a>
    <a href="${pageContext.request.contextPath}/admin/user/list" style="background:#334155;color:white;">👤 Users</a>
    <a href="${pageContext.request.contextPath}/profile">📄 My Profile</a>
    <a href="${pageContext.request.contextPath}/logout" class="text-danger">🔓 Logout</a>
</div>

<div class="content">
    <h3>👤 Danh sách Users</h3>
    <p class="text-muted">Quản lý tài khoản người dùng</p>
    <hr>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
            <thead class="table-dark">
            <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Status</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${users}" var="u">
                <tr>
                    <td>${u.username}</td>
                    <td>${u.email}</td>
                    <td>${u.phone}</td>

                    <td>
                        <c:if test="${u.admin}">
                            <span class="badge bg-danger">ADMIN</span>
                        </c:if>
                        <c:if test="${!u.admin}">
                            <span class="badge bg-primary">USER</span>
                        </c:if>
                    </td>

                    <td>
                        <c:if test="${u.active}">
                            <span class="badge bg-success">Active</span>
                        </c:if>
                        <c:if test="${!u.active}">
                            <span class="badge bg-secondary">Locked</span>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>
</div>

</body>
</html>

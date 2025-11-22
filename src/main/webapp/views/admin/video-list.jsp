<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Video List</title>
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
    .poster{
        width:80px; height:60px; object-fit:cover; border-radius:8px; border:1px solid #ddd;
    }
</style>
</head>

<body>

<div class="sidebar">
    <div class="title">⚙ Admin Panel</div>
    <a href="${pageContext.request.contextPath}/admin/home">🏠 Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/category/list">📂 Category</a>
    <a href="${pageContext.request.contextPath}/admin/video/list" style="background:#334155;color:white;">🎬 Video</a>
    <a href="${pageContext.request.contextPath}/admin/user/list">👤 Users</a>
    <a href="${pageContext.request.contextPath}/profile">📄 My Profile</a>
    <a href="${pageContext.request.contextPath}/logout" class="text-danger">🔓 Logout</a>
</div>

<div class="content">
    <h3>🎬 Danh sách Videos</h3>
    <p class="text-muted">Quản lý video trong hệ thống</p>
    <hr>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Poster</th>
                <th>Title</th>
                <th>Views</th>
                <th>Category</th>
                <th>Status</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${videos}" var="v">
                <tr>
                    <td>${v.videoId}</td>

                    <td>
                        <c:choose>
                            <c:when test="${not empty v.poster}">
                                <img class="poster"
                                     src="${pageContext.request.contextPath}/uploads/videos/${v.poster}">
                            </c:when>
                            <c:otherwise>
                                <img class="poster"
                                     src="${pageContext.request.contextPath}/uploads/default/no-image.png">
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>${v.title}</td>
                    <td>${v.views}</td>
                    <td>${v.category.categoryName}</td>

                    <td>
                        <c:if test="${v.active}">
                            <span class="badge bg-success">Active</span>
                        </c:if>
                        <c:if test="${!v.active}">
                            <span class="badge bg-secondary">Off</span>
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

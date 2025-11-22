<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            height: 100vh;
            background: #111827;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 20px;
            border-right: 1px solid rgba(255,255,255,0.05);
        }

        .sidebar .title {
            color: #ffffff;
            font-size: 20px;
            text-align: center;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #cbd5e1;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 16px;
            border-left: 3px solid transparent;
            transition: 0.2s;
        }

        .sidebar a:hover {
            background: #1f2937;
            color: white;
            border-left-color: #3b82f6;
        }

        .sidebar a.active {
            background: #1f2937;
            color: white;
            border-left-color: #3b82f6;
        }

        /* Content */
        .content {
            margin-left: 250px;
            padding: 25px 30px;
        }

        .topbar {
            background: white;
            padding: 14px 18px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            display:flex;
            align-items:center;
            justify-content:space-between;
        }

        .stat-card {
            background: white;
            border-radius: 14px;
            padding: 18px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            display:flex;
            align-items:center;
            justify-content:space-between;
        }
        .stat-icon {
            width:52px; height:52px;
            display:grid; place-items:center;
            border-radius:12px;
            font-size:24px;
        }

        .quick-card {
            background: white;
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            height:100%;
        }

        .section-card{
            background:white;
            padding:20px;
            border-radius:14px;
            box-shadow:0 3px 12px rgba(0,0,0,0.08);
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="title">⚙ Admin Panel</div>

    <a class="active" href="${pageContext.request.contextPath}/admin/home">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>
    <a href="${pageContext.request.contextPath}/admin/category/list">
        <i class="bi bi-folder2-open"></i> Category
    </a>
    <a href="${pageContext.request.contextPath}/admin/video/list">
        <i class="bi bi-film"></i> Video
    </a>
    <a href="${pageContext.request.contextPath}/admin/user/list">
        <i class="bi bi-people"></i> Users
    </a>
    <a href="${pageContext.request.contextPath}/profile">
        <i class="bi bi-person-circle"></i> My Profile
    </a>
    <a href="${pageContext.request.contextPath}/logout" class="text-danger">
        <i class="bi bi-box-arrow-right"></i> Logout
    </a>
</div>

<!-- Main content -->
<div class="content">

    <!-- Topbar -->
    <div class="topbar mb-4">
        <div>
            <h4 class="mb-0">Welcome back, Admin 👋</h4>
            <small class="text-muted">Quản lý hệ thống của bạn tại đây</small>
        </div>

        <!-- hiển thị tên admin nếu có session -->
        <div class="text-end">
            <small class="text-muted d-block">Tài khoản</small>
            <b>
                <c:out value="${sessionScope.account.username}" default="admin"/>
            </b>
        </div>
    </div>

    <!-- Stats -->
    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="stat-card">
                <div>
                    <small class="text-muted">Total Categories</small>
                    <h3 class="mb-0">
                        <c:out value="${categoryCount}" default="0"/>
                    </h3>
                </div>
                <div class="stat-icon bg-primary-subtle text-primary">
                    <i class="bi bi-folder2-open"></i>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stat-card">
                <div>
                    <small class="text-muted">Total Videos</small>
                    <h3 class="mb-0">
                        <c:out value="${videoCount}" default="0"/>
                    </h3>
                </div>
                <div class="stat-icon bg-success-subtle text-success">
                    <i class="bi bi-film"></i>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stat-card">
                <div>
                    <small class="text-muted">Total Users</small>
                    <h3 class="mb-0">
                        <c:out value="${userCount}" default="0"/>
                    </h3>
                </div>
                <div class="stat-icon bg-warning-subtle text-warning">
                    <i class="bi bi-people"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick actions -->
    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="quick-card">
                <h5 class="mb-2">📂 Category</h5>
                <p class="text-muted">Thêm / sửa / xóa danh mục video</p>

                <div class="d-grid gap-2">
                    <a class="btn btn-primary"
                       href="${pageContext.request.contextPath}/admin/category/add">
                        ➕ Thêm Category
                    </a>
                    <a class="btn btn-outline-primary"
                       href="${pageContext.request.contextPath}/admin/category/list">
                        Xem danh sách
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="quick-card">
                <h5 class="mb-2">🎬 Videos</h5>
                <p class="text-muted">Quản lý video, poster, lượt xem</p>

                <div class="d-grid gap-2">
                    <a class="btn btn-success"
                       href="${pageContext.request.contextPath}/admin/video/add">
                        ➕ Thêm Video
                    </a>
                    <a class="btn btn-outline-success"
                       href="${pageContext.request.contextPath}/admin/video/list">
                        Xem danh sách
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="quick-card">
                <h5 class="mb-2">👤 Users</h5>
                <p class="text-muted">Theo dõi tài khoản và trạng thái</p>

                <div class="d-grid gap-2">
                    <a class="btn btn-warning"
                       href="${pageContext.request.contextPath}/admin/user/list">
                        Xem Users
                    </a>
                    <a class="btn btn-outline-warning"
                       href="${pageContext.request.contextPath}/profile">
                        Hồ sơ Admin
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent section -->
    <div class="row g-3">
        <div class="col-md-7">
            <div class="section-card">
                <h5 class="mb-3">🕒 Hoạt động gần đây</h5>

                <!-- Nếu bạn chưa có dữ liệu recentActions thì để demo -->
                <c:choose>
                    <c:when test="${empty recentActions}">
                        <div class="text-muted">Chưa có hoạt động nào.</div>
                    </c:when>
                    <c:otherwise>
                        <ul class="list-group">
                            <c:forEach items="${recentActions}" var="a">
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>${a.content}</span>
                                    <small class="text-muted">${a.time}</small>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="col-md-5">
            <div class="section-card">
                <h5 class="mb-3">📌 Ghi chú hệ thống</h5>
                <p class="text-muted mb-2">• Kiểm tra user bị khóa</p>
                <p class="text-muted mb-2">• Cập nhật poster video chất lượng cao</p>
                <p class="text-muted mb-0">• Dọn dẹp category không còn dùng</p>
            </div>
        </div>
    </div>

</div>
</body>
</html>

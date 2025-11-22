<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title><decorator:title default="ADMIN PANEL"/></title>
    <decorator:head/>

    <!-- GLOBAL CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/global/plugins/fontawesome/css/all.min.css">

    <!-- ADMIN CSS (nếu có) -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/admin/css/style.css">

    <style>
        .admin-header { background:#111827; color:#fff; }
        .admin-sidebar { background:#0b1220; min-height:100vh; }
        .admin-sidebar a { color:#cbd5e1; display:block; padding:12px 16px; text-decoration:none; }
        .admin-sidebar a:hover { background:#1f2937; color:#fff; }
        .admin-footer { background:#111827; color:#fff; }
    </style>
</head>

<body>
    <!-- HEADER -->
    <header class="admin-header p-3 d-flex justify-content-between align-items-center">
        <div class="fw-bold fs-4">
            <i class="fa fa-cogs me-2"></i> ADMIN LAYOUT
        </div>
        <div>
            Xin chào, <b>${sessionScope.user.username}</b>
        </div>
    </header>

    <div class="d-flex">
        <!-- LEFT / SIDEBAR -->
        <aside class="admin-sidebar" style="width:240px;">
            <div class="p-3 text-white fw-bold border-bottom">MENU ADMIN</div>
            <a href="${pageContext.request.contextPath}/admin/home"><i class="fa fa-chart-line me-2"></i>Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/category"><i class="fa fa-list me-2"></i>Category</a>
            <a href="${pageContext.request.contextPath}/admin/video"><i class="fa fa-video me-2"></i>Video</a>
            <a href="${pageContext.request.contextPath}/admin/user"><i class="fa fa-users me-2"></i>Users</a>
            <a href="${pageContext.request.contextPath}/logout" class="text-danger">
                <i class="fa fa-sign-out-alt me-2"></i>Logout
            </a>
        </aside>

        <!-- BODY -->
        <main class="flex-grow-1 p-4 bg-light">
            <div class="alert alert-dark">
                <b>Đây là ADMIN layout</b> (Header đen + Sidebar trái)
            </div>

            <decorator:body/>
        </main>
    </div>

    <!-- FOOTER -->
    <footer class="admin-footer text-center py-3">
        © 2025 - ADMIN FOOTER (màu đen)
    </footer>

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/main.js"></script>
</body>
</html>

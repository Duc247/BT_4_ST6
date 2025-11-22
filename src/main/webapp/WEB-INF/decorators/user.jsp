<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title><decorator:title default="USER AREA"/></title>
    <decorator:head/>

    <!-- GLOBAL CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/global/plugins/fontawesome/css/all.min.css">

    <!-- FRONTEND CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/frontend/css/style.css">

    <style>
        .user-header { background:#16a34a; color:#fff; }
        .user-sidebar { background:#dcfce7; min-height:100vh; border-right:1px solid #bbf7d0; }
        .user-sidebar a { color:#14532d; display:block; padding:10px 14px; font-weight:600; text-decoration:none; }
        .user-sidebar a:hover { background:#bbf7d0; }
        .user-footer { background:#16a34a; color:#fff; }
    </style>
</head>

<body>
    <!-- HEADER -->
    <header class="user-header p-3 d-flex justify-content-between align-items-center">
        <div class="fw-bold fs-4">
            <i class="fa fa-leaf me-2"></i> USER LAYOUT
        </div>
        <div>
            Tài khoản: <b>${sessionScope.user.username}</b>
        </div>
    </header>

    <div class="d-flex">
        <!-- LEFT -->
        <aside class="user-sidebar" style="width:200px;">
            <div class="p-3 fw-bold">MENU USER</div>
            <a href="${pageContext.request.contextPath}/views/users/home.jsp">
                <i class="fa fa-home me-2"></i>Home
            </a>
            <a href="${pageContext.request.contextPath}/views/users/profile.jsp">
                <i class="fa fa-user me-2"></i>Profile
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="text-danger">
                <i class="fa fa-sign-out-alt me-2"></i>Logout
            </a>
        </aside>

        <!-- BODY -->
        <main class="flex-grow-1 p-4">
            <div class="alert alert-success">
                <b>Đây là USER layout</b> (Header xanh lá + Sidebar xanh nhạt)
            </div>

            <decorator:body/>
        </main>
    </div>

    <!-- FOOTER -->
    <footer class="user-footer text-center py-3">
        USER FOOTER (màu xanh lá)
    </footer>

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/frontend/js/main.js"></script>
</body>
</html>

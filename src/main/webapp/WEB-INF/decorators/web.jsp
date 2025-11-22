<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title><decorator:title default="PUBLIC SITE"/></title>
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
        .public-header { background:#2563eb; color:#fff; }
        .public-footer { background:#2563eb; color:#fff; }
    </style>
</head>

<body>
    <!-- HEADER -->
    <header class="public-header p-3">
        <div class="container d-flex justify-content-between align-items-center">
            <div class="fw-bold fs-4">
                <i class="fa fa-globe me-2"></i> PUBLIC LAYOUT
            </div>
            <div>
                <a class="text-white me-3 text-decoration-none"
                   href="${pageContext.request.contextPath}/views/home.jsp">Home</a>
                <a class="text-white me-3 text-decoration-none"
                   href="${pageContext.request.contextPath}/views/login.jsp">Login</a>
                <a class="text-white text-decoration-none"
                   href="${pageContext.request.contextPath}/views/register.jsp">Register</a>
            </div>
        </div>
    </header>

    <!-- BODY -->
    <main class="container mt-4">
        <div class="alert alert-primary">
            <b>Đây là PUBLIC layout</b> (Header xanh dương, **không có sidebar**)
        </div>

        <decorator:body/>
    </main>

    <!-- FOOTER -->
    <footer class="public-footer text-center py-3 mt-5">
        PUBLIC FOOTER (màu xanh dương)
    </footer>

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/assets/global/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

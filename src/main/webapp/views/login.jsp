<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>

    <!-- GLOBAL CSS (local) -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/global/plugins/fontawesome/css/all.min.css">

    <!-- FRONTEND TEMPLATE CSS (local)
         Nếu file chính của bạn tên khác (vd main.css/app.css) thì đổi đúng tên ở đây -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/frontend/css/style.css">

    <style>
        /* Giữ style tối giản để template frontend quyết định phần lớn */
        body{
            min-height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
            background:#f5f7fb; /* nền nhẹ giống web */
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, Arial, sans-serif;
        }
        .auth-card{
            width: 420px;
            border:0;
            border-radius:16px;
            box-shadow:0 10px 25px rgba(0,0,0,.08);
            overflow:hidden;
        }
        .auth-header{
            background:#ffffff;
            border-bottom:1px solid #eef1f6;
        }
        .form-control{
            height:48px;
            border-radius:12px;
            padding-left:42px;
        }
        .input-icon{
            position:absolute;
            left:14px; top:50%;
            transform: translateY(-50%);
            color:#6c757d;
            font-size:18px;
        }
        .btn-auth{
            height:48px;
            border-radius:12px;
            font-weight:600;
        }
        .small-link a{ text-decoration:none; }
        .small-link a:hover{ text-decoration:underline; }
    </style>
</head>

<body>

<div class="card auth-card">

    <!-- Header -->
    <div class="auth-header p-4 text-center">
        <div class="fs-1 mb-1 text-primary"><i class="fa-solid fa-right-to-bracket"></i></div>
        <h3 class="fw-bold mb-0">Đăng nhập</h3>
        <p class="text-muted mb-0">Vào hệ thống của bạn</p>
    </div>

    <!-- Body -->
    <div class="card-body p-4">

        <!-- Alert -->
        <c:if test="${not empty alert}">
            <div class="alert alert-danger text-center py-2">
                ${alert}
            </div>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/login" autocomplete="on">

            <!-- Username -->
            <div class="mb-3 position-relative">
                <i class="fa-regular fa-user input-icon"></i>
                <input value="${rememberedUser}" type="text" name="username"
                       class="form-control" placeholder="Tên đăng nhập" required>
            </div>

            <!-- Password -->
            <div class="mb-2 position-relative">
                <i class="fa-solid fa-lock input-icon"></i>
                <input type="password" name="password"
                       class="form-control" placeholder="Mật khẩu" required>
            </div>

            <!-- Remember + Forgot -->
            <div class="d-flex justify-content-between align-items-center my-3">
                <div class="form-check">
                    <input type="checkbox" name="remember" class="form-check-input" id="rememberMe">
                    <label for="rememberMe" class="form-check-label">Ghi nhớ đăng nhập</label>
                </div>
                <a class="small text-decoration-none"
                   href="${pageContext.request.contextPath}/reset_matkhau">
                    Quên mật khẩu?
                </a>
            </div>

            <!-- Submit -->
            <button class="btn btn-primary btn-auth w-100">
                Đăng nhập
            </button>

            <!-- Register -->
            <div class="mt-3 text-center small-link">
                Chưa có tài khoản?
                <a href="${pageContext.request.contextPath}/register">Tạo tài khoản</a>
            </div>
        </form>
    </div>
</div>

<!-- GLOBAL JS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>

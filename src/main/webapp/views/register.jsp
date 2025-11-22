<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>



<style>
    body {
        background: linear-gradient(135deg, #ff9a9e, #fad0c4);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', sans-serif;
    }

    .card {
        width: 450px;
        border-radius: 18px;
        padding: 30px;
        box-shadow: 0px 10px 25px rgba(0,0,0,0.20);
        animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .btn-success {
        background-color: #20bf6b;
        border: none;
    }

    .btn-success:hover {
        background-color: #1e9e59;
    }

    .form-control {
        border-radius: 10px;
    }
</style>

</head>
<body>

<div class="card">

    <h3 class="text-center mb-3">📝 Đăng ký tài khoản</h3>

    <p class="text-danger text-center">${alert}</p>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <input class="form-control mb-3" name="username" placeholder="Tên đăng nhập">

        <input class="form-control mb-3" name="email" placeholder="Email">

        <input class="form-control mb-3" name="phone" placeholder="Số điện thoại">

        <input class="form-control mb-3" type="password" name="password" placeholder="Mật khẩu">

        <input class="form-control mb-3" type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu">

        <button class="btn btn-success w-100">Đăng ký</button>

        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login">Đã có tài khoản? Đăng nhập</a>
        </div>
    </form>

</div>

</body>
</html>

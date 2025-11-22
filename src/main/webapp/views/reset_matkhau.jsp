<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>


<style>
    body {
        background: linear-gradient(135deg, #a18cd1, #fbc2eb);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Segoe UI', sans-serif;
    }

    .card {
        width: 400px;
        border-radius: 18px;
        padding: 30px;
        box-shadow: 0px 10px 25px rgba(0,0,0,0.20);
        animation: fadeIn 0.4s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-8px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .btn-primary {
        background-color: #6a89cc;
        border: none;
    }

    .btn-primary:hover {
        background-color: #4a69bd;
    }

    .form-control {
        border-radius: 10px;
    }
</style>

</head>
<body>

<div class="card">

    <h3 class="text-center mb-3">🔄 Đặt lại mật khẩu</h3>

    <p class="text-danger text-center">${alert}</p>

    <form action="${pageContext.request.contextPath}/reset_matkhau" method="post">

        <input class="form-control mb-3" name="username" placeholder="Tên đăng nhập">

        <input class="form-control mb-3" type="password" name="newPassword" placeholder="Mật khẩu mới">

        <input class="form-control mb-3" type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu">

        <button class="btn btn-primary w-100">Xác nhận</button>

        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a>
        </div>

    </form>

</div>

</body>
</html>

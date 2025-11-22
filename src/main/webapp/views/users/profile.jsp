<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ cá nhân</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
            font-family: 'Segoe UI';
        }
        .profile-card {
            max-width: 650px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #ddd;
        }
    </style>
</head>

<body>

<div class="profile-card">

    <h3 class="text-center mb-3">👤 Hồ sơ cá nhân</h3>

    <p class="text-danger text-center">${error}</p>
    <p class="text-success text-center">${success}</p>

    <form action="${pageContext.request.contextPath}/profile" 
          method="post" enctype="multipart/form-data">

        <div class="text-center mb-3">
         <img class="avatar"
     src="${pageContext.request.contextPath}/uploads/users/${user.images}"
     alt="Avatar">


        </div>

        <div class="mb-3">
            <label class="form-label">Ảnh đại diện</label>
            <input type="file" name="images" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Tên đăng nhập</label>
            <input type="text" name="username" class="form-control" 
                   value="${user.username}" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="text" name="email" class="form-control" 
                   value="${user.email}" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Họ và tên</label>
            <input type="text" name="fullname" class="form-control" 
                   value="${user.fullname}">
        </div>

        <div class="mb-3">
            <label class="form-label">Số điện thoại</label>
            <input type="text" name="phone" class="form-control" 
                   value="${user.phone}">
        </div>

        <button class="btn btn-primary w-100 mt-2">Lưu thay đổi</button>

    </form>

</div>

</body>
</html>

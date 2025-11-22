<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Category</title>

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

    .card {
        max-width:650px; margin:auto; padding:30px;
        border-radius:12px; box-shadow:0 4px 20px rgba(0,0,0,0.1);
        background:white;
    }
    .preview-img{
        width:140px; height:140px; object-fit:cover; border-radius:12px; border:2px solid #ddd;
        display:block; margin:auto;
    }
</style>

<script>
function previewImage(event){
    let img = document.getElementById("preview");
    img.src = URL.createObjectURL(event.target.files[0]);
}
</script>

</head>
<body>

<div class="sidebar">
    <div class="title">⚙ Admin Panel</div>
    <a href="${pageContext.request.contextPath}/admin/home">🏠 Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/category/list" style="background:#334155;color:white;">📂 Category</a>
    <a href="${pageContext.request.contextPath}/admin/video/list">🎬 Video</a>
    <a href="${pageContext.request.contextPath}/admin/user/list">👤 Users</a>
    <a href="${pageContext.request.contextPath}/profile">📄 My Profile</a>
    <a href="${pageContext.request.contextPath}/logout" class="text-danger">🔓 Logout</a>
</div>

<div class="content">

    <div class="card">
        <h3 class="text-center mb-3">✏ Cập nhật Category</h3>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form method="post"
              action="${pageContext.request.contextPath}/admin/category/edit"
              enctype="multipart/form-data">

            <input type="hidden" name="id" value="${category.categoryId}">

            <div class="text-center mb-3">
                <c:choose>
                    <c:when test="${not empty category.images}">
                        <img id="preview" class="preview-img"
                             src="${pageContext.request.contextPath}/uploads/categories/${category.images}">
                    </c:when>
                    <c:otherwise>
                        <img id="preview" class="preview-img"
                             src="${pageContext.request.contextPath}/uploads/default/no-image.png">
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="mb-3">
                <label class="form-label">Ảnh Category</label>
                <input type="file" name="image" class="form-control" accept="image/*"
                       onchange="previewImage(event)">
            </div>

            <div class="mb-3">
                <label class="form-label">Tên Category</label>
                <input type="text" name="name" class="form-control"
                       value="${category.categoryName}">
            </div>

            <div class="mb-3">
                <label class="form-label">Mã Category</label>
                <input type="text" name="code" class="form-control"
                       value="${category.categoryCode}">
            </div>

            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" name="status"
                       id="st" ${category.status ? "checked" : ""}>
                <label class="form-check-label" for="st">Kích hoạt</label>
            </div>

            <button class="btn btn-primary w-100">Lưu thay đổi</button>
            <a class="btn btn-secondary w-100 mt-2"
               href="${pageContext.request.contextPath}/admin/category/list">Quay lại</a>
        </form>

    </div>

</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Category</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: #f4f6f9;
        font-family: 'Segoe UI';
    }

    .card {
        max-width: 650px;
        margin: 50px auto;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }

    .preview-img {
        width: 140px;
        height: 140px;
        border-radius: 12px;
        object-fit: cover;
        border: 2px solid #ddd;
        display: block;
        margin: auto;
    }
</style>

<script>
function previewImage(event) {
    let img = document.getElementById("preview");
    img.src = URL.createObjectURL(event.target.files[0]);
    img.style.display = "block";
}
</script>

</head>
<body>

<div class="card">

    <h3 class="text-center mb-3">➕ Thêm danh mục</h3>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/category/add"
      method="post" enctype="multipart/form-data">

    <!-- Ảnh -->
    <label class="form-label">Ảnh danh mục</label>
    <input type="file" name="image" class="form-control mb-3" accept="image/*">

    <!-- Tên -->
    <label class="form-label">Tên danh mục</label>
    <input type="text" name="name" class="form-control mb-3" required>

    <!-- Mã -->
    <label class="form-label">Mã danh mục</label>
    <input type="text" name="code" class="form-control mb-3" required>

    <!-- Trạng thái -->
    <div class="form-check mb-3">
        <input class="form-check-input" type="checkbox" name="status" id="status">
        <label class="form-check-label" for="status">Kích hoạt</label>
    </div>

    <button class="btn btn-primary w-100">Thêm mới</button>
</form>


</div>

</body>
</html>

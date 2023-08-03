<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
<link rel="stylesheet" href="style.css" />
</head>
<body>
	<section class="container product-management">
		<h3 class="title">QUẢN LÝ SẢN PHẨM</h3>
		<div class="product-form">
			<form class="needs-validation" novalidate
				action="http://localhost:8080/Assignment/product-manage"
				method="post">
				<div class="form-group">
					<label for="productName">Tên sản phẩm</label> <input type="text"
						class="form-control" id="productName" name="productName" required />
					<div class="invalid-feedback">Vui lòng nhập tên sản phẩm hợp lệ</div>
				</div>
				<div class="form-group">
					<label for="quantity">Số lượng</label> <input type="number"
						class="form-control" id="quantity" name="quantity" required
						min="1" />
					<div class="invalid-feedback">Vui lòng nhập số lượng hợp lệ</div>
				</div>
				<div class="form-group">
					<label for="price">Giá bán</label> <input type="number"
						class="form-control" id="price" name="price" required min="1000" />
					<div class="invalid-feedback">Vui lòng nhập giá bán hợp lệ</div>
				</div>
				<button class="btn btn-primary button-save" type="submit">
					Lưu lại
				</button>
			</form>
		</div>

		<div class="products-table">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Số lượng</th>
						<th scope="col">Giá bán</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${listProduct == null}">
							<tr>
								<td colspan="4">Không có sản phẩm nào</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${listProduct}" varStatus="position">
								<tr>
									<td>${(position.index + 1)}</td>
									<td>${item.name}</td>
									<td>${item.quantity}</td>
									<td>${item.price}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
		
	</script>
	<script>
		// disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						var forms = document
								.getElementsByClassName('needs-validation');
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
	</script>
</body>
</html>
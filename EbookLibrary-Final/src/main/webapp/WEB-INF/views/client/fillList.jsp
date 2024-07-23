<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="/assets/css/home.css">


</head>
<body>
	<link rel="stylesheet" href="/assets/css/FillList.css">
	<script src="/assets/js/sanPham.js"></script>

	<span class="top-bg-op-box"
		style="background-image: url(&quot;https://static.cdnno.com/storage/topbox/15d256d4071bbb3d0dd2a38cf1af8e5a.webp&quot;); position: absolute; z-index: 0; left: 0px; overflow: hidden; width: 100%; height: 388px; background-repeat: no-repeat; background-position: 50% 0px; background-size: cover;"></span>
	<div style="height: 280px;"></div>
	<main class="container">
		<div class="title">
			<p>Top thịnh hành</p>
		</div>
		<div class="row">
			<c:forEach var="item" items="${listProduct}">
				<!-- Sản phẩm -->
				<div class="col-md-3 SP">
					<div class="card">
						<div class="image-container">
							<img class="rounded-3 default-img" src="${item.image}"
								alt="Title" width="100%" height="" />
							<c:forEach var="itemImg" items="${item.imageProducts}">
								<img class="rounded-3 default-img" src="${itemImg.name}"
									alt="Title" width="100%" height="" />
							</c:forEach>
						</div>
						<div class="card-body">
							<h5 class="card-title text-ellipsis">${item.name}</h5>
							<h5 class="card-text textOranger" style="color: red">
								<span
									style="text-decoration: line-through; color: rgba(0, 0, 0, 0.463)"><fmt:formatNumber>${item.price}</fmt:formatNumber><sup>đ</sup></span>
								<fmt:formatNumber>${item.price-item.discount}</fmt:formatNumber>
								<sup>đ</sup>
							</h5>
							<div class="star">
								<span class="active" style="width: 100%;"> <c:set
										var="totalStar" value="0" /> <c:forEach var="it"
										items="${item.evalues}">
										<c:set var="totalStar" value="${totalStar+it.star}" />
									</c:forEach> <c:forEach begin="1" end="${totalStar/item.evalues.size()}">
										<i class="bi bi-star-fill text-warning"></i>
									</c:forEach>

								</span> <span class="d-inline-block ml-2">Đã bán <fmt:formatNumber>${item.quantitySell}</fmt:formatNumber>
								</span>
							</div>
							<div class="row">
								<a class="col-md-6 btn btn-outline-danger"
									href="/user/buybookdetails/${item.id}">Mua Ngay</a>
								<div class="col-md-6 ">
									<i class="bi bi-heart-fill heard"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>



		</div>
		<div class="btn-toolbar justify-content-center" role="toolbar"
			aria-label="Toolbar with button groups">
			<div class="btn-group me-2" role="group" aria-label="First group">
				<c:forEach begin="1" end="${totalPages}" varStatus="index">
					<a href="/user/fillist/page/${index.count-1}"
						class="btn btn-outline-success pageIndex">${index.count}</a>
				</c:forEach>
			</div>
		</div>
	</main>
</body>
</html>
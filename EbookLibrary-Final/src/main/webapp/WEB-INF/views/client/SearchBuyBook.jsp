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
</head>
<body>
	<link rel="stylesheet" href="/assets/css/SearchBuyBook.css">
	<style>
</style>
	<span class="top-bg-op-box"
		style="background-image: url(&quot;https://static.cdnno.com/storage/topbox/15d256d4071bbb3d0dd2a38cf1af8e5a.webp&quot;); position: absolute; z-index: 0; left: 0px; overflow: hidden; width: 100%; height: 388px; background-repeat: no-repeat; background-position: 50% 0px; background-size: cover;"></span>
	<div style="height: 280px;"></div>
	<main class="main pb-4 container">
		<div class="Panel1 row">
			<article class="col-md-3">
				<!-- <h4>BỘ LỌC TÌM KIẾM</h4> -->
				<div class="find">
					<div class="find-title">Thể loại</div>
					<form action="/user/category" method="get">
						<c:forEach var="item" items="${listCategories}">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="category"
									id="${item.id}" value="${item.id}" name="category"> <label
									class="form-check-label" for="${item.id}">${item.name}</label>
							</div>
						</c:forEach>
						<div class="form-check">
							<button class="btn btn-success">Áp dụng</button>
						</div>
					</form>
				</div>
				<div class="find">
					<div class="find-title">Nơi bán</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="NBHCM">
						<label class="form-check-label" for="NBHCM"> Hồ Chí Minh </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="NBCanTho">
						<label class="form-check-label" for="NBCanTho"> Cần Thơ </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="NBDaNang">
						<label class="form-check-label" for="NBDaNang"> Đà Nẵng </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="NBHaNoi">
						<label class="form-check-label" for="NBHaNoi"> Hà Nội </label>
					</div>
					<div>
						<p class="text-secondary text-center">Xem thêm</p>
					</div>
				</div>

				<div class="find">
					<div class="find-title">Giá bán</div>
					<form action="/user/filtePrice" method="get">
						<div class="mb-3 form-group">
							<label for="giatu" class="form-label">Giá từ (VNĐ)</label> <input
								type="number" class="form-control" id="giatu" placeholder=""
								name="priceMin" required>
						</div>
						<div class="mb-3 form-group">
							<label for="giaden" class="form-label">Đến (VNĐ)</label> <input
								type="number" class="form-control" id="giaden" placeholder=""
								required name="priceMax">
						</div>
						<div align="center">
							<button class="btn btn-outline-success"
								style="padding: 5px 20px;">Áp dụng</button>
						</div>
					</form>
				</div>
				<form action="/user/evaluate" method="get">
					<div class="find">
						<div class="find-title">Đánh giá</div>
						<div class="form-check">
							<input class="form-check-input" name="starRadio" type="radio"
								value="5" id="starRadio5"> <label
								class="form-check-label" for="starRadio5"> <span
								class="active" style="width: 100%;"> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i>
							</span>
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" name="starRadio" type="radio"
								value="4" id="starRadio4"> <label
								class="form-check-label" for="starRadio4"> <span
								class="active" style="width: 100%;"> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill"></i> Trở lên
							</span>
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" name="starRadio" type="radio"
								value="3" id="starRadio3"> <label
								class="form-check-label" for="starRadio3"> <span
								class="active" style="width: 100%;"> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									Trở lên
							</span>
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" name="starRadio" type="radio"
								value="2" id="starRadio2"> <label
								class="form-check-label" for="starRadio2"> <span
								class="active" style="width: 100%;"> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
									class="bi bi-star-fill"></i> Trở lên
							</span>
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" name="starRadio" type="radio"
								value="1" id="starRadio1"> <label
								class="form-check-label" for="starRadio1"> <span
								class="active" style="width: 100%;"> <i
									class="bi bi-star-fill text-warning"></i> <i
									class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
									class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									Trở lên
							</span>
							</label>
						</div>
					</div>
					<div align="center">
						<button class="btn btn-outline-success" style="padding: 5px 50px;">Lọc</button>
					</div>
				</form>
			</article>
			<aside class="col-md-9 row justify-content-center">
				<form action="" method="get">
					<div class="col-md-12 arrange" style="max-height: 110px">
						<p>Sắp xếp theo</p>
						<button formaction="/user/arrangeprice">Giá bán</button>
						<button>Lượt mua</button>
						<button>Mới nhất</button>
						<div class="numberPage">${indexPage+1}/${totalPages}</div>
					</div>
				</form>


				<c:forEach var="item" items="${listProducts}">
					<!-- Sản phẩm -->
					<div class="col-md-4 SP">
						<div class="card">
							<div class="image-container">
								<img class="rounded-3 default-img"
									src="/assets/img/${item.image}" alt="Title" width="100%"
									height="" />
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
				<div class="btn-toolbar justify-content-center" role="toolbar"
					style="position: relative;" aria-label="Toolbar with button groups">
					<div class="btn-group me-2" role="group" aria-label="First group"
						style="position: absolute; bottom: 0px">
						<!-- 	<button type="button" class="btn btn-outline-success">...</button> -->
						<c:forEach begin="1" end="${totalPages}" varStatus="index">
							<a href="/user/page/${index.count-1}"
								class="btn btn-outline-success pageIndex">${index.count}</a>
						</c:forEach>

						<!-- 	<button type="button" class="btn btn-outline-successs">...</button> -->
					</div>
				</div>
			</aside>
		</div>
	</main>
	<script src="/assets/js/sanPham.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<body>
	<!-- /assets/img/background/changpass.jpg -->
	<style>
</style>
	<link rel="stylesheet" href="/assets/css/buyBook.css" />
	<link rel="stylesheet" href="/assets/css/storeHome.css">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4">
						<c:if test="${account.background == null}">

							<div class="introduce"
								style="background-image: url('/assets/img/background/changpass.jpg')">
								<div class="introduce-store">
									<c:if test="${account.avatar == null && account.gender ==true}">
										<img
											src="https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png"
											alt="">
									</c:if>
									<c:if
										test="${account.avatar == null && account.gender == false}">
										<img
											src="https://cdn.pixabay.com/photo/2017/01/30/23/52/female-2022387_1280.png"
											alt="">
									</c:if>
									<c:if test="${account.avatar != null}">
										<img
											src="/assets/img/${account.avatar}"
											alt="">
									</c:if>
									<div class="nameStore">
										<h5>${account.shopName}</h5>
										<p>${account.addresses[0].fullNameAddress}</p>
									</div>

								</div>
								<div class="subscribe-message">
									<div class="subscribe">

										<c:if test="${checkFollower == true}">
											<a href="/user/storehome/follower">Đang theo dõi</a>
										</c:if>
										<c:if test="${checkFollower == false}">
											<a href="/user/storehome/follower">Theo dõi</a>
										</c:if>
									</div>
									>
									<div class="message">
										<a href="">Nhắn tin</a>
									</div>

								</div>
							</div>


						</c:if>

						<c:if test="${account.background != null}">

							<div class="introduce"
								style="background-image: url('/assets/img/${account.background}')">
								<div class="introduce-store">
									<c:if test="${account.avatar == null && account.gender ==true}">
										<img
											src="https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png"
											alt="">
									</c:if>
									
									<c:if
										test="${account.avatar == null && account.gender == false}">
										<img
											src="https://cdn.pixabay.com/photo/2017/01/30/23/52/female-2022387_1280.png"
											alt="">
									</c:if>
									<c:if test="${account.avatar != null}">
										<img
											src="/assets/img/${account.avatar}"
											alt="">
									</c:if>
									<div class="nameStore">
										<h5>${account.shopName}</h5>
										<p>${account.addresses[0].fullNameAddress}</p>
									</div>

								</div>
								<div class="subscribe-message">
									<div class="subscribe">

										<c:if test="${checkFollower == true}">
											<a href="/user/storehome/follower">Đang theo dõi</a>
										</c:if>
										<c:if test="${checkFollower == false}">
											<a href="/user/storehome/follower">Theo dõi</a>
										</c:if>
									</div>
									
									<div class="message">
										<a href="">Nhắn tin</a>
									</div>

								</div>
							</div>


						</c:if>
					</div>
					<div class="col-md-8">
						<div class="sales-information">
							<div class="row-1">
								<div class="row">
									<div class="col-md-6">
										<p>
											Sản phẩm : <span><fmt:formatNumber>${account.products.size()}</fmt:formatNumber></span>
										</p>
									</div>
									<div class="col-md-6">
										<p>
											Người theo dõi : <span><fmt:formatNumber>${listFollower.size()}</fmt:formatNumber></span>
										</p>
									</div>
								</div>
							</div>
							<div class="row-2">
								<div class="row">
									<div class="col-md-6">
										<p>
											Đang theo dõi : <span><fmt:formatNumber>${account.followers.size()}</fmt:formatNumber></span>
										</p>
									</div>
									<div class="col-md-6">
										<p>
											Đánh giá : <span><fmt:formatNumber>${listEvalue.size()}</fmt:formatNumber></span>
										</p>
									</div>
								</div>
							</div>
							<div class="row-3">
								<div class="row">
									<div class="col-md-6">
										<p>
											Trạng thái kinh doanh : <span>${account.status == true?'Đang hoạt động':'Ngừng hoạt động'}</span>
										</p>
									</div>
									<div class="col-md-6">
										<c:forEach var="item" items="${account.roledetails}">
											<c:if test="${item.role.name == 'seller'}">
												<p>
													Tham gia : <span>${item.registrationDate}</span>
												</p>
											</c:if>
										</c:forEach>

									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>

			<!-- 	Sản phẩm -->

			<div class="page-content rounded-2">
				<div class="row">
					<div class="col-md-6">
						<h4 class="titlePage1" style="margin-left: 20px; font-size: 30px">Bán
							chạy</h4>
					</div>

					<div class="col-md-6">
						<h6 class="xemThem" style="cursor: pointer;">Xem Thêm</h6>
					</div>
				</div>
				<div class="slider-container">
					<div class="slider1">
						<div class="cardMoi2">
							<div class="row">
								<c:forEach var="item" items="${listProductHot}">
									<!-- Sản phẩm -->
									<div class="col-md-3 SP">
										<div class="card">
											<div class="image-container">
												<img class="rounded-3 default-img" src="/assets/img/${item.image}"
													alt="Title" width="100%" height="" />
												<c:forEach var="itemImg" items="${item.imageProducts}">
													<img class="rounded-3 default-img" src="${itemImg.name}"
														alt="Title" width="100%" height="" />
												</c:forEach>
											</div>
											<div class="card-body">
												<h5 class="card-title">${item.name}</h5>
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
														</c:forEach> <c:forEach begin="1"
															end="${totalStar/item.evalues.size()}">
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
						</div>
					</div>
				</div>
			</div>

			<div class="page-content rounded-2">
				<div class="row">
					<div class="col-md-6">
						<h4 class="titlePage1" style="margin-left: 20px; font-size: 30px">Mới
							Nhất</h4>
					</div>

					<div class="col-md-6">
						<h6 class="xemThem" style="cursor: pointer;">Xem Thêm</h6>
					</div>
				</div>
				<div class="slider-container">
					<div class="slider">
						<c:forEach var="item" items="${listProductNew}">
							<div class="card SP cardMoi">
								<div class="image-container">
									<img class="rounded-3 default-img" src="${item.image}"
										alt="Title" width="100%" height="" />
									<c:forEach var="itemImg" items="${item.imageProducts}">
										<img class="rounded-3 default-img" src="${itemImg.name}"
											alt="Title" width="100%" height="" />
									</c:forEach>
								</div>
								<div class="card-body">
									<h5 class="card-title">${item.name}</h5>
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
						</c:forEach>

					</div>
				</div>
			</div>
















		</div>
	</div>
	<script>
          const slider = document.querySelector('.slider');
          let isDown = false;
          let startX;
          let scrollLeft;
          const slider1 = document.querySelector('.slider1');
  
          slider.addEventListener('mousedown', (e) => {
              isDown = true;
              startX = e.pageX - slider.offsetLeft;
              scrollLeft = slider.scrollLeft;
          });
  
          slider.addEventListener('mouseleave', () => {
              isDown = false;
          });
  
          slider.addEventListener('mouseup', () => {
              isDown = false;
          });
  
          slider.addEventListener('mousemove', (e) => {
              if (!isDown) return;
              e.preventDefault();
              const x = e.pageX - slider.offsetLeft;
              const walk = (x - startX) * 2; // The multiplication factor controls the speed of the scroll
              slider.scrollLeft = scrollLeft - walk;
          });


          slider1.addEventListener('mousedown', (e) => {
              isDown = true;
              startX = e.pageX - slider1.offsetLeft;
              scrollLeft = slider1.scrollLeft;
          });
  
          slider1.addEventListener('mouseleave', () => {
              isDown = false;
          });
  
          slider1.addEventListener('mouseup', () => {
              isDown = false;
          });
  
          slider1.addEventListener('mousemove', (e) => {
              if (!isDown) return;
              e.preventDefault();
              const x = e.pageX - slider1.offsetLeft;
              const walk = (x - startX) * 2; // The multiplication factor controls the speed of the scroll
              slider1.scrollLeft = scrollLeft - walk;
          });
      </script>

</body>
</html>
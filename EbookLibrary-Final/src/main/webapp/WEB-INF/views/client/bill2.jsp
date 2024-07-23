
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill</title>
</head>
<body>
	<link rel="stylesheet" href="/assets/css/bill.css">
	<main class="container" style="margin: 0px; max-width: 2000px;">
		<div class="row">

			<aside class="col-md-2">
				<nav class="vertical-menu">
					<div class="menu-item">
						<a class="text-nav" href="javascript:void(0);"
							onclick="toggleSubmenu()">Thông Tin Cá Nhân</a>
						<div class="submenu">
							<a class="text-subnav" href="/Ebook/account/updateProfile">Xem
								Hồ Sơ</a> <a class="text-subnav" href="/Ebook/account/banks">Ngân
								Hàng</a>
						</div>
					</div>
					<a class="activeMenu2" href="/Ebook/account/bill">Đơn Hàng</a>
				</nav>
			</aside>

			<aside class="col-md-10">
				<div class="container-row">
					<div class="row">
						<div class="col-9 menuNgangNe">
							<div class="nav navbar">
								<li class="nav-item"><a
									class="nav-linkMenu ${activeMenu == 'TATCA' ? 'activeMenu3' : ''}"
									id="tatCa" aria-current="page" href="/user/bill/TATCA">Tất
										cả</a></li>
								<li class="nav-item"><a
									class="nav-linkMenu ${activeMenu == 'CHUANBI' ? 'activeMenu3' : ''}"
									id="vanChuyen" aria-current="page" href="/user/bill/CHUANBI">Chuẩn
										bị hàng</a></li>
								<li class="nav-item"><a
									class="nav-linkMenu ${activeMenu == 'VANCHUYEN' ? 'activeMenu3' : ''}"
									id="choGiaoHang" aria-current="page"
									href="/user/bill/VANCHUYEN">Vận chuyển</a></li>
								<li class="nav-item"><a
									class="nav-linkMenu ${activeMenu == 'DANHANHANG' ? 'activeMenu3' : ''}"
									id="daNhanHang" aria-current="page"
									href="/user/bill/DANHANHANG">Nhận hàng</a></li>
								<li class="nav-item"><a
									class="nav-linkMenu ${activeMenu == 'HOANTHANH' ? 'activeMenu3' : ''}"
									id="hoanThanh" aria-current="page" href="/user/bill/HOANTHANH">Hoàn
										thành</a></li>
								<li class="nav-item"><a
									class="nav-linkMenu ${activeMenu == 'DAHUY' ? 'activeMenu3' : ''}"
									id="daHuy" aria-current="page" href="/user/bill/DAHUY">Đã
										hủy</a></li>
							</div>
						</div>
					</div>
				</div>

				<div class="container-card">
					<c:forEach var="bill" items="${bills}">
						<input type="hidden" value="${bill.id}">
						<div class="card">
							<div>
								<p class="noiDungPhai">
									<c:choose>
										<c:when test="${bill.orderStatus.id == 5}">
											<span class="trangThai">Đơn hàng đã được giao thành
												công</span>
										</c:when>
									</c:choose>
								</p>
							</div>

							<c:set var="shopProductsMap"
								value="${billShopProductsMap[bill.id]}" />

							<c:forEach var="entry" items="${shopProductsMap.entrySet()}">
								<div class="card-header">
									<div class="tenNguoiBan">
										<img width="24px" height="24px"
											src="/assets/img/icon/user.png" alt="Seller Icon">
										<h5>${entry.key}</h5>
									</div>
								</div>

								<c:forEach var="billDetail" items="${entry.value}">
									<div class="card-body">
										<div class="list-book">
											<div class="book">
												<img src="${billDetail.product.image}" alt="Product Image">
												<div class="book-content">
													<a href="/Ebook/account/billDetails"
														value="${billDetail.product.name}" name="namePro">${billDetail.product.name}</a>
													<div class="content">${billDetail.product.introduce}</div>
													<div class="row info">
														<div class="col-6 info-book">
															<p class="gia">
																<fmt:formatNumber value="${billDetail.product.price}" />
																đ
															</p>
															<p class="soLuong">x${billDetail.quantity}</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="chucNang">
										<p class="thanhTien">
											<span class="soLuong">${bill.quantity} mặt hàng:</span> <span
												class="gia"> <fmt:formatNumber
													value="${bill.totalPrice}" pattern="#,##0" />đ
											</span>
										</p>
									</div>
									<c:choose>
										<c:when test="${bill.orderStatus.id == 5}">
											<div class="hoanthanh">
												<div>
													<c:choose>
														<c:when
															test="${evaluatedProductIds.contains(billDetail.product.id)}">
															<form action="/user/xemdanhgia/${billDetail.product.id}"
																method="post">
																<button type="submit" class="btn btn-outline-secondary">Xem
																	đánh giá</button>
															</form>
														</c:when>

														<c:otherwise>
															<form action="/user/danhgia/${billDetail.product.id}"
																method="post">
																<button type="submit" class="btn btn-outline-secondary">Đánh
																	giá sản phẩm</button>
															</form>
														</c:otherwise>
													</c:choose>
												</div>
												<div>
													<form action="/user/mualai/${billDetail.product.id}"
														method="post">
														<button type="submit" class="btn btn-success btn-mualai">Mua
															lại</button>
													</form>
												</div>
											</div>
										</c:when>
									</c:choose>

									<c:if test="${bill.status == false}">
										<div class="hoanthanh">
											<form action="/user/mualai/${billDetail.product.id}"
												method="post">
												<button type="submit" class="btn btn-success btn-mualai">Mua
													lại</button>
											</form>
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>

							<div class="card-footer">
								<div class="chucNang">
									<div class="button-edit">
										<c:if test="${bill.status == true}">
											<c:choose>
												<c:when test="${bill.orderStatus.id == 1}">
													<button type="button"
														class="btn btn-outline-secondary btn-huy"
														data-bs-toggle="modal" data-bs-target="#exampleModal"
														data-bs-whatever="@getbootstrap">Hủy đơn</button>

													<div class="modal fade" id="exampleModal" tabindex="-1"
														aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<form action="/user/huydon/${bill.id}" method="post">
																	<div class="modal-body">
																		<div class="mb-3">
																			<label for="recipient-name" class="col-form-label">Xác
																				nhận hủy đơn hàng</label>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Hủy</button>
																		<button type="submit" class="btn btn-success">Xác
																			nhận</button>
																	</div>
																</form>
															</div>
														</div>
													</div>

													<form action="/user/xemdonhang/${bill.id}" method="post">
														<button type="submit" class="btn btn-outline-success">
															Xem đơn hàng</button>
													</form>
												</c:when>

												<c:when test="${bill.orderStatus.id == 2}">
													<form action="/user/xemdonhang/${bill.id}" method="post">
														<button type="submit" class="btn btn-outline-success">
															Xem đơn hàng</button>
													</form>
												</c:when>

												<c:when test="${bill.orderStatus.id == 3}">
													<form action="/user/xemdonhang/${bill.id}" method="post">
														<button type="submit" class="btn btn-outline-success">
															Xem đơn hàng</button>
													</form>
												</c:when>

												<c:when test="${bill.orderStatus.id == 4}">
													<form action="/user/xemdonhang/${bill.id}" method="post">
														<button type="submit" class="btn btn-outline-success">
															Xem đơn hàng</button>
													</form>

													<form action="/user/xacnhan/${bill.id}" method="post">
														<button type="submit" class="btn btn-success ">Xác
															nhận đã nhận hàng</button>
													</form>
												</c:when>
											</c:choose>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</aside>
		</div>
	</main>

	<script type="text/javascript">
		function toggleSubmenu() {
			var menuItem = document.querySelector('.menu-item');
			if (menuItem) {
				menuItem.classList.toggle('open');
			}
		}
	</script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Details</title>

</head>

<body>
	<link rel="stylesheet" href="/assets/css/billDetails.css">
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
					<a class="activeMenu2" href="/account/bill">Đơn Hàng</a>
				</nav>
			</aside>
			<aside class="col-md-10 container-edit">
				<div class="row">
					<div class="col-12 menuNgangNe">
						<div>
							<a href="/user/trolaibills" style="cursor: pointer">
								<p class="tenNguoiBan" style="color: black" /> <img width="24"
								height="24" src="https://img.icons8.com/ios/50/back--v1.png"
								alt="back--v1" alt="left-squared"> Trở lại
								</p>
							</a>
						</div>
						<div class="noiDungPhai-container">
							<div class="trangThai-cont">
								<span class="trangThai">MÃ ĐƠN HÀNG: ${idBill}</span>
							</div>
							<div class="trangthai2-cont">
								<c:if test="${orderStatus == 'Hoàn Thành'}">
									 | <span class="danhGia"> ĐƠN HÀNG ĐÃ HOÀN THÀNH</span>
								</c:if>
							</div>
						</div>
					</div>
				</div>


				<div class="container-vanChuyen">
					<div class="card card-vanChuyen">
						<div class="card-body row">
							<p class="title-diaChi">Thông Tin Nhận Hàng</p>
							<div class="col-md-4">

								<p class="nguoiNhan">Họ và tên: ${fullname}</p>
								<p class="soDienThoai">Số điện thoại: ${phone}</p>
								<p class="diaChi">Địa chỉ: ${address} - ${plusAddress}</p>
							</div>
							<div class="col-md-8"
								style="border-left: solid 1px rgb(171, 171, 171);">
								<table class="table table-vanChuyen">
									<c:choose>
										<c:when test="${orderStatus == 'Hoàn Thành'}">
											<thead>
												<tr>
													<td scope="col"><img width="24" height="24"
														src="/assets/img/icon/tick.png" alt="bill" /></td>
													<td scope="col"><span class="trangThai-vanChuyen">Đã
															giao</span> Đơn hàng đã được giao thành công
												</tr> 
											</thead>
										</c:when>
									</c:choose>
									<tbody>
										<c:choose>
											<c:when
												test="${orderStatus == 'Đang vận chuyển' ||  orderStatus == 'Đã giao cho đơn vị vận chuyển'}">
												<thead>
													<tr>
														<td><img width="24" height="24"
															src="/assets/img/icon/tick.png" alt="bill" /></td>
														<td><span class="trangThai-vanChuyen">Đang
																giao hàng</span> Đơn hàng đang trên đường giao đến bạn</td>
													</tr>
												</thead>
											</c:when>
										</c:choose>

										<c:if test="${orderStatus == 'Đang chờ đơn vị vận chuyển'}">
											<thead>
												<tr>
													<td><img width="24" height="24"
														src="/assets/img/icon/tick.png" alt="bill" /></td>
													<td><span class="trangThai-vanChuyen">Đang được
															chuẩn bị</span> Người bán đang chuẩn bị hàng</td>
												</tr>
											</thead>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<%-- 				<c:set var="totalSum" value="0" /> --%>
				<div class="card cardProduct">
					<p class="tenNguoiBan">
						<img width="24px" height="24px" src="/assets/img/icon/user.png"
							alt=""> <span>${shopName}</span>
					</p>
					<c:forEach var="product" items="${products}" varStatus="loop">
						<div class="card-header cardProduct-header"></div>
						<div class="card-body cardProduct-body">
							<div class="list-book">
								<div class="book">
									<img src="${product.image}" alt="">
									<div class="book-content">
										<a href="">${product.name}</a>
										<div class="content">${product.introduce}</div>
										<div class="row info">
											<div class="col-6 info-book">
												<a class="rating-container" href="/Ebook/user/evaluate"
													style="color: yellow; font-size: 10px;"> <%-- 													 <c:forEach begin="1" end="${product.starRating}"> --%>
													<%-- 														<span class="star" data-value="${loop.index + 1}"> --%>
													<!-- 															<i class="fa-solid fa-star"></i> --> <!-- 														</span> -->
													<%-- 													</c:forEach> --%>
												</a>
												<p class="gia">
													<fmt:formatNumber
														value="${quantities[loop.index] * product.price}"
														pattern="#,##0" />
													đ
													<%-- 												<c:set var="productCost" value="${quantities[loop.index - 1] * product.price}" /> --%>
													<%-- 												<c:set var="totalSum" value="${totalSum + productCost}" /> --%>
												</p>
												<p class="soLuong">x${quantities[loop.index]}</p>
												<!-- Access quantities using loop.index -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="container-Gia">
					<div class="card cardGia">
						<div class="card-body row">
							<div class="col-md-8 text1">Tổng tiền hàng</div>
							<div class="col-md-4 text2">
								<fmt:formatNumber value=" ${bill.totalPrice}" pattern="#,##0" />
								đ
							</div>
						</div>
					</div>
					<div class="card cardGia">
						<div class="card-body row">
							<div class="col-md-8 text1">Phí vận chuyển</div>
							<div class="col-md-4 text2">
								<fmt:formatNumber value="${bill.priceShipping}" pattern="#,##0" />
								đ
							</div>
						</div>
					</div>
					<div class="card cardGia">
						<div class="card-body row">
							<div class="col-md-8 text1">Voucher sản phẩm</div>
							<div class="col-md-4 text2">
								-
								<fmt:formatNumber value="${bill.discount}" pattern="#,##0" />
								đ
							</div>
						</div>
					</div>
					<div class="card cardGia">
						<div class="card-body row">
							<div class="col-md-8 text1">Thành tiền</div>
							<div class="col-md-4 text2 thanhTien">
								<fmt:formatNumber
									value="${bill.totalPrice - bill.discount + bill.priceShipping}"
									pattern="#,##0" />
								đ
							</div>
						</div>
					</div>
					<div class="card cardGia">
						<div class="card-body row">
							<div class="col-md-8 text1">Phương thức thanh toán</div>
							<div class="col-md-4 text2">${paymentMethod}</div>
						</div>
					</div>
				</div>
			</aside>

			<div class="button-cont">

				<div class="button-edit">
					<button type="button" class="btn btn-success">Liên Hệ
						Người Bán</button>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript">
		
	<%@include file="/assets/js/donHang.js"%>
		function toggleSubmenu() {
			var menuItem = document.querySelector('.menu-item');
			if (menuItem) {
				menuItem.classList.toggle('open');
			}
		}
	</script>
</body>
</html>
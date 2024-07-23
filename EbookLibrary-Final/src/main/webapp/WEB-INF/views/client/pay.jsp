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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<link rel="stylesheet" href="/assets/css/pay.css">
	<div class="container">
		<!-- hearder -->
		<div class="row">
			<div class="col-md-12">
				<h5 style="color: green; padding-top: 40px; padding-bottom: 40px;">
					<i class="fa-solid fa-cart-shopping" style="color: #19d10c;"></i> <Strong
						style="font-size: larger; font-family: auto;">Virtual
						Library Website</Strong> | Thanh Toán
				</h5>
			</div>
		</div>
		<!-- body -->
		<main>
			<img src="/assets/img/Pay/gach.png" style="width: 1300px;">
			<h5 style="color: green;">
				<i class="fa-solid fa-location-dot"
					style="color: green; margin-right: 10px;"></i>Địa Chỉ Nhận Hàng
			</h5>
			<div class="row">
				<div class="col-md-9">
					<c:set var="addre" value="0"></c:set>
					<strong>${account.fullname},${account.phone}</strong>
					<c:forEach var="address" items="${addresses}">
						<c:if test="${address.status}">
					${address.fullNameAddress}
					<c:set var="addre" value="${address.id}"></c:set>
						</c:if>
					</c:forEach>
					<input type="text" value="${addre}" name="address" hidden>
				</div>
				<div class="col-md-3">
					<a type="text" data-bs-toggle="modal"
						data-bs-target="#exampleModal"
						style="color: rgb(67, 73, 228); cursor: pointer;";> Thay đổi </a>
				</div>
		</main>
		<!-- modal1 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel6" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel6">Địa chỉ của
							tôi</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- RADIO -->
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1"> <label
								class="form-check-label" for="flexRadioDefault1"
								style="display: flex; flex-direction: column;">
								<div class="d-flex align-items-center" style="display: flex;">
									<h6 class="me-3" style="margin-right: 1rem;">
										Hồ Thị Trúc Ly | <strong style="color: #7e847e;">(+84)
											876543219</strong>
									</h6>
									<!-- CẬP NHẬT -->
									<!-- Button trigger modal -->
									<button class="btn" type="text" data-bs-toggle="modal"
										data-bs-target="#exampleModal2"
										style="color: rgb(67, 73, 228); cursor: pointer; margin-left: 90px;">
										Thay đổi</button>

								</div>
								<p style="color: #7e847e;">Lý Tự Trọng</p>
								<p style="color: #7e847e;">Phường An Cư, Quận Ninh Kiều, Cần
									Thơ</p>
							</label>
						</div>
						<hr>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1"> <label
								class="form-check-label" for="flexRadioDefault1"
								style="display: flex; flex-direction: column;">
								<div class="d-flex align-items-center" style="display: flex;">
									<h6 class="me-3" style="margin-right: 1rem;">
										Hồ Thị Trúc Ly |<strong style="color: #7e847e;">
											(+84) 876543219</strong>
									</h6>
									<!-- CẬP NHẬT -->
									<!-- Button trigger modal -->
									<button class="btn" type="text" data-bs-toggle="modal"
										data-bs-target="#exampleModal3"
										style="color: rgb(67, 73, 228); cursor: pointer; margin-left: 90px;">
										Thay đổi</button>
									<!-- Modal -->

									<!-- CẬP NHẬT -->
								</div>
								<p style="color: #7e847e;">Trường Cao Đẳng Fpt Polytechnic
									Cần Thơ, Đường Số 22, Kdc Hoàng Quân</p>
								<p style="color: #7e847e;">Phường Lê Bình , Quận Cái Răng,
									Cần Thơ</p>
							</label>
						</div>
						<button
							style="width: 200px; margin-bottom: 20px; margin-left: 10px;"
							type="button" class="btn btn-outline-success"
							data-bs-toggle="modal" data-bs-target="#exampleModal6">
							Thêm địa chỉ mới</button>
						<!-- RADIO -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="button" class="btn btn-outline-success">Cập
							nhật</button>

					</div>

				</div>
			</div>

		</div>



		<form action="/user/pay" method="get">

			<%-- <c:forEach var="cart" items="${listCarts}">
				<input type="number" name="idCartDetails" value="${cart.id}" hidden>
			</c:forEach> --%>

			<!-- SẢN PHẨM -->
			<table class="table table-hover"
				style="margin-top: 10px; border-collapse: collapse; border-bottom: white;">
				<tr>
					<td>
						<h5>Sản phẩm</h5>
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td style="color: #7e847e;">Đơn giá</td>
					<td style="color: #7e847e;">Số lượng</td>
					<td></td>
					<td style="color: #7e847e;">Thành tiền</td>
				</tr>
				<c:forEach var="item" items="${listSeller}">
					<tr>
						<td colspan="5"><img src="/assets/img/${item.avatar}"
							style="width: 40px;">${item.shopName}</td>


						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<c:if test="${listCarts.size()>0}">
						<c:forEach var="it" items="${listProduct}">
							<c:if test="${item.id == it.account.id}">
								<input type="number" value="${it.id}" name="idProduct" hidden>
								<tr style="border-bottom: 1px solid gray;">
									<td><img src="${it.image}"
										style="height: 70px; width: auto;"></td>
									<td><span style="font-weight: bold; font-size: 18px">[${it.name}]</span>
										Mô tả : ${it.introduce}</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: #7e847e;">Loại: ${it.category.name}</td>
									<td><fmt:formatNumber>${it.price-it.discount}</fmt:formatNumber><sup>đ</sup></td>
									<c:set var="quantityProduct" value="0"></c:set>
									<c:if test="${listCarts.size()>0}">
										<c:forEach var="cart" items="${listCarts}">
											<input type="number" name="idCartDetails" value="${cart.id}"
												hidden>
											<input type="number" value="${cart.quantity}"
												name="quantityProduct" hidden>
											<c:if test="${cart.product.id==it.id}">
												<td class="text-center">${cart.quantity}</td>
												<td></td>
												<c:if test="${voucherSeller.size() ==0}">
													<td><fmt:formatNumber>${cart.quantity*(it.price-it.discount)}</fmt:formatNumber><sup>đ</sup>
													</td>
												</c:if>
												<c:if test="${voucherSeller.size() >0}">
													<c:forEach var="voucher" items="${voucherSeller}">
														<c:if test="${voucher.account == cart.product.account}">
															<td><fmt:formatNumber>${(cart.quantity*(it.price-it.discount))-voucher.sale}</fmt:formatNumber><sup>đ</sup>
															</td>
														</c:if>
														<c:if test="${voucher.account != cart.product.account}">
															<td><fmt:formatNumber>${cart.quantity*(it.price-it.discount)}</fmt:formatNumber><sup>đ</sup>
															</td>

														</c:if>

													</c:forEach>

												</c:if>
												<input type="number" name="quantity"
													value="${cart.quantity}" hidden>
												<c:set var="quantityProduct"
													value="${quantityProduct+cart.quantity}"></c:set>
											</c:if>
										</c:forEach>


									</c:if>
									<input type="number" value="${quantityProduct}"
										name="quantityProduct" hidden>
								</tr>
							</c:if>

						</c:forEach>

					</c:if>
					<c:if test="${listCarts.size()==0}">
						<c:forEach var="it" items="${listProduct}">
							<c:if test="${item.id == it.account.id}">
								<input type="number" value="${it.id}" name="idProduct" hidden>
								<tr style="border-bottom: 1px solid gray;">
									<td><img src="/assets/img/${it.image}"
										style="height: 70px; width: auto;"></td>
									<td><span style="font-weight: bold; font-size: 18px">[${it.name}]</span>
										Mô tả : ${it.introduce}</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: #7e847e;">Loại: ${it.category.name}</td>
									<td><fmt:formatNumber>${it.price-it.discount}</fmt:formatNumber><sup>đ</sup></td>
									<c:set var="quantityProduct" value="0"></c:set>


									<input type="number" name="idCartDetails" value="" hidden>
									<input type="number" value="${quantity}" name="quantityProduct"
										hidden>

									<td class="text-center">${quantity}</td>
									<td></td>
									<c:if test="${voucherSeller.size() ==0}">
										<td><fmt:formatNumber>${quantity*(it.price-it.discount)}</fmt:formatNumber><sup>đ</sup>
										</td>
									</c:if>
									<c:if test="${voucherSeller.size() >0}">
										<c:forEach var="voucher" items="${voucherSeller}">
											<c:if test="${voucher.account == cart.product.account}">
												<td><fmt:formatNumber>${(quantity*(it.price-it.discount))-voucher.sale}</fmt:formatNumber><sup>đ</sup>
												</td>
											</c:if>
											<c:if test="${voucher.account != cart.product.account}">
												<td><fmt:formatNumber>${quantity*(it.price-it.discount)}</fmt:formatNumber><sup>đ</sup>
												</td>

											</c:if>

										</c:forEach>

									</c:if>
									<input type="number" name="quantity" value="${quantity}" hidden>
									<c:set var="quantityProduct"
										value="${quantityProduct+quantity}"></c:set>

									<input type="number" value="${quantityProduct}"
										name="quantityProduct" hidden>
								</tr>
							</c:if>

						</c:forEach>
					</c:if>


				</c:forEach>
			</table>


















			<input type="number" name="voucherSeller" value="" hidden>
			<c:forEach var="idVoucher" items="${voucherSeller}">
				<input type="number" name="voucherSeller" value="${idVoucher.id}"
					hidden>
			</c:forEach>


			<!-- ĐƠN VỊ VẬN CHUYỂN -->
			<table class="table table-hover"
				style="border-collapse: collapse; border-bottom: white;">
				<tr style="border-top: white;">
					<td>Đơn vị vận chuyển: Nhanh</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<!-- Button trigger modal --> <a type="text"
						data-bs-toggle="modal" data-bs-target="#exampleModa2"
						style="color: rgb(67, 73, 228); cursor: pointer;";> Voucher </a> <!-- Modal -->
						<div class="modal fade" id="exampleModa2" tabindex="-1"
							aria-labelledby="exampleModalLabe2" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabe2">Voucher</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<input type="number" value="" name="idVoucher" id="idVoucher"
										hidden>
									<div class="modal-body"
										style="overflow-y: auto; height: 360px; padding-top: 0px; padding-bottom: 0px">
										${listCart.size()}
										<c:forEach var="voucher" items="${listVouchers}"
											varStatus="index">
											<c:if
												test="${voucher.status ==true && voucher.quantity<= voucher.originalNumber}">

												<div class="voucher-card">
													<div class="voucher-content">
														<input type="radio" name="saleVoucher" class="voucherSale"
															value="${voucher.id}" hidden>
														<div class="voucher-header">
															Giảm <span>${voucher.sale}</span><sup>đ</sup>
														</div>
														<div class="voucher-subheader">
															Đơn Tối Thiểu
															<fmt:formatNumber>${voucher.sale}</fmt:formatNumber>
														</div>
														<div class="voucher-tag">${voucher.note}</div>
														<div class="voucher-footer">
															HSD:
															<fmt:formatDate value="${voucher.dateEnd}" />
														</div>
													</div>
													<button type="button" class="voucher-button"
														data-bs-dismiss="modal"
														onclick="openVoucher(${index.index})">Dùng</button>

												</div>

											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td style="padding-right: 150px;"><fmt:formatNumber>${service_fee}</fmt:formatNumber><sup>đ</sup></td>
				</tr>
				<tbody>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td style="color: #7e847e;">Giao hàng nhanh trống, tiết kiểm
						hơn thả sức mua sắm không lo về phí vận chuyển.</td>
					<td></td>
					<td></td>
					<td></td>
				</tbody>
				<tbody>
					<td>Được đồng kiểm</td>
				</tbody>
				<tfoot>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td style="color: #7e847e;">Tổng số tiền(${listCarts.size()}
						sản phẩm):</td>
					<td></td>
					<td></td>
					<td></td>
					<c:set var="total" value="0" />
					<c:if test="${listCarts.size()>0}">
						<c:forEach var="it" items="${listCarts}">
							<c:if test="${voucherSeller.size() ==0}">
								<c:set var="total"
									value="${total+(it.quantity*(it.product.price-it.product.discount))}" />
							</c:if>

							<c:if test="${voucherSeller.size()>0}">
								<c:forEach var="voucher" items="${voucherSeller}">
									<c:if test="${voucher.account == it.product.account}">
										<c:set var="total"
											value="${total+(it.quantity*(it.product.price-it.product.discount))-voucher.sale}" />
									</c:if>

								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>


					<c:if test="${listCarts.size()==0}">
						<c:forEach var="it" items="${listProduct}">

							<c:set var="total"
								value="${total+(quantity*(it.price-it.discount))}" />
						</c:forEach>
					</c:if>



					<fmt:formatNumber var="formattedTotal" value="${total+service_fee}"
						type="number" />

					<%-- 		<input type="text" value="${formattedTotal}" name="totalPrice"
						hidden id="totalPriceProduct"> --%>
					<td><fmt:formatNumber>${total}</fmt:formatNumber><sup>đ</sup></td>
				</tfoot>
			</table>
			<img src="/assets/img/Pay/gachDut.png"
				style="height: 5px; width: 1300px;">
			<!-- THANH TOÁN -->

			<table class="table table-hover"
				style="border-collapse: collapse; border-bottom: white;">
				<tr style="border-top: white;">
					<td>
						<h5>Phương thức thanh toán</h5>
					</td>
					<td></td>
					<td></td>

					<td>
						<!-- Button trigger modal --> <a type="text"
						data-bs-toggle="modal" data-bs-target="#exampleModa3"
						style="color: rgb(67, 73, 228); cursor: pointer; margin-right: 10px;">
							Thay đổi </a> <!-- Modal -->
						<div class="modal fade" id="exampleModa3" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thanh Toán</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Đóng"></button>
									</div>
									<div class="modal-body">
										<table class="table">
											<tbody class="border">
												<tr>
													<td><input class="form-check-input" type="radio"
														name="payMethod" id="pay" value="0" onclick="pay(0)"
														checked> <label class="form-check-label"
														for="flexRadioDefault1"> Thanh toán khi nhận hàng</label></td>
													<td></td>
												</tr>

												<tr>
													<td><input class="form-check-input" type="radio"
														name="payMethod" id="pay" value="1" onclick="pay(1)"><label
														class="form-check-label" for="flexRadioDefault">
															Thanh toán bằng VNPAY</label></td>
													<td><img
														src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Icon-VNPAY-QR.png"
														style="height: 30px;"></td>
												</tr>
											</tbody>

										</table>
									</div>
									<!-- 			<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Cập
											nhật</button>
									</div> -->
								</div>
							</div>
						</div>
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<table class="table table-hover"
					style="border-collapse: collapse; border-bottom: white;">
					<thead>
						<tr style="border-top: white;">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td style="text-align: right; color: #7e847e;">Tổng tiền
								hàng</td>
							<td></td>
							<td></td>
							<td style="text-align: center;" id="total"><fmt:formatNumber>${total}</fmt:formatNumber><sup>đ</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr style="border-top: white;">
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td style="text-align: right; color: #7e847e;">Phí vận
								chuyển</td>
							<td
								style="text-align: right; color: #7e847e; text-decoration: line-through;"
								id="saleVoucher"></td>
							<td></td>
							<fmt:formatNumber var="formaterService_fee"
								value="${service_fee}" />
							<input type="number" value="${formaterService_fee}"
								name="service_fee" hidden="true">
							<td style="text-align: center;" id="service_fee"><fmt:formatNumber>${service_fee}</fmt:formatNumber><sup>đ</sup></td>
						</tr>
					</tbody>
					</tr>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td style="text-align: right; color: #7e847e;">Tổng thanh
								toán</td>
							<td></td>
							<td></td>

							<input type="number" name="total" value="${total}" hidden>
							<c:set var="total" value="${total+service_fee}"></c:set>
							<td style="color: green; text-align: center;">
								<h4 id="sumPay">


									<fmt:formatNumber>${total}</fmt:formatNumber>
									<sup>đ</sup>

								</h4>
							</td>
							<td></td>
						</tr>
					</tfoot>
				</table>
				<button
					style="background-color: green; color: white; height: 40px; width: 250px; margin-left: 910px; margin-bottom: 60px;">Đặt
					hàng</button>
			</table>
		</form>
	</div>

	<!-- Modal cập nhật -->
	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel2">Cập nhật địa
						chỉ</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder=""> <label for="floatingInput"> Số
								điện thoại </label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput"
								placeholder=""> <label for="floatingInput">Địa
								chỉ (tùy chọn)</label>
						</div>
						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Tỉnh
										thành </strong></option>
								<option value="1">An Giang</option>
							</select>
						</div>
						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Quận
										huyện (tùy chọn) </strong></option>
								<option value="1">Ninh Kiều</option>
								<option value="2">Cái Răng</option> /
								<select>
						</div>

						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Phường
										xã (tùy chọn) </strong></option>
								<option value="1">An Bình</option>
								<option value="2">An Cư</option> /
								<select>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="button" class="btn btn-outline-success">Cập
							nhật</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal cập nhật -->
	<div class="modal fade" id="exampleModal3" tabindex="-1"
		aria-labelledby="exampleModalLabel3" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel3">Cập nhật địa
						chỉ</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder=""> <label for="floatingInput"> Số
								điện thoại </label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput"
								placeholder=""> <label for="floatingInput">Địa
								chỉ (tùy chọn)</label>
						</div>
						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Tỉnh
										thành </strong></option>
								<option value="1">An Giang</option>
							</select>
						</div>
						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Quận
										huyện (tùy chọn) </strong></option>
								<option value="1">Ninh Kiều</option>
								<option value="2">Cái Răng</option>
								<select>
						</div>

						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Phường
										xã (tùy chọn) </strong></option>
								<option value="1">An Bình</option>
								<option value="2">An Cư</option> /
								<select>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="button" class="btn btn-outline-success">Cập
							nhật</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal thêm địa chỉ mới -->
	<div class="modal fade" id="exampleModal6" tabindex="-1"
		aria-labelledby="exampleModalLabel6" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel6">Thêm địa chỉ
						mới</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">Email (tùy chọn)</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder=""> <label for="floatingInput">Họ và
								tên</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder=""> <label for="floatingInput"> Số
								điện thoại </label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput"
								placeholder=""> <label for="floatingInput">Địa
								chỉ (tùy chọn)</label>
						</div>

						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Tỉnh
										thành </strong></option>
								<option value="1">An Giang</option>
							</select>
						</div>

						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Quận
										huyện (tùy chọn) </strong></option>
								<option value="1">Ninh Kiều</option>
								<option value="2">Cái Răng</option> /
								<select>
						</div>

						<div style="padding-top: 20px;">
							<select class="form-select" aria-label="Default select example">
								<option selected style="font: 300;"><strong>Phường
										xã (tùy chọn) </strong></option>
								<option value="1">An Bình</option>
								<option value="2">An Cư</option>
								<select>
						</div>

						<div class="form-floating mb-3" style="padding-top: 20px;">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px"></textarea>
							<label for="floatingTextarea2">Ghi chú (nếu có)</label>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-outline-success">Hoàn
						Thành</button>
				</div>
			</div>
		</div>
	</div>
	<script>
    function openVoucher(index) {
	var sale = document.querySelectorAll('.voucherSale')[index].value;
	document.getElementById('idVoucher').value = parseFloat(sale.replace(/\./g, ''));
	var total = document.getElementById('total').innerText;
	var service_fee = document.getElementById('service_fee').innerText;
	var sumPay = parseFloat(document.getElementById('sumPay').innerText);
	var totalFloat = parseFloat(total.replace(/\./g, '').replace('đ',''));
	var service_feeFloat = parseFloat(service_fee.replace(/\./g, '').replace('đ',''));
	var saleFloat =parseFloat(sale.replace(/\./g, '').replace('đ',''));
	var sumPayResult = (totalFloat+service_feeFloat)-saleFloat;
	document.getElementById('sumPay').innerText = sumPayResult.toLocaleString('vi-VN');
//	document.getElementById('totalPrice').innerHTML = sumPayResult;
	var supElement = document.createElement('sup');
	supElement.innerText = 'đ';
	document.getElementById('sumPay').appendChild(supElement);
/* 	document.getElementById('saleVoucher').innerHTML = saleFloat.toLocaleString('vi-VN');
	document.getElementById('saleVoucher').appendChild(supElement); */
    }
    function pay(index) {
		document.getElementById('pay')[index].checked = 'true';
	}
	</script>
</body>
</html>
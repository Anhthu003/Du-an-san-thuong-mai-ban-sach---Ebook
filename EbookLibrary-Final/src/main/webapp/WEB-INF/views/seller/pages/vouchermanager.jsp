<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý voucher</title>
</head>

<body class="hold-transition sidebar-mini">
	<%@include file="/common/taglib-link.jsp"%>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>DataTables</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">DataTables</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">

						<form id="quickForm" method="post">
							<div class="row">
								<div class="col-md-12">
									<div class="card-body" style="padding: 0px;">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Tên voucher</label> <input
														type="text" name="name" value="${voucher.name}"
														class="form-control" id="exampleInputEmail1" required
														placeholder="Tên voucher">
													<p class="text-danger">${errorName }</p>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Số lượng</label> <input
														type="number" class="form-control" id="exampleInputEmail1"
														placeholder="Số lượng" name="quantity" min="1" required
														value="${voucher.originalNumber}">
													<p class="text-danger">${errorSL }</p>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Ngày bắt đầu</label> <input
														type="date" name=dateStart class="form-control" required
														value="${dateStart}" name="dateStart"
														id="exampleInputEmail1" placeholder="Ngày bắt đầu">
													<p class="text-danger">${errorDateStart }</p>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Ngày kết thúc</label> <input
														type="date" name="dateEnd" value="${dateEnd}"
														class="form-control" id="exampleInputEmail1" required
														placeholder="Ngày kết thúc">
													<p class="text-danger">${errorDateEnd }</p>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputPassword1">Loại voucher</label> <select
														name="voucher" id="" class="form-control">
														<c:forEach var="voucherItem" items="${typeVouchers }">
															<c:if test="${voucherItem.id == 1}">
																<option
																	${voucherItem.id == voucher.typeVoucher.id ? 'selected' : ''}
																	value="${voucherItem.id}">${voucherItem.name }</option>
															</c:if>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputPassword1">Loại giảm giá</label> <select
														name="loaiGG" id="" class="form-control">
														<option value="false" ${voucher.sale >1000?'selected':''}>Giảm
															giá theo VND</option>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Điều Kiện</label>
													<div class="dieuKien" style="display: flex;">
														<input type="number" name="PriceDK" class="form-control"
															id="exampleInputEmail1" placeholder="Giá tối thiểu"
															style="margin-right: 15px;" required
															value="${voucher.priceMin}">
														<p class="text-danger">${errorDKPrice}</p>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputPassword1">Giảm giá</label> <input
														type="number" name="priceSale" value="${voucher.sale }"
														required class="form-control" placeholder="VND">
													<p class="text-danger">${errorPriceSale }</p>
												</div>
											</div>

										</div>

									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="exampleInputPassword1">Ghi chú</label>
										<textarea name="note" class="form-control"
											placeholder="Ghi chú">${voucher.note }</textarea>
									</div>
								</div>
								<!-- /.card-body -->
								<div class="col-md-12">
									<div class="card-footer"
										style="background-color: rgba(240, 248, 255, 0); padding-left: 0px; padding-top: 0px;">
										<a href="/seller/vouchermanager" class="btn btn-secondary">
											<i class="fa-solid fa-circle-xmark"
											style="color: #ffffff; margin-right: 5px;"></i>Làm mới
										</a>
										<button type="submit" class="btn btn-success">
											<i class="fa-solid fa-plus"
												style="color: #ffffff; margin-right: 5px;"></i>Xác nhận
										</button>
										<c:if test="${currentPath == 'update'}">
											<c:choose>
												<c:when test="${voucher.status}">
													<a href="../delete/${voucher.id }" class="btn btn-danger"
														style="color: white;"> <i class="bi bi-trash-fill"
														style="color: #ffffff; margin-right: 5px;"></i> Ngừng hoạt
														động
													</a>
												</c:when>
											</c:choose>
										</c:if>
									</div>
								</div>

							</div>
						</form>


					</div>
					<div class="col-12">


						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Danh sách voucher</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên voucher</th>
											<th>Điều kiện</th>
											<th>Số lượng</th>
											<th>Giảm giá</th>
											<th>Ngày bắt đầu</th>
											<th>Ngày kết thúc</th>
											<th>Số lượng đã dùng</th>
											<th>Loại voucher</th>
											<th>Ghi chú</th>
											<th>Trạng thái</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="voucher" items="${vouchers }">
											<tr>
												<td>${voucher.id }</td>
												<td>${voucher.name }</td>
												<td><fmt:formatNumber type="currency"
														value="${voucher.priceMin}"></fmt:formatNumber></td>
												<td>${voucher.originalNumber }</td>
												<td><c:choose>
														<c:when test="${voucher.sale >1000}">
															<fmt:formatNumber type="currency"
																value="${voucher.sale }"></fmt:formatNumber>
														</c:when>
														<c:otherwise>
												${voucher.sale }%
												</c:otherwise>
													</c:choose></td>
												<td>${voucher.dateStart }</td>
												<td>${voucher.dateEnd }</td>
												<td>${voucher.quantity }</td>

												<td>${voucher.typeVoucher.name }</td>
												<td>${voucher.note }</td>
												<td>${voucher.status ?'Đang hoạt động':'Hết hạn'}</td>

												<td>
													<form action="/seller/vouchermanager/details" method="get">
														<input type="hidden" name="voucherId"
															value="${voucher.id}" />
														<button type="submit" class="btn btn-success"
															style="color: white;">
															<i class="bi bi-list-ul"></i>
														</button>
													</form>
												</td>
												<td><a
													href="/seller/vouchermanager/update/${voucher.id }"
													class="btn btn-success"> <i style="color: #ffffff;"
														class="bi bi-pencil-fill"></i>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
									<!-- <tfoot>
                      <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                      </tr>
                    </tfoot> -->
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->


	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
	<!-- ChartJS -->
	<%@include file="/common/taglib-js.jsp"%>
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});

		$(function() {
			$.validator.setDefaults({
				submitHandler : function() {
					alert("Form successful submitted!");
				}
			});
			$('#quickForm')
					.validate(
							{
								rules : {
									email : {
										required : true,
										email : true,
									},
									password : {
										required : true,
										minlength : 5
									},
									terms : {
										required : true
									},
								},
								messages : {
									email : {
										required : "Please enter a email address",
										email : "Please enter a vaild email address"
									},
									password : {
										required : "Please provide a password",
										minlength : "Your password must be at least 5 characters long"
									},
									terms : "Please accept our terms"
								},
								errorElement : 'span',
								errorPlacement : function(error, element) {
									error.addClass('invalid-feedback');
									element.closest('.form-group')
											.append(error);
								},
								highlight : function(element, errorClass,
										validClass) {
									$(element).addClass('is-invalid');
								},
								unhighlight : function(element, errorClass,
										validClass) {
									$(element).removeClass('is-invalid');
								}
							});
		});
	</script>

</body>
</html>
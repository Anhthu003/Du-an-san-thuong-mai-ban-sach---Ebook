<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm</title>

</head>

<body class="hold-transition sidebar-mini" ng-app="myApp">
	<%@include file="/common/taglib-link.jsp"%>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Chi Tiết Voucher</h1>
							<a href="/seller/vouchermanager" class="btn btn-success"
							style="margin-top: 30px; width: 100px;">Quay lại</a>
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
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Chi tiết voucher</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên voucher</th>
											<th>Điều kiện</th>
											<th>Giảm giá</th>
											<th>Ngày bắt đầu</th>
											<th>Ngày kết thúc</th>
											<th>Loại voucher</th>
											<th>Người dùng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="voucherdetails" items="${voucherDetails }">
											<tr>
												<td>${voucher.id }</td>
												<td>${voucher.name }</td>
												<td><c:if test="${voucher.typeVoucher.id ==1 }">
                                                                            Sản phẩm lớn hơn ${voucher.priceMin}
                                                                            </c:if>
													<c:if test="${voucher.typeVoucher.id ==2}">
                                                                                Tổng hóa đơn lớn hơn ${voucher.priceMin}
                                                                            </c:if>
												</td>
												<td><c:if test="${voucher.sale >1000}">
														<fmt:formatNumber type="currency" value="${voucher.sale }"></fmt:formatNumber>
													</c:if> <c:if test="${voucher.sale <100}">
												${voucher.sale }%
												</c:if></td>
												<td>${voucher.dateStart }</td>
												<td>${voucher.dateEnd }</td>
												<td>${voucher.typeVoucher.name }</td>
												<td>${voucherdetails.account.username }</td>
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
	</script>
</body>
</html>
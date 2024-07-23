<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Statistical</title>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
	<%@include file="/common/taglib-link.jsp"%>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<!-- Main row -->
				<div class="row">
					<section class="col-lg-12 connectedSortable">
						<!-- BAR CHART -->
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">Thông kê đơn hàng</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
									<button type="button" class="btn btn-tool"
										data-card-widget="remove">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
							<div class="card-body">
								<div class="chart">
									<canvas id="barChart"
										style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</section>


					<!-- full col -->

					<!-- right col (We are only adding the ID to make the widgets sortable)-->
					<section class="col-lg-12 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Thông kê doanh thu seller</h3>
								<div class="row d-flex justify-content-center" style="margin-top: 50px;">
									<div class="col-md-5">
									<form action="/seller/orderstatistical" method="get">
										<div class="form-group">
											<label for="exampleInputEmail1">Ngày bắt đầu</label> <input
												type="date" name=dateStart class="form-control" required
												value="${dateStart}" name="dateStart"
												id="exampleInputEmail1" placeholder="Ngày bắt đầu">
											<p class="text-danger">${errorDateStart }</p>
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group">
											<label for="exampleInputEmail1">Ngày kết thúc</label> <input
												type="date" name="dateEnd" value="${dateEnd}"
												class="form-control" id="exampleInputEmail1" required
												placeholder="Ngày kết thúc">
											<p class="text-danger">${errorDateEnd }</p>
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<button class="btn btn-success" style="margin-top: 30px; width: 100%;">Lọc</button>
										</div>
									</div>
									</form>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Mã hóa đơn</th>
											<th>Ngày tạo</th>
											<th>Ngày hoàn thành</th>
											<th>Người mua</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
											<th>Voucher</th>
											<th>Tiền ship</th>
											<th>Địa chỉ</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="bills" items="${listbills }">
											<tr>
												<th>${bills.id }</th>
												<td>${bills.dateBuy }</td>
												<td>${bills.finishDay }</td>
												<td>${bills.account.username }</td>
												<td>${bills.quantity }</td>
												<td><fmt:formatNumber type="currency"
														value="${bills.totalPrice }"></fmt:formatNumber></td>
												<td><c:forEach var="voucher" items="${vouchers}">
														<c:if
															test="${voucher.id == bills.voucherDetail.voucher.id}">
                   									 		${voucher.name}
														</c:if>
													</c:forEach></td>
												<td><fmt:formatNumber type="currency"
														value="${bills.priceShipping - bills.discount}"></fmt:formatNumber></td>
												<td>${bills.addRessTo }</td>
												<td><a
													href="/seller/orderstatistical/details/${bills.id }"
													class="btn btn-success"><i class="bi bi-list-ul"></i></a></td>
											</tr>
										</c:forEach>
										<tr>
											<th>Tổng:</th>
											<td></td>
											<td></td>
											<td></td>
											<td> ${SumQuantity }</td>
											<td><fmt:formatNumber type="currency" value="${SumTotalPrice }"></fmt:formatNumber></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
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

						<!-- /Card2 -->

						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Chi tiết hóa đơn</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example3" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Mã hóa đơn</th>
											<th>Sản phẩm</th>
											<th>Số lượng</th>
											<th>giá</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="billDetails" items="${listbillDetails }">
											<tr>
												<th>${bill.id }</th>
												<td>${billDetails.product.name }</td>
												<td>${billDetails.quantity}</td>
												<td><fmt:formatNumber type="currency" value="${billDetails.price}"></fmt:formatNumber></td>
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
						<!-- /.card2 -->
					</section>
					<!-- right col -->
				</div>
				<!-- /.row (main row) -->
			</div>
			<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>






	</div>

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
		$(function() {
			$("#example3").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example3_wrapper .col-md-6:eq(0)');
			$('#example4').DataTable({
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
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Đoạn mã JavaScript sẽ được thực thi sau khi trang và tất cả các nguồn tài nguyên đã được tải xong
var SellerSuccessDT = ${SellerSuccessJsonDT}; 
    var billValuesSucces = SellerSuccessDT.map(function(str) {
        var value = str.split('=')[1];
        var endBracketIndex = value.indexOf('}');
        return value.substring(0, endBracketIndex);
    });
   console.log(billValuesSucces);
   
   
   var SellerSuccessLN = ${SellerSuccessJsonLN}; 
    var billValuesLN = SellerSuccessLN.map(function(str) {
        var value = str.split('=')[1];
        var endBracketIndex = value.indexOf('}');
        return value.substring(0, endBracketIndex);
    }); 
			var areaChartData = {
				labels : [ 'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
						'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
						'Tháng 10', 'Tháng 11', 'Tháng 12' ],
				datasets : [ {
					label : 'Lợi nhuận',
					backgroundColor : 'rgba(60,141,188,0.9)',
					borderColor : 'rgba(60,141,188,0.8)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data :billValuesSucces
				}, {
					label : 'Doanh thu',
					backgroundColor : 'rgba(210, 214, 222, 1)',
					borderColor : 'rgba(210, 214, 222, 1)',
					pointRadius : false,
					pointColor : 'rgba(210, 214, 222, 1)',
					pointStrokeColor : '#c1c7d1',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(220,220,220,1)',
					data : billValuesLN
				}, ]
			};

			var barChartCanvas = document.getElementById('barChart');
			if (barChartCanvas) {
				var barChartContext = barChartCanvas.getContext('2d');
				if (barChartContext) {
					var barChartData = Object.assign({}, areaChartData); // Sử dụng Object.assign() thay vì $.extend() của jQuery
					var temp0 = areaChartData.datasets[1];
					var temp1 = areaChartData.datasets[0];
					barChartData.datasets[1] = temp1;
					barChartData.datasets[0] = temp0;

					var barChartOptions = {
						responsive : true,
						maintainAspectRatio : false,
						datasetFill : false
					};

					new Chart(barChartContext, {
						type : 'bar',
						data : barChartData,
						options : barChartOptions
					});
				} else {
					console.error('getContext() returned null');
				}
			} else {
				console.error('Cannot find canvas element with id "barChart"');
			}

		});
	</script>


</body>
</html>
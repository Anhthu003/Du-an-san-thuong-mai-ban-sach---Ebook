<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Manager</title>



<style type="text/css">

</style>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<%@include file = "/common/taglib-link.jsp" %>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<!-- Main row -->
				<div class="row">
<%-- 					<section class="col-lg-12 connectedSortable">
						<!-- BAR CHART -->
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">Thống kê đơn hàng</h3>

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
					</section> --%>
					<!-- full col -->
					<section class="col-lg-12 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Quản lý hóa đơn</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Mã </th>
											<th>Tên người đặt</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ người nhận</th>
											<th>Ngày mua</th>
											<th>Số lượng</th>
											<th>Giá</th>
											<th>Giảm giá</th>
											<th>Phí giao hàng</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>

											<th style="width: 200px;">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="bill" items="${listBillDetails}">
											<tr>
												<td class="align-middle">${bill.id}</td>
												<td class="align-middle">${bill.bill.account.fullname}</td>
												<td class="align-middle">${bill.bill.account.phone}</td>
												<td class="align-middle">${bill.bill.addRessTo}</td>
												<td class="align-middle">${bill.dateBuy}</td>
												<td class="align-middle">${bill.quantity}</td>
												<td class="align-middle"> <fmt:formatNumber
														value="${bill.price}" type="currency" pattern="#,##0"
														currencySymbol="" /><sup>đ</sup></td>
												<td class="align-middle"><fmt:formatNumber
														value="${bill.discount}" type="currency" pattern="#,##0"
														currencySymbol="" /><sup>đ</sup></td>
												<td class="align-middle">
												<fmt:formatNumber
														value="${bill.priceShipping}" type="currency" pattern="#,##0"
														currencySymbol="" /><sup>đ</sup></td>
												<c:set var="tongTien" value="${ (bill.price - bill.discount) * bill.quantity}"></c:set>
												<c:set var="chietKhau" value="${(bill.price * bill.quantity) * 0.01}"></c:set>
												<td class="align-middle"><fmt:formatNumber
														value="${tongTien + bill.priceShipping} " type="currency" pattern="#,##0"
														currencySymbol="" /><sup>đ</sup></td>
												<td class="align-middle">
												<c:if test="${bill.status == false}">Đang chờ duyệt</c:if>
										        <c:if test="${bill.status == true && bill.active == false}">Đã duyệt</c:if>
												 <c:if test="${bill.active == true && bill.active == true}">Đã hủy</c:if>
												</td>
												<td class="align-middle">
												<c:if test="${bill.status == false}">
														<a class="btn btn-success" data-bs-toggle="modal"
															data-bs-target="#xacNhan${bill.id}">Xác nhận</a>
														<a class="btn btn-danger" data-bs-toggle="modal"
															data-bs-target="#exampleModal${bill.id}">Hủy đơn</a>
															</c:if>
													</td>
											</tr>

											<!-- Modal XacNhan -->
											<div class="modal fade" id="xacNhan${bill.id}" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5" id="exampleModalLabel">Xác
																Nhận Đơn Hàng</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<p>Bạn muốn xác nhận đơn hàng với mã đơn hàng là:
																${bill.id} không?</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" id="xacNhan"
																>Thoát</button>
															<a type="submit" class="btn btn-primary"
																href="/seller/ordermanager/xacNhan?id=${bill.id}">Xác
																Nhận</a>
														</div>
													</div>
												</div>
											</div>

											<!-- Modal Huy -->
											 <div class="modal fade" id="exampleModal${bill.id}"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5" id="exampleModalLabel">Hủy
																Đơn Hàng</h1>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<form action="/seller/ordermanager/huy?id=${bill.id}"
																method="post">
																<div class="mb-3">
																	<label class="form-label">Mã đơn hàng:</label> <span>${bill.id}</span>
																	
																</div>
																<div class="mb-3">
																	<label class="form-label">Lý do hủy đơn <span
																		style="color: red;">*</span></label>
																	<textarea rows="" cols=""
																		name="contentCancel${bill.id}" class="form-control"
																		required="required"></textarea>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary" 
																		data-bs-dismiss="modal">Thoát</button>
																	<button type="submit" class="btn btn-danger">Xác
																		Nhận</button>
																</div>
															</form>
														</div>

													</div>
												</div>
											</div> 
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>


	</div>


	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->



	<%@include file="/common/taglib-js.jsp"%>
	<!-- AdminLTE for demo purposes -->
	<!-- <script src="/assets/dist/js/demo.js"></script> -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {

/*     var billSucces = ${listSucces}; 
    var billFalse = ${listFalse};
    var billValuesSucces = billSucces.map(function(str) {
        var value = str.split('=')[1];
        var endBracketIndex = value.indexOf('}');
        return value.substring(0, endBracketIndex);
    });
    console.log(billValuesSucces);
    var billValuesFalse = billFalse.map(function(str) {
        var value = str.split('=')[1];
        var endBracketIndex = value.indexOf('}');
        return value.substring(0, endBracketIndex);
    });
    
    console.log(billValuesFalse);

			var areaChartData = {
				labels : [ 'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
						'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
						'Tháng 10', 'Tháng 11', 'Tháng 12' ],
				datasets : [ {
					label : 'Thành công',
					backgroundColor : 'rgba(60,141,188,0.9)',
					borderColor : 'rgba(60,141,188,0.8)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data : billValuesSucces
				}, {
					label : 'Bị hủy',
					backgroundColor : 'rgba(210, 214, 222, 1)',
					borderColor : 'rgba(210, 214, 222, 1)',
					pointRadius : false,
					pointColor : 'rgba(210, 214, 222, 1)',
					pointStrokeColor : '#c1c7d1',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(220,220,220,1)',
					data : billValuesFalse
				}, ]
			}; */

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
		
/* 		document.getElementById("example1").addEventListener('click', (event) => {
	        let target = event.target;
	        while (target && target.nodeName !== 'TR') {
	            target = target.parentElement;
	        }
	        if (target) {
	            const cells = target.getElementsByTagName('td');
	            if (cells.length > 0) {
	                const id = cells[0].innerText;
	                window.location.href="/seller/ordermanger/billDetails?id="+id;
	            }
	        }
	    });
 */
	</script>

</body>
</html>
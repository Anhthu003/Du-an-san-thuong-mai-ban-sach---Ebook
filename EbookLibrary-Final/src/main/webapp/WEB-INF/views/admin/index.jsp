<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
		crossorigin="anonymous" />
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet"
		href="/assets/plugins/fontawesome-free/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet"
		href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Tempusdominus Bootstrap 4 -->
	<link rel="stylesheet"
		href="/assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
	<!-- iCheck -->
	<link rel="stylesheet"
		href="/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
	<!-- JQVMap -->
	<link rel="stylesheet" href="/assets/plugins/jqvmap/jqvmap.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/assets/dist/css/adminlte.min.css">
	<!-- overlayScrollbars -->
	<link rel="stylesheet"
		href="/assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
	<!-- Daterange picker -->
	<link rel="stylesheet"
		href="/assets/plugins/daterangepicker/daterangepicker.css">
	<!-- summernote -->
	<link rel="stylesheet"
		href="/assets/plugins/summernote/summernote-bs4.min.css">

	<!-- DataTables -->
	<link rel="stylesheet"
		href="/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet"
		href="/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet"
		href="/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">Dashboard</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Dashboard</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
							<div class="inner">
								<h3>${countSellerNotCheck }</h3>

								<p>Chờ duyệt</p>
							</div>
							<div class="icon">
								<i class="ion ion-bag"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-success">
							<div class="inner">
								<h3>
									${AvgSeller}<sup style="font-size: 20px">%</sup>
								</h3>

								<p>Seller/account</p>
							</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-warning">
							<div class="inner">
								<h3>${countAccount }</h3>

								<p>Tài khoản</p>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-6">
						<!-- small box -->
						<div class="small-box bg-danger">
							<div class="inner">
								<h3>
									<fmt:formatNumber type="currency" value="${totalPriceAdmin }"></fmt:formatNumber>
								</h3>

								<p>Doanh thu</p>
							</div>
							<div class="icon">
								<i class="ion ion-pie-graph"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
				</div>
				<!-- /.row -->
				<!-- Main row -->
				<div class="row">
					<!-- 		<section class="col-lg-12 connectedSortable">
						BAR CHART
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">Thông kê doanh thu và lợi nhuận</h3>

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
							/.card-body
						</div>
						/.card
					</section> -->


					<!-- Left col -->
					<section class="col-lg-6 connectedSortable">
						<!-- PIE CHART -->
						<div class="card card-danger">
							<div class="card-header">
								<h3 class="card-title">Thống kê cửa hàng / Khách hàng</h3>

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
								<canvas id="pieChart"
									style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</section>

					<!-- Right col -->
					<section class="col-lg-6 connectedSortable">
						<!-- PIE CHART -->
						<div class="card card-danger">
							<div class="card-header">
								<h3 class="card-title">Thống Kê Doanh Thu/Lợi Nhuận</h3>

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
								<canvas id="lineChart"
									style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</section>
					<!-- full col -->
					<section class="col-lg-12 connectedSortable">
						<!-- DIRECT CHAT -->
						<div class="card">
							<div class="card-header row">
								<form action="/admin/home/bills/filter" method="get">
									<div class="row d-flex justify-content-center"
										style="margin-top: 50px;">
										<div class="col-md-5">
											<div class="form-group">
												<label for="exampleInputEmail1">Ngày bắt đầu</label> <input
													type="date" name=dateStart class="form-control"
													value="${dateStart}" name="dateStart" required
													id="exampleInputEmail1" placeholder="Ngày bắt đầu">
												<p class="text-danger">${errorDateStart }</p>
											</div>
										</div>
										<div class="col-md-5">
											<div class="form-group">
												<label for="exampleInputEmail1">Ngày kết thúc</label> <input
													type="date" name="dateEnd" value="${dateEnd}" required
													class="form-control" id="exampleInputEmail1"
													placeholder="Ngày kết thúc">
												<p class="text-danger">${errorDateEnd }</p>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<button class="btn btn-success"
													style="margin-top: 30px; width: 100%;">Lọc</button>
											</div>
										</div>

									</div>
								</form>
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
											<th>Địa chỉ</th>
											<th>Số lượng</th>
											<th>Tổng tiền</th>
											<th>Tiền ship</th>
											<th>chiết khẩu</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="bills" items="${listbills }">
											<tr>
												<th>${bills.id }</th>
												<td><fmt:formatDate value="${bills.dateBuy}"
														pattern="yyyy-MM-dd" /></td>
												<td><fmt:formatDate value="${bills.finishDay }"
														pattern="yyyy-MM-dd" /></td>
												<td>${bills.account.username }</td>
												<td>${bills.addRessTo }</td>
												<td>${bills.quantity }</td>
												<td><fmt:formatNumber type="currency"
														value="${bills.totalPrice }"></fmt:formatNumber></td>
												<td><fmt:formatNumber type="currency"
														value="${bills.priceShipping-bills.discount }"></fmt:formatNumber></td>
												<td><c:set var="totalPrice" value="0" /> <c:forEach
														var="billDetail" items="${bills.billDetails}">
														<c:set var="linePrice"
															value="${billDetail.price * billDetail.quantity * 0.01}" />
														<c:set var="totalPrice" value="${totalPrice + linePrice}" />
													</c:forEach> <fmt:formatNumber value="${totalPrice}" type="currency" /></td>
											</tr>
										</c:forEach>
											<tr>
											<td>Tổng</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td> <strong>${sumQuantity}</strong> </td>
											<td> <strong> <fmt:formatNumber type="currency" value="${sumPrice}"></fmt:formatNumber> </strong> </td>
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
							<!--/.direct-chat -->
						</div>
					</section>
		</section>
		<!-- /.content -->
	</div>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->



	<!-- jQuery -->
	<script src="/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="/assets/plugins/chart.js/Chart.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/assets/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/assets/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script src="/assets/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="/assets/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="/assets/plugins/jszip/jszip.min.js"></script>
	<script src="/assets/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="/assets/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="/assets/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/assets/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="/assets/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/assets/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/assets/dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Đoạn mã JavaScript sẽ được thực thi sau khi trang và tất cả các nguồn tài nguyên đã được tải xong

			var areaChartData = {
				labels : [ 'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
						'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
						'Tháng 10', 'Tháng 11', 'Tháng 12' ],
				datasets : [ {
					label : 'Doanh thu',
					backgroundColor : 'rgba(60,141,188,0.9)',
					borderColor : 'rgba(60,141,188,0.8)',
					pointRadius : false,
					pointColor : '#3b8bba',
					pointStrokeColor : 'rgba(60,141,188,1)',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(60,141,188,1)',
					data : [ 1, 2, 40, 19, 86, 27, 90, 80, 40, 10, 30, 50 ]
				}, {
					label : 'Lợi nhuận',
					backgroundColor : 'rgba(210, 214, 222, 1)',
					borderColor : 'rgba(210, 214, 222, 1)',
					pointRadius : false,
					pointColor : 'rgba(210, 214, 222, 1)',
					pointStrokeColor : '#c1c7d1',
					pointHighlightFill : '#fff',
					pointHighlightStroke : 'rgba(220,220,220,1)',
					data : [ 65, 59, 80, 81, 56, 55, 40, 70, 40, 10, 67, 100 ]
				}, ]
			};

			var barChartCanvas = document.getElementById('barChart');
			if (barChartCanvas) {
				var barChartContext = barChartCanvas.getContext('2d');
				if (barChartContext) {
					var barChartData = Object.assign({}, areaChartData); // Sử dụng Object.assign() thay vì $.extend() của jQuery
					var temp0 = areaChartData.datasets[0];
					var temp1 = areaChartData.datasets[1];
					barChartData.datasets[0] = temp1;
					barChartData.datasets[1] = temp0;

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
		// piechart
		var pieChart = {
			labels : [ 'User', 'Seller', 'Admin'
			// 'FireFox',
			// 'Safari',
			// 'Opera',
			// 'Navigator',
			],
			datasets : [ {
				data : [
	<%=request.getAttribute("countUser")%>
		,
	<%=request.getAttribute("countSeller")%>
		,
	<%=request.getAttribute("countAdmin")%>
		//400, 600, 300, 100
				],
				backgroundColor : [ '#f56954', '#00a65a',
				// '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'
				],
			} ]
		}

		var lineChart = {
			labels : [ 'Đang chờ duyệt', 'Seller đã duyệt',
			// 'FireFox',
			// 'Safari',
			// 'Opera',
			// 'Navigator',
			],
			datasets : [ {
				data : [
	<%=request.getAttribute("countSellerNotCheck")%>
		,
	<%=request.getAttribute("countSeller")%>
		// ,400, 600, 300, 100
				],
				// backgroundColor: ['#f56954', '#00a65a',
				// // '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'
				backgroundColor : [ '#3c8dbc', '#d2d6de'

				],
			} ]
		}
		var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
		var pieData = pieChart;
		var pieOptions = {
			maintainAspectRatio : false,
			responsive : true,
		}
		//Create pie or douhnut chart
		// You can switch between pie and douhnut using the method below.
		new Chart(pieChartCanvas, {
			type : 'pie',
			data : pieData,
			options : pieOptions
		})
		var pieChartCanvas = $('#lineChart').get(0).getContext('2d');
		var pieData = lineChart;
		var pieOptions = {
			maintainAspectRatio : false,
			responsive : true,
		}
		//Create pie or douhnut chart
		// You can switch between pie and douhnut using the method below.
		new Chart(pieChartCanvas, {
			type : 'pie',
			data : pieData,
			options : pieOptions
		})
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
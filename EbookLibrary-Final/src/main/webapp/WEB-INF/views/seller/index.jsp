<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>




</head>

<body class="hold-transition sidebar-mini layout-fixed">
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
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">Dashboard v2</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item">Dashboard v2</li>
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
				<!-- Info boxes -->
				<div class="row">
					<div class="col-12 col-sm-6 col-md-3">
						<div class="info-box">
							<span class="info-box-icon bg-info elevation-1"><i
								class="fas fa-cog"></i></span>

							<div class="info-box-content">
								<span class="info-box-text"> Lượt đánh giá</span> <span
									class="info-box-number"> ${eValue}
								</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-12 col-sm-6 col-md-3">
						<div class="info-box mb-3">
							<span class="info-box-icon bg-danger elevation-1"><i
								class="fas fa-thumbs-up"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Yêu Thích</span> <span
									class="info-box-number">${like}</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<!-- fix for small devices only -->
					<div class="clearfix hidden-md-up"></div>

					<div class="col-12 col-sm-6 col-md-3">
						<div class="info-box mb-3">
							<span class="info-box-icon bg-success elevation-1"><i
								class="fas fa-shopping-cart"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Lượt Mua</span> <span
									class="info-box-number">${billSucces}</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-12 col-sm-6 col-md-3">
						<div class="info-box mb-3">
							<span class="info-box-icon bg-warning elevation-1"><i
								class="fas fa-users"></i></span>

							<div class="info-box-content">
								<span class="info-box-text"> Theo dõi</span> <span
									class="info-box-number">${follwer}</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

		<div class="row">
					<section class="col-lg-12 connectedSortable">
						<!-- BAR CHART -->
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">Thống Kê Doanh Thu - Lợi Nhuận</h3>

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
					</div>
				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<div class="col-md-8">
						<!-- MAP & BOX PANE -->
						<div class="card">
							<!-- <div class="card-header">
                <h3 class="card-title">US-Visitors Report</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div> -->
							<!-- /.card-header -->

							<!-- /.card-body -->
						</div>
						<!-- /.card -->
						<div class="row">
					
							<!-- /.col -->

							<div class="col-md-12">
								<!-- USERS LIST -->
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">Khách Hàng Mua Nhiều Nhất</h3>

										<div class="card-tools">
											<span class="badge badge-danger">8</span>
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
									<!-- /.card-header -->
									<div class="card-body p-0">
										<ul class="users-list clearfix">
										<c:forEach var="account" items="${listTopAccount}">
										<li ><img src="/assets/img/${account[1]}"
												alt="User Image"> <a class="users-list-name" href="#">${account[0]}
				                                </a> <span class="users-list-date">${account[2]}</span></li>
										</c:forEach>
											
										</ul>
										<!-- /.users-list -->
									</div>
									<!-- /.card-body -->
								<!-- 	<div class="card-footer text-center">
										<a href="javascript:">View All Users</a>
									</div> -->
									<!-- /.card-footer -->
								</div>
								<!--/.card -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->

						<!-- TABLE: LATEST ORDERS -->
						<div class="card">
							<div class="card-header border-transparent">
								<h3 class="card-title">Top 4 Sản Phẩm Bán Nhiều Nhất</h3>

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
							<!-- /.card-header -->
							<div class="card-body p-0">
								<div class="table-responsive">
									<table class="table m-0">
										<thead>
											<tr>
												<th>Mã sản phẩm</th>
												<th>Tên sản phẩm</th>
												<th>Lượt mua</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="product" items="${listTopProduct}">
												<tr>
													<td><a href="pages/examples/invoice.html">${product[0]}</a></td>
													<td>${product[1]}</td>
													<td><span class="badge badge-success">${product[2]}</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.card-body -->
							<!-- /.card-footer -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->

					<div class="col-md-4">
						<!-- Info Boxes Style 2 -->
						<div class="info-box mb-3 bg-warning">
							<span class="info-box-icon"><i class="fas fa-tag"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Tổng Doanh Thu</span> <span
									class="info-box-number"><fmt:formatNumber value="${tongDoanhThu}" type="currency" currencySymbol="₫" groupingUsed="true" maxFractionDigits="0"/></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
						<div class="info-box mb-3 bg-success">
							<span class="info-box-icon"><i class="far fa-heart"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Tổng Lợi Nhuận</span> <span
									class="info-box-number"><fmt:formatNumber value="${tongLoiNhuan}" type="currency" currencySymbol="₫" groupingUsed="true" maxFractionDigits="0"/></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
						<div class="info-box mb-3 bg-danger">
							<span class="info-box-icon"><i
								class="fas fa-cloud-download-alt"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Đơn Hàng Đang Chờ Duyệt</span> <span
									class="info-box-number">${billChuaDuyet}</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
						<div class="info-box mb-3 bg-info">
							<span class="info-box-icon"><i class="far fa-comment"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Lượt Đánh Giá Trung Bình</span> <span
									class="info-box-number"><fmt:formatNumber value="${avgStar}	" type="number"
														minFractionDigits="1" maxFractionDigits="1" />/5*</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
						<hr>
						<!-- <div class="card">
              <div class="card-header">
                <h3 class="card-title">Browser Usage</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div> -->
						<!-- /.card-header -->

						<!-- /.card-body -->

						<!-- /.card -->

						<!-- PRODUCT LIST -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Lượt Đánh Giá Mới Nhất</h3>

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
							<!-- /.card-header -->
							<div class="card-body p-0">
								<ul class="products-list product-list-in-card pl-2 pr-2">
								<c:forEach var="eValue" items="${listEvalueNew}">
									<li class="item">
										<div class="product-img">
											<img src="/assets/img/${eValue[1]}"
												alt="Image" class="img-size-50">
										</div>
										<div class="product-info">
											<a href="javascript:void(0)" class="product-title">${eValue[1]}
												<span class="badge badge-warning float-right">${eValue[3]}/5*</span>
											</a> <span class="product-description">${eValue[2]}</span>
										</div>
									</li>
								</c:forEach>
								</ul>
							</div>
							<!-- /.card-body -->
							<!-- /.card-footer -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!--/. container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>

	<!-- ChartJS -->
	<script src="/assets/plugins/chart.js/Chart.min.js"></script>

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


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>


	<script>
	
	document.addEventListener('DOMContentLoaded', function() {

	    var billSucces = ${doanhThu}; 
	    var billFalse = ${loiNhuan};
	    var billValuesSucces = billSucces.map(function(str) {
	        var value = str.split('=')[1];
	        var endBracketIndex = value.indexOf('}');
	        return value.substring(0, endBracketIndex);
	    });
	    var billValuesFalse = billFalse.map(function(str) {
	        var value = str.split('=')[1];
	        var endBracketIndex = value.indexOf('}');
	        return value.substring(0, endBracketIndex);
	    });
	    
				var areaChartData = {
					labels : [ 'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
							'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
							'Tháng 10', 'Tháng 11', 'Tháng 12' ],
					datasets : [ {
						label : 'Doanh Thu',
						backgroundColor : 'rgba(60,141,188,0.9)',
						borderColor : 'rgba(60,141,188,0.8)',
						pointRadius : false,
						pointColor : '#3b8bba',
						pointStrokeColor : 'rgba(60,141,188,1)',
						pointHighlightFill : '#fff',
						pointHighlightStroke : 'rgba(60,141,188,1)',
						data : billValuesSucces
					}, {
						label : 'Lợi Nhuận',
						backgroundColor : 'rgba(210, 214, 222, 1)',
						borderColor : 'rgba(210, 214, 222, 1)',
						pointRadius : false,
						pointColor : 'rgba(210, 214, 222, 1)',
						pointStrokeColor : '#c1c7d1',
						pointHighlightFill : '#fff',
						pointHighlightStroke : 'rgba(220,220,220,1)',
						data : billValuesFalse
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
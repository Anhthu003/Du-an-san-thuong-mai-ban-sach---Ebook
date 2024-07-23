<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý seller</title>
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
						<h1>Quản lý seller</h1>
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
								<h3 class="card-title">Quản lý tài khoản seller</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Tên tài khoản</th>
											<th>Họ và tên</th>
											<th>Lượt theo dõi</th>
											<th>Lượt đánh giá</th>
											<th>Đã bán</th>
											<th>Doanh thu</th>
											<th>Lợi nhuận</th>
											<th>Đánh giá</th>
											<th>Trạng thái</th>
											<!-- <th></th> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach var="stats" items="${statisticsList}">
											<tr>
												<td class="align-middle">${stats.username}</td>
												<td class="align-middle">${stats.fullname}</td>
												<td class="align-middle">${stats.countTD}</td>
												<td class="align-middle">${stats.countDanhGia}</td>
												<td class="align-middle">${stats.countDaBan}</td>
												<td class="align-middle"><fmt:formatNumber
														type="currency" value="${stats.doanhThu}"></fmt:formatNumber>
												</td>
												<td class="align-middle"><fmt:formatNumber
														type="currency" value="${stats.loiNhuan}"></fmt:formatNumber>
												</td>
												<td class="align-middle">
													<div class="progress progress-xs">
														<div class="progress-bar progress-bar-danger "
															style="width: ${stats.avgDanhGia/5*100}%">${stats.avgDanhGia}</div>
													</div>
												</td>
												<td><c:choose>
														<c:when test="${stats.status}">
															<button data-id="${stats.id}"
																data-fullname="${stats.fullname}" type="button"
																class="btn btn-danger deleteModal1">
																<i class="bi bi-trash-fill"
																	style="color: #ffffff; margin-right: 5px;"></i> Ngừng
																hoạt động
															</button>

														</c:when>
														<c:otherwise>
															<a href="/admin/sellermanager/id/${stats.id}"
																class="btn btn-success"> <i
																class="bi bi-check-circle-fill"
																style="color: #ffffff; margin-right: 5px;"></i> Hoạt
																động lại
															</a>
														</c:otherwise>
													</c:choose></td>
												<%-- <td>
													<form action="/admin/sellermanager/bills" method="get">
														<input type="hidden" name="accountId" value="${stats.id}" />
														<button type="submit" class="btn btn-success"
															style="color: white;">
															<i class="bi bi-list-ul"></i>
														</button>
													</form>
												</td> --%>
											</tr>
										</c:forEach>

										<form action="" method="get" id="modelForm1">
											<div class="modal" id="modelID1">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-body">
															<input value="false" name="status" hidden>
															<h2 class="text-center">Phản hồi shop</h2>
															<div class="form-group">
																<label class="form-label">Gửi đến:</label> <input
																	class="form-control" id="context1" disabled="disabled">
															</div>
															<div class="form-group">
																<label class="form-label">Lí do:</label>
																<textarea id="contextLiDo1" class="form-control"></textarea>
															</div>
														</div>
														<div class="modal-footer">
															<button class=" btn btn-danger btnclose1">Close</button>
															<a type="button" id="buttonSend1" class="btn btn-success">Gửi</a>
														</div>
													</div>
												</div>
											</div>
										</form>
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
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Duyệt tài khoản seller</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example3" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Tên tài khoản</th>
											<th>Họ và tên</th>
											<th>SDT</th>
											<th>Địa chỉ</th>
											<th>Email</th>
											<th>Số CCCD</th>
<!-- 											<th>Ngân hàng</th>
											<th>Số tài khoản</th> -->
											<th>Trạng thái</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach var="seller" items="${listCheckSeller }">
											<tr>
												<td class="align-middle">${seller.username }</td>
												<td class="align-middle">${seller.fullname }</td>
												<td class="align-middle">${seller.phone }</td>
												<td class="align-middle"><c:forEach var="addresses"
														items="${seller.addresses }">
														<c:if test="${addresses.status}">
												${addresses.province.name } - ${addresses.district.name } - ${addresses.commune.name }
												</c:if>
													</c:forEach></td>
												<td class="align-middle">${seller.email }</td>
												<td class="align-middle">${seller.numberCitizenIdentification }</td>
						<%-- 						<c:forEach var="banks" items="${seller.banks}">
													<c:if test="${banks.status}">
														<td class="align-middle">${banks.nameBank}</td>
														<td class="align-middle">${banks.accountNumber}</td>
													</c:if>
												</c:forEach> --%>
												<td class="align-middle"><a
													href="/admin/sellermanager/checkSeller/${seller.id}?status=true"
													class="btn btn-primary">Đồng ý</a>
													<button data-id="${seller.id}"
														data-fullname="${seller.fullname}"
														class="btn btn-danger deleteModal">Từ chối</button></td>
											</tr>
										</c:forEach>
										<form action="" method="get" id="modelForm">
											<div class="modal" id="modelID">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-body">
															<input value="false" name="status" hidden>
															<h2 class="text-center">Phản hồi shop</h2>
															<div class="form-group">
																<label class="form-label">Gửi đến:</label> <input
																	class="form-control" id="context" disabled="disabled">
															</div>
															<div class="form-group">
																<label class="form-label">Lí do:</label>
																<textarea id="contextLiDo" class="form-control"></textarea>
															</div>
														</div>
														<div class="modal-footer">
															<button class=" btn btn-danger btnclose">Close</button>
															<a type="button" id="buttonSend" class="btn btn-success">Gửi</a>
														</div>
													</div>
												</div>
											</div>
										</form>
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

	<!-- ./wrapper -->

	<%@include file="/common/taglib-js.jsp"%>
	<script>
	/* MOdel 1 */
	const confirmDeleteModal1 = document.getElementById("modelID1");
	const form1 = document.getElementById("modelForm1");
	const confirmDeleteButton1 = document.getElementById("buttonSend1");
	const deleteButtons1 = document.querySelectorAll(".deleteModal1");
	
	const closeButtons1 = document.querySelectorAll(".btnclose1");
	let dataId1 ;
	let dataFullname1;
	// Add click event listener to each delete button
	deleteButtons1.forEach(button => {
	    button.addEventListener("click", (event) => {
	    		dataId1 = button.getAttribute("data-id");
	    		dataFullname1 = button.getAttribute("data-fullname");
	    		 const contextInput = document.getElementById("context1");
	    	        contextInput.value = dataFullname1;
	            if (dataId1) {
	            	confirmDeleteModal1.style.display = 'block';
	            } else {
	                console.error("Product ID not found");
	            }
            });
	});

	confirmDeleteButton1.addEventListener("click", (event) => {
	    	const contextLD = document.getElementById("contextLiDo1").value;
	    	confirmDeleteButton1.href='/admin/sellermanager/id/'+dataId1+'?liDo1='+encodeURIComponent(contextLD);
			window.location.href = confirmDeleteButton1.href; 
	    }); 
	
	// Add click event listener to each close button
	closeButtons1.forEach(button => {
	    button.addEventListener("click", (event) => {
	        confirmDeleteModal1.style.display = 'none';
	    });
	});
	
	
	
	
	const confirmDeleteModal = document.getElementById("modelID");
	const form = document.getElementById("modelForm");
	const confirmDeleteButton = document.getElementById("buttonSend");
	const deleteButtons = document.querySelectorAll(".deleteModal");
	
	const closeButtons = document.querySelectorAll(".btnclose");
	let dataId ;
	let dataFullname;
	// Add click event listener to each delete button
	deleteButtons.forEach(button => {
	    button.addEventListener("click", (event) => {
	    		dataId = button.getAttribute("data-id");
	    		dataFullname = button.getAttribute("data-fullname");
	    		 const contextInput = document.getElementById("context");
	    	        contextInput.value = dataFullname;
	            if (dataId) {
	            	confirmDeleteModal.style.display = 'block';
	            } else {
	                console.error("Product ID not found");
	            }
            });
	});

	 confirmDeleteButton.addEventListener("click", (event) => {
	    	const contextLD = document.getElementById("contextLiDo").value;
	    	confirmDeleteButton.href='/admin/sellermanager/checkSeller/'+dataId+'?status=false&liDo2='+encodeURIComponent(contextLD);
			window.location.href = confirmDeleteButton.href; 
	    }); 
	
	// Add click event listener to each close button
	closeButtons.forEach(button => {
	    button.addEventListener("click", (event) => {
	        confirmDeleteModal.style.display = 'none';
	    });
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

</body>

</html>
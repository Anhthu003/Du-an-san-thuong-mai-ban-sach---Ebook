<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
					<div class="col-md-12"></div>
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Danh sách tài khoản</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Tên tài khoản</th>
											<th>Họ và tên</th>
											<th>Email</th>
											<th>SDT</th>
											<th>Địa chỉ</th>
											<th>Trang Thái</th>
											<th>Quyền</th>
											<th style="width: 150px;">Thao tác</th>


										</tr>
									</thead>
									<tbody>
										<c:forEach var="accounts" items="${listAccount }">

											<tr>
												<td class="align-middle">${accounts.username}</td>
												<td class="align-middle">${accounts.fullname}</td>
												<td class="align-middle">${accounts.email}</td>
												<td class="align-middle">${accounts.phone}</td>
												<td class="align-middle"><c:forEach var="addresses"
														items="${accounts.addresses }">
														<c:if test="${addresses.status}">
												${addresses.province.name } - ${addresses.district.name } - ${addresses.commune.name }
												</c:if>
													</c:forEach></td>
												<td class="align-middle">${accounts.status?'Đang hoạt động':'Ngừng hoạt động'}</td>
												<td class="align-middle"><c:forEach var="roledetails"
														items="${accounts.roledetails }">
														<c:if test="${roledetails.account.id == accounts.id }">
															${roledetails.role.name }
															</c:if>
													</c:forEach></td>

												<td class="align-middle text-center"><c:if
														test="${accounts.status}">
														<button
															data-id="${accounts.id}" data-fullname="${accounts.fullname}"
															class="btn btn-danger deleteModal1"> <i
															class="bi bi-trash-fill"></i> Ngừng hoạt động
														</button>
													</c:if> <c:if test="${!accounts.status}">
														<a href="/admin/accountmanager/status/${accounts.id}"
															class="btn btn-success"> <i
															class="bi bi-check-circle-fill"></i> Hoạt động
														</a>
													</c:if></td>
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
	    	confirmDeleteButton1.href='/admin/accountmanager/status/'+dataId1+'?liDo1='+encodeURIComponent(contextLD);
			window.location.href = confirmDeleteButton1.href; 
	    }); 
	
	// Add click event listener to each close button
	closeButtons1.forEach(button => {
	    button.addEventListener("click", (event) => {
	        confirmDeleteModal1.style.display = 'none';
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
	</script>


</body>
</html>
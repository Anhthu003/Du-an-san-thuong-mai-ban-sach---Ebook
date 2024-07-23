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
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Duyệt sản phẩm bán</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th colspan="2" class="align-middle text-center">Sách</th>
											<th>Loại sách</th>
											<th>Tác giả</th>
											<th>Nhà xuất bản</th>
											<th>Giá</th>
											<th>Giảm giá</th>
											<th>Số lượng</th>
											<th style="width: 135px;">Mô tả</th>


										</tr>
									</thead>
									<tbody>
										<c:forEach var="product" items="${products }">
											<tr>
												<td>${product.id}</td>
												<td class="align-middle" style="width: 160px;">
													<div class="row">
														<c:forEach var="image" items="${product.imageProducts }">
															<div class="col-md-6" style="padding: 3px;">
																<img src="/assets/img/${image.name }" width="100%"
																	height="120px" alt="">
															</div>
														</c:forEach>
													</div>
												</td>
												<td class="align-middle">${product.category.name }</td>
												<td class="align-middle">${product.writerName }</td>
												<td class="align-middle">${product.publishingCompany }</td>
												<%-- 												<td class="align-middle">${product.publishingCompany }</td>
 --%>
												<td class="align-middle"><fmt:formatNumber
														type="currency" value="${product.price }"></fmt:formatNumber>
												</td>
												<td class="align-middle"><fmt:formatNumber
														type="currency" value="${product.discount}"></fmt:formatNumber>
												</td>
												<td class="align-middle">${product.quantity}</td>
												<td class="align-middle"><a
													href="/admin/productmanager/true/${product.id}"
													class="btn btn-primary">Đồng ý</a>
													<button data-id="${product.id}"
														data-fullname="${product.name}"
														class="btn btn-danger deleteModal1 ">Từ chối</button></td>
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
	    	confirmDeleteButton1.href='/admin/productmanager/false/'+dataId1+'?liDo1='+encodeURIComponent(contextLD);
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
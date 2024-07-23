<%@page import="com.foti_java.model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.foti_java.model.Product"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Manager</title>
<!-- bootstrap -->
<%@include file = "/common/taglib-link.jsp" %>
<style type="text/css">
/* breadcrumb */
.breadcrumb-item a {
	color: rgba(33, 37, 41, 0.75);
	text-decoration: none;
}

.container-them-sanpham {
	background-color: whitesmoke;
}

/* TITLE */
.title-manage-products {
	padding-top: 20px;
	margin-left: 2%;
	margin-bottom: 30px;
}

/* CONTAINER TABLE */
.container-info-sanpham {
	padding: 25px 15px 25px 15px;
	background-color: white;
}

.container-info-sanpham .info {
	margin-top: 20px;
	font-size: 15px;
}

/* CONTAINER TABLE */
.container-info-sanpham .info input {
	font-size: 15px;
}

.form-info-sanpham {
	margin: 0px;
}

.title {
	padding-bottom: 5px;
	margin-left: 25px;
	border-bottom: 1px solid #dee2e6;
}

.info {
	padding: 0 20px;
	margin: 0 0 20px 0;
}

.info span {
	font-size: 15px;
}

/* Ảnh */
.container-images {
	width: 100%;
	height: 200px;
	border: 1px solid #dee2e6;
	display: flex;
	justify-content: center; /* Canh giữa theo chiều ngang */
	align-items: center;
}

.show-img-div {
	display: flex;
}

/* Quy tắc chung cho .show-img-div .imageOld và .image */
.show-img-div .imageOld, .show-img-div .image {
	position: relative;
	display: inline-block;
	margin-right: 10px; /* Để tạo một khoảng cách giữa hình ảnh và nút x */
}

/* Quy tắc cho img bên trong .show-img-div .imageOld và .image */
.show-img-div .imageOld img, .show-img-div .image img {
	height: 150px;
	width: auto; /* Đảm bảo hình ảnh lấp đầy container */
	display: block;
	box-shadow: 0 0 6px #dee2e6;
	padding: 10px 10px;
}

/* Quy tắc cho span bên trong .show-img-div .imageOld và .image */
.show-img-div .imageOld span, .show-img-div .image span {
	position: absolute;
	top: 5px;
	right: 5px;
	background-color: rgba(255, 255, 255, 0.7); /* Tạo một nền cho nút x */
	padding: 0px 5px;
	border-radius: 50%;
	cursor: pointer;
	transition: background-color 0.3s;
	/* Hiệu ứng màu nền khi di chuột qua */
}

/* Quy tắc cho hover của span bên trong .show-img-div .image và .imageOld */
.show-img-div .image span:hover, .show-img-div .imageOld span:hover {
	background-color: #dee2e6; /* Tăng độ mờ của nút x khi di chuột qua */
}

/* CSS INPUT FILE  */
#file-upload[type="file"] {
	display: none;
}

.container-file-upload {
	border: 2px dotted #dee2e6;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Tùy chỉnh giao diện của nút tùy chọn tập tin */
.custom-file-upload {
	/* background-color: #4CAF50; */
	/* color: white; */
	padding: 10px 20px;
	text-align: center;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
/* Khi hover vào nút tùy chọn tập tin */
.custom-file-upload:hover {
	background-color: #e3e6de;
}

.custom-file-upload i {
	margin-right: 5px;
}

/* Giá sản phẩm */
.container-price-sanpham {
	padding: 25px 15px 25px 15px;
	margin-top: 10px;
	background-color: white;
	font-size: 15px;
}

.container-price-sanpham .info {
	margin-top: 20px;
}

.container-price-sanpham .info input {
	font-size: 15px;
}

/* Loại sản phẩm */
.loai-sanpham {
	display: flex;
	justify-content: space-around;
}

#loai-sanpham {
	font-size: 15px;
	margin-right: 10px;
}

/* button thêm loại */
.loai-sanpham .button-them {
	/* width: 120px; */
	
}

.loai-sanpham .button-them button {
	font-size: 15px;
}

/* BUTTON */
.container-button {
	border-top: 1px solid #dee2e6;
	padding: 25px 15px 25px 15px;
	background-color: white;
	display: flex;
	justify-content: end;
}

.container-button>button {
	margin-left: 10px;
	font-size: 15px;
}
/* .container-button a {
    color: white;
    text-decoration: none;
} */
.modal.show {
    display: block; /* Hiển thị modal khi có lớp show */
}
.modalCategory.show{
display: block;
}

.show-text{
	display:block;
	z-index:1000;
}
</style>
</head>

<body class="hold-transition sidebar-mini layout-fixed">


	<!-- bootstrap -->
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
	<!-- Font Awesome Icons -->
	<link rel="stylesheet"
		href="/assets/plugins/fontawesome-free/css/all.min.css">
	<!-- overlayScrollbars -->
	<link rel="stylesheet"
		href="/assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="/assets/dist/css/adminlte.min.css">
	<!-- Link icon -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
	<link rel="stylesheet"
		href="/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet"
		href="/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet"
		href="/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

	<link rel="stylesheet" href="/assets/css/manageAddProduct.css">




	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">Quản Lý Sản Phẩm</h1>
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
					<div class="row">
						<section class="col-lg-12 connectedSortable">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Quản lý</h3>
								</div>
								<form action="" method="post" enctype="multipart/form-data">
									<div class="card-body" style="padding: 0px;">
										<main class="container-them-sanpham ">
											<div class="container-col-1">
												<div class="form-info-sanpham row" style="margin-top: 10px">
													<div class="info col-md-6">
														<div class="lbl-info">
															<label for="ten-sanpham" class="form-label" >Tên
																sản phẩm <span style="color: red;" id="errorName">${errorName} <c:if
																		test="${errorName == null}">*</c:if>
															</span>
															</label>
														</div>
														<input type="text" class="form-control" name="name"
															value="${product.name}" id="name" />
													</div>
													<div class="info col-md-6">
														<div class="lbl-info">
															<label for="ten-sanpham" class="form-label">Loại
																sản phẩm
															</label>
														</div>
														<div class="input-group">
															<select class="form-control" name="category"
																required="required">
																<c:forEach var="item" items="${listCategories}">
																	<option value="${item.id}"
																		${item.id == product.category.id?'selected':''}>${item.name}</option>
																</c:forEach>
															</select> <a class="input-group-text" id="categoryButton">+</a>
														</div>
													</div>

													<div class="info col-md-6">
														<div class="lbl-info">
															<label for="id-sanpham" class="form-label">Tác
																giả <span style="color: red;" id="errorTacGia">*</span>
															</label>
														</div>
														<input type="text" class="form-control" name="writerName"
															value="${product.writerName}" id="tacGia"
															required="required" />
													</div>

													<div class="info col-md-6">
														<div class="lbl-info">
															<label for="soluong-sanpham" class="form-label">
																Nhà xuất bản <span style="color: red;" id="errorNhaXuatBan">*</span>
															</label>
														</div>
														<input type="text" class="form-control"
															name="publishingCompany"
															value="${product.publishingCompany}" id="nhaXuatBan" required="required" />
													</div>

													<div class="info col-md-12 row">
														<div class="message" style="color: red;"></div>
														<div class="col-md-2 container-file-upload">
															<label for="file-upload"
																class="form-label custom-file-upload"> <i
																class="fa fa-cloud-upload "></i> Đăng tải ảnh sản phẩm
															</label>
														</div>
														<div class="col-md-10 save-image">
															<div id="input-save-image">
																<input type="file" class="form-control" id="file-upload"
																	multiple="multiple"
																	accept="image/png, image/jpeg, image/jpg" name="images"
																	required/>
															</div>
															<div class="show-img-form slider">
																<div class="container-images slides">
																	<div class="show-img-div">
																		<img alt="" src="">
																	</div>
																</div>
															</div>
														</div>

														<div class="container-price-sanpham">
															<div class="row">
																<div class="info col-md-6">
																	<div class="lbl-info">
																		<label for="price-sanpham" class="form-label">Mức
																			giá của sản phẩm <span style="color: red;">${errorPrice}
																				<c:if test="${errorPrice == null}">*</c:if>
																		</span>
																		</label>
																	</div>
																	<div class="input-group">
																		<input type="number" class="form-control" name="price"
																			required="required" id="gia-sanpham"
																			value="${product.price}" min="1000" /> <span
																			class="input-group-text" id="khoiluong-sanpham2">VNĐ</span>
																	</div>
																</div>
																<div class="info col-md-6">
																	<div class="lbl-info">
																		<label for="price-sanpham" class="form-label">Số
																			lượng <span style="color: red;">${errorQuantity}
																				<c:if test="${errorQuantity == null}">*</c:if>
																		</span>
																		</label>
																	</div>
																	<div class="input-group">
																		<input type="number" class="form-control"
																			name="quantity" required="required" id="gia-sanpham"
																			value="${product.quantity}" min="1" />
																	</div>
																</div>
															
														</div>
																<div class="row">
															<div class="info col-md-6">
																<div class="lbl-info">
																	<label for="price-sanpham" class="form-label">Khối lượng
																		lượng <span style="color: red;">${errorWeight}
																			<c:if test="${errorWeight == null}">*</c:if>
																	</span>
																	</label>
																</div>
																<div class="input-group">
																		<input type="number" class="form-control" name="weight"
																			required="required" id="gia-sanpham"
																			value="${product.weight}" min="1" /> <span
																			class="input-group-text" id="khoiluong-sanpham2">Gram</span>
																</div>
															</div>
															<div class="info col-md-6">
																<div class="lbl-info">
																	<label for="gia-sanpham" class="form-label">
																		Giảm giá <span style="color: red;" id="discountLabel">${errorSale}
																			<c:if test="${errorSale == null}">*</c:if>
																	</span>
																	</label>
																</div>
																<div class="input-group">
																	<input type="number" class="form-control" name="discount"
																		required="required" id="gia-sanpham"
																		value="${product.discount}" min="0" /> <span
																		class="input-group-text" id="discountUnit">
																		VNĐ
																		
																		</span>
																</div>
															</div>
														</div>
															<div class="row">
																<div class="info col-md-12">
																	<div class="lbl-info">
																		<label for="sale-sanpham" class="form-label">Giới
																			thiệu sản phẩm <span style="color: red;" id="errorGioiThieu">*</span>
																		</label>
																	</div>
																	<div class="input-group">
																		<textarea class="form-control" rows="" cols=""
																			name="introduce" id="gioiThieu">${product.introduce}</textarea>
																	</div>
																</div>
															</div>
														</div>
														<div class="container-button">

															<button type="submit" id="createButton"
																class="btn btn-outline-success" style="width: 100px;"
																formaction="/seller/productmanager/create">Thêm
																mới</button>
															<button type="submit" id="updateButton"
																class="btn btn-outline-primary" style="width: 100px;"
																formaction="/seller/productmanager/update">Cập
																nhật</button>
															<a class="btn btn-outline-dark"
																href="/seller/productmanager/reset"
																style="width: 100px; margin-left: 10px">Làm mới</a>
														</div>
													</div>
												</div>
											</div>
										</main>
									</div>
								</form>
							</div>
						</section>
					<!-- Table -->
					<section class="col-lg-12 connectedSortable">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Danh sách sản phẩm</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th class="align-middle text-center">Mã sản phẩm</th>
											<th colspan="2" class="align-middle text-center">Sản
												phẩm</th>
											<th class="align-middle text-center">Số lượng</th>
											<th class="align-middle text-center">Giá</th>
											<th class="align-middle text-center">Thể loại</th>
											<th class="align-middle text-center">Đánh giá</th>
											<th class="align-middle text-center" style="width: 100px;">Thao
												tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="product" items="${listProduct}">
											<tr>
												<td class="align-middle">${product.id}</td>
												<td class="align-middle"><img alt=""
													style="width: 60px; height: 70px; border-radius: 5px;"
													src="/assets/img/${product.image}"> <c:forEach var="img"
														items="${product.imageProducts}">
														<img alt=""
															style="width: 60px; height: 70px; border-radius: 5px;"
															src="/assets/img/${img.name}">
													</c:forEach></td>

												<td class="align-middle">${product.name}</td>
												<td class="align-middle">${product.quantity}</td>
												<td class="align-middle"><fmt:formatNumber
														value="${product.price}" type="currency" pattern="#,##0"
														currencySymbol="" /><sup>đ</sup></td>

												<!-- Khởi tạo các biến totalStars và numberOfReviews -->
												<c:set var="totalStars" value="0" />
												<c:set var="numberOfReviews" value="0" />
												<td class="align-middle">${product.category.name}</td>
												<td class="align-middle">
													<!-- Cập nhật giá trị của totalStars và numberOfReviews trong vòng lặp forEach -->
													<c:forEach var="star" items="${product.evalues}">
														<c:set var="totalStars" value="${totalStars + star.star}" />
														<c:set var="numberOfReviews"
															value="${numberOfReviews + 1}" />
													</c:forEach> <!-- Tính giá trị trung bình của star --> <c:set
														var="averageStars"
														value="${numberOfReviews != 0 ? totalStars / numberOfReviews : 0}" />
													<fmt:formatNumber value="${averageStars}" type="number"
														minFractionDigits="1" maxFractionDigits="1" />/5*
												</td>

												

												<td class="align-middle text-center"><c:if
														test="${product.active}">
														<a href="/seller/productmanager/edit?id=${product.id}"
															class="btn btn-primary">Edit</a>
													</c:if> <c:if test="${product.active}">
														<a type="button" class="btn btn-danger deleteModal"
															data-id="${product.id}">Xóa</a>
													</c:if></td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
								<div class="modal" id="confirmDeleteModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="confirmDeleteLabel">Thông
													Báo</h5>
												<button type="button" class="btn-close thoat"></button>
											</div>
											<div class="modal-body">Bạn có chắc chắn muốn xóa sản
												phẩm này không?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary thoat">Hủy</button>
												<a type="button" class="btn btn-danger"
													id="confirmDeleteButton">Xóa</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
					</section>
				</div>
				<!-- /.card -->


			</div>

			<!--/. container-fluid -->
		</section>
		<!-- /.content -->
		<!-- /.content-wrapper -->
	</div>
						<div class="modal modalCategory" id="categoryModal" >
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="confirmDeleteLabel">Thể loại</h5>
									<button type="button" class="btn-close" id="categoryClose"></button>
								</div>
								<div class="modal-body">
									<form action="" method="post">
										<div class="mb-3">
											<label class="form-label">Thể loại <span
												style="color: red;" id="errorNameCate">${errorNameCategory} <c:if
														test="${errorNameCategory == null}">*</c:if>
											</span>
											</label> <input type="text" name="nameCategory" id="nameCate"
												value="${categoryNew.name}" class="form-control" required="required" />
										</div>
										<div class="mb-3">
										<c:if test="${showBtnCreate == true}">
											<button type="submit" class="btn btn-outline-success"
												formaction="/seller/productmanager/category/create">Thêm
												mới</button>
										</c:if>
										<c:if test="${showBtnUpdate == true}">
											<button type="submit" class="btn btn-outline-primary"
												formaction="/seller/productmanager/category/update">Cập
												nhật</button>
										</c:if>
											<a type="button" class="btn btn-outline-dark"
												href="/seller/productmanager/category/reset">Làm
												Mới</a>
										</div>
									</form>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">Id</th>
												<th scope="col">Name</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody id="table-body">
											<!-- Rows will be populated by JavaScript -->
										</tbody>
									</table>
									<nav aria-label="Page navigation example" id="pagination-controls">
									<ul class="pagination"  >
										<li id="prev-btn" class="page-link" onclick="prevPage()">Prev</li>
										<li id="page-info" class="page-link"></li>
										<li  id="next-btn" class="page-link" onclick="nextPage()">Next</li >
									</ul>
									</nav>
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
	<script>
    $(function () {
      $("#example1").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": false,
        "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"],
      	"order": [[0, "desc"]]  // Sắp xếp theo cột thứ hai (id) giảm dần
      }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
        
      });
    });
    
  </script>



  <script>
	 function fetchImageAsBlob(url) {
 	    return fetch(url)
 	        .then(response => response.blob())
 	        .then(blob => new File([blob], url.split('/').pop(), { type: blob.type }));
 	}

 	// Add images to file input
 	async function addImagesToFileInput(imagesArray) {
 	    const inputSaveImage = document.querySelector("#file-upload");
 	    const dataTransfer = new DataTransfer();

 	    for (const imageUrl of imagesArray) {
 	        if (typeof imageUrl === "string") {
 	            const file = await fetchImageAsBlob(imageUrl);
 	            dataTransfer.items.add(file);
 	           imagesArray.push(file); // Add file to imagesArray
 	        }
 	    }

 	    inputSaveImage.files = dataTransfer.files;
 	    displayImage();
 	}

 	let imagesArray = [];
 	// Kiểm tra và thêm ảnh vào mảng imagesArray
if ('${images[0]}'.length > 0) {
const image = "${pageContext.request.contextPath}/assets/img/${images[0]}";
if (!imagesArray.includes(image)) {
	imagesArray.push(image);
}

}
if ('${images[1]}'.length > 0) {
const image = "${pageContext.request.contextPath}/assets/img/${images[1]}";
if (!imagesArray.includes(image)) {
	imagesArray.push(image);
}

}
if ('${images[2]}'.length > 0) {
	const image = "${pageContext.request.contextPath}/assets/img/${images[2]}";
	if (!imagesArray.includes(image)) {
		imagesArray.push(image);
	}

	}
if ('${images[3]}'.length > 0) {
	const image = "${pageContext.request.contextPath}/assets/img/${images[3]}";
	if (!imagesArray.includes(image)) {
		imagesArray.push(image);
	}

	}

 	// Add images to input file on page load
 	document.addEventListener("DOMContentLoaded", () => {
 	    addImagesToFileInput(imagesArray);
 	});

 	 const containerInputSaveImage = document.querySelector("#input-save-image");
     const inputSaveImage = document.querySelector("#file-upload");
     const containerShowImg = document.querySelector(".show-img-form");
     const showImg = document.querySelector(".show-img-div");
     const message = document.querySelector(".message");
     const deleteImage = [];

     // Hàm kiểm tra xem ảnh đã tồn tại trong mảng hay chưa
     function isImageExists(image) {
         return imagesArray.some(existingImage => existingImage.name === image.name);
     }

     if (inputSaveImage){
         inputSaveImage.addEventListener("change", (event) => {
        	 
             const files = Array.from(event.target.files);
             const maxSize = 500 * 1024 * 1024; // 500 MB
             const allowedTypes = ['image/png', 'image/jpeg', 'image/jpg'];
             const currentImageCount = imagesArray.filter(item => item instanceof File).length;
             let countListImages;
            console.log(currentImageCount)
             for (let index = 0; index < files.length; index++) {
                 const image = files[index];
                 console.log(files.length);
                 // Kiểm tra tổng số ảnh nếu thêm ảnh hiện tại
                 if (files.length+currentImageCount > 4){
                     message.innerHTML = "Bạn chỉ có thể thêm tối đa 4 ảnh.";
                     return;
                 }
        

                 if (image.size > maxSize) {
                     message.innerHTML = "Kích thước file ảnh quá lớn, vui lòng chọn file khác.";
                     inputSaveImage.value = ''; // Reset file input
                     return;
                 }

                 // Kiểm tra loại file
                 if (!allowedTypes.includes(image.type)) {
                     message.innerHTML = "Loại file không hợp lệ, vui lòng chọn file ảnh có định dạng PNG, JPEG hoặc JPG.";
                     inputSaveImage.value = ''; // Reset file input
                     return;
                 }
                 checkAI(inputSaveImage,index, image);	
                
             }

             // Clear message and reset input
             message.innerHTML = "";
             inputSaveImage.value = ''; // Reset file input

         });
     } else {
         console.log("Element with id 'show-img-form' not found.");
     }

     const PAT = "c9bcfa03a89c476b91936cab785c8b0d";
     const USER_ID = "gnwcvstmaqvo";
     const APP_ID = "my-first-application-b21dep";
     const MODEL_ID = "general-image-detection";
     const MODEL_VERSION_ID = "1580bb1932594c93b7e2e04456af7c6f";

     function checkAI(inputSaveImage, index, image) {
    	 
       const file = inputSaveImage.files[index];
   
       if (file) {
         const reader = new FileReader();
         reader.onloadend = function () {
           const base64String = reader.result
             .replace("data:", "")
             .replace(/^.+,/, "");

           const raw = JSON.stringify({
             user_app_id: {
               user_id: USER_ID,
               app_id: APP_ID,
             },
             inputs: [
               {
                 data: {
                   image: {
                     base64: base64String,
                   },
                 },
               },
             ],
           });

           const requestOptions = {
             method: "POST",
             headers: {
               Accept: "application/json",
               Authorization: "Key " + PAT,
             },
             body: raw,
           };

           fetch(
             "https://api.clarifai.com/v2/models/" +
               MODEL_ID +
               "/versions/" +
               MODEL_VERSION_ID +
               "/outputs",
             requestOptions
           )
             .then((response) => response.json())
             .then((result) => {
               console.log(result); 
             // console.log(result.outputs[0].data.regions[0].data.concepts[0].name);
            
               const outputs = result.outputs;
               if (
                 outputs &&
                 outputs.length > 0 &&
                 outputs[0].data &&
                 outputs[0].data.regions
               ) {
                 const regions = outputs[0].data.regions;
                

                 let bookDetected = false; // Biến để kiểm tra xem có sách được nhận dạng không

                 regions.forEach((region) => {
       if (region.data.concepts) {
         region.data.concepts.forEach((concept) => {
             console.log(concept.name);
           if (concept.name == 'Book' || concept.name == 'Poster') {
             bookDetected = true;
           }
         });
       }
     });

                 if (!bookDetected) {
                	 message.innerHTML = "Ảnh không hợp lệ.";
                 }else{
                	 imagesArray.push(image);
                	 displayImage();
                 }
                 checkBTNLoad();
                
               } else {
                 
               }
             })
             .catch((error) => console.log("error", error));
         };
         reader.readAsDataURL(file);
       } else {
         alert("Please select an image file.");
       }
     }

     function checkBTNLoad() {
    	   var button = document.getElementById('updateButton');
    	    var creatteButton = document.getElementById('creatteButton');
    	    
    	    
    	    var currentUrl = window.location.href;
    	    var regex = /^http:\/\/localhost:8080\/seller\/productmanager\/edit\?id=\d+$/;

    	    if (updateButton && createButton) {
    	        if (!regex.test(currentUrl)) {
    	            updateButton.disabled = true;
    	            createButton.disabled = false;
    	        } else {
    	            updateButton.disabled = false;
    	            createButton.disabled = true;
    	        }
    	    } else {
    	        console.error("One or both buttons do not exist in the DOM.");
    	    }
     }
     // DISPLAY IMAGE
     function displayImage() {
    	 
         showImg.innerHTML = ""; // Xóa bỏ tất cả các phần tử hiện có trước khi tạo mới
         const dataTransfer = new DataTransfer(); // Tạo một DataTransfer mới để cập nhật

         imagesArray.forEach((imageFile, index) => {
             // Kiểm tra xem imageFile có phải là một đối tượng File không
             if (imageFile instanceof File) {
                 // Tạo các phần tử ảnh và nút xóa
                 const img = document.createElement('img');
                 img.src = URL.createObjectURL(imageFile);
                 img.alt = 'image';

                 const span = document.createElement('span');
                 span.textContent = '×';
                 span.style.cursor = 'pointer';
                 span.onclick = function () {
                     imagesArray.splice(index, 1);
                     displayImage();
                 };

                 // Thêm các phần tử vào container
                 const imageContainer = document.createElement('div');
                 imageContainer.classList.add('image');
                 imageContainer.appendChild(img);
                 imageContainer.appendChild(span);

                 // Thêm container vào showImg
                 showImg.appendChild(imageContainer);

                 // Thêm file vào dataTransfer
                 dataTransfer.items.add(imageFile);
             }
         });

         // Cập nhật files trong inputSaveImage
         inputSaveImage.files = dataTransfer.files;
         
         
     }
document.addEventListener('DOMContentLoaded', function() {
	checkBTNLoad();
  
    const confirmDeleteModal = document.getElementById("confirmDeleteModal");
    const confirmDeleteButton = document.getElementById("confirmDeleteButton");

    const deleteButtons = document.querySelectorAll(".deleteModal");
    deleteButtons.forEach(button => {
        button.addEventListener("click", (event) => {
            const productId = button.getAttribute("data-id");
            console.log("Product ID:", productId);  // Debugging line
            if (productId) {
                confirmDeleteButton.setAttribute('href', `/seller/productmanager/delete?id=`+productId);
                confirmDeleteModal.style.display = 'block';
            } else {
                console.error("Product ID not found");
            }
        });
    });

    const buttonsDis = document.querySelectorAll(".thoat");
    buttonsDis.forEach(button => {
        button.addEventListener("click", (event) => {
            confirmDeleteModal.style.display = 'none';
        });
    });
  
    
    const categoryModal = document.getElementById("categoryModal");
    const catergoryButton = document.getElementById("categoryButton");
    const catergoryClose = document.getElementById("categoryClose");
    catergoryButton.addEventListener("click", (event) => {
    	categoryModal.style.display = 'block';
    });
    catergoryClose.addEventListener("click", (event) => {
    	categoryModal.style.display = 'none';
    });
    const categories = [
        <% List<Category> listCategories = (List<Category>) request.getAttribute("listCategories");
        for (Category category : listCategories) { %>
            { id: "<%= category.getId() %>", name: "<%= category.getName() %>" },
        <% } %>
    ];

    const rowsPerPage = 5;
    let currentPage = 1;

    function renderTable() {
        const tableBody = document.getElementById('table-body');
        tableBody.innerHTML = '';

        const start = (currentPage - 1) * rowsPerPage;
        const end = Math.min(start + rowsPerPage, categories.length);

        for (let i = start; i < end; i++) {
            const category = categories[i];
            const row = `
                <tr>
                    <th scope="row">${category.id}</th>
                    <td>${category.name}</td>
                    <td><a class="btn btn-danger" href="/seller/productmanager/category/delete?id=${category.id}">Edit</a></td>
                </tr>
            `;
            tableBody.innerHTML += row;
        }

        document.getElementById('page-info').innerText = `Page ${currentPage} of ${Math.ceil(categories.length / rowsPerPage)}`;
    }

    function nextPage() {
        if (currentPage < Math.ceil(categories.length / rowsPerPage)) {
            currentPage++;
            renderTable();
        }
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            renderTable();
        }
    }

    // Initial render
    renderTable();
    });

  </script>
  
   <script>
  $(document).ready(function() {
	    var showModal = "${showModal}";
	    const categoryModal = document.getElementById("categoryModal");
	    if (showModal === 'true') {
	    	categoryModal.style.display = 'block';
	    }
	});
  
  var categories = [
      <c:forEach var="category" items="${listCategories}">
          {
              "id": "${category.id}",
              "name": "${category.name}",
              "products": ${category.products == null ? "null" : category.products.size()}
          }<c:if test="${!status.last}">,</c:if>
      </c:forEach>
  ];
  var currentPage = 1;
  var itemsPerPage = 5;

  function displayTable(page) {
      var tableBody = document.getElementById('table-body');
      tableBody.innerHTML = ''; // Clear the current content

      var start = (page - 1) * itemsPerPage;
      var end = Math.min(start + itemsPerPage, categories.length);
      
      for (var i = start; i < end; i++) {
          var row = document.createElement('tr');
          var deleteButton = '';
          if (categories[i].products === "null" || categories[i].products === 0) {
              deleteButton = '<a type="button" class="btn btn-danger" href="/seller/productmanager/category/delete?id=' + categories[i].id + '">Delete</a>';
          }
          row.innerHTML = '<th scope="row">' + categories[i].id + '</th>' +
                          '<td>' + categories[i].name + '</td>' +
                          '<td>' + deleteButton + '</td>';
          tableBody.appendChild(row);
      }

      document.getElementById('page-info').innerText = 'Page ' + page + ' of ' + Math.ceil(categories.length / itemsPerPage);

      document.getElementById('prev-btn').disabled = page === 1;
      document.getElementById('next-btn').disabled = page === Math.ceil(categories.length / itemsPerPage);
  }

  function prevPage() {
      if (currentPage > 1) {
          currentPage--;
          displayTable(currentPage);
      }
  }

  function nextPage() {
      if (currentPage < Math.ceil(categories.length / itemsPerPage)) {
          currentPage++;
          displayTable(currentPage);
      }
  }

 
  window.onload = function() {
      displayTable(currentPage);
  };
  
  document.getElementById('name').addEventListener('change', function(event) {
	  let input = document.getElementById('name');
	  let errorName = document.getElementById('errorName');
	  checkText(input, errorName);
  });
  
  document.getElementById("tacGia").addEventListener('change', function(event) {
	  let input = document.getElementById('tacGia');
	  let errorName = document.getElementById('errorTacGia');
	  checkText(input, errorName);
  });
  
  document.getElementById("nhaXuatBan").addEventListener('change', function(event) {
	  let input = document.getElementById('nhaXuatBan');
	  let errorName = document.getElementById('errorNhaXuatBan');
	  checkText(input, errorName);
  });
  
  document.getElementById("gioiThieu").addEventListener('change', function(event) {
	  let input = document.getElementById('gioiThieu');
	  let errorName = document.getElementById('errorGioThieu');
	  checkText(input, errorName);
  });
  
  document.getElementById("nameCate").addEventListener('change', function(event) {
	  let input = document.getElementById('nameCate');
	  let errorName = document.getElementById('errorNameCate');
	  checkText(input, errorName);
  });
  
   function checkText(input, errorName) {
     

      ////////////////////////////////////////////////////////////////////////////////////////////////////
      // In this section, we set the user authentication, user and app ID, model details, and the URL
      // of the text we want as an input. Change these strings to run your own example.
      ///////////////////////////////////////////////////////////////////////////////////////////////////

      // Your PAT (Personal Access Token) can be found in the Account's Security section
      const PAT = 'c9bcfa03a89c476b91936cab785c8b0d';
      // Specify the correct user_id/app_id pairings
      // Since you're making inferences outside your app's scope
      const USER_ID = 'gnwcvstmaqvo';
      const APP_ID = "my-first-application-b21dep";
      // Change these to whatever model and text URL you want to use
      const MODEL_ID = 'moderation-multilingual-text-classification';
      const MODEL_VERSION_ID = '79c2248564b0465bb96265e0c239352b';
      const RAW_TEXT = input.value;
      // To use a hosted text file, assign the url variable
      // const TEXT_FILE_URL = 'https://samples.clarifai.com/negative_sentence_12.txt';
      // Or, to use a local text file, assign the url variable
      // const TEXT_FILE_BYTES = 'YOUR_TEXT_FILE_BYTES_HERE';

      ///////////////////////////////////////////////////////////////////////////////////
      // YOU DO NOT NEED TO CHANGE ANYTHING BELOW THIS LINE TO RUN THIS EXAMPLE
      ///////////////////////////////////////////////////////////////////////////////////

      const raw = JSON.stringify({
          "user_app_id": {
              "user_id": USER_ID,
              "app_id": APP_ID
          },
          "inputs": [
              {
                  "data": {
                      "text": {
                          "raw": RAW_TEXT
                          // url: TEXT_URL, allow_duplicate_url: true 
                          // raw: fileBytes
                      }
                  }
              }
          ]
      });

      const requestOptions = {
          method: 'POST',
          headers: {
              'Accept': 'application/json',
              'Authorization': 'Key ' + PAT
          },
          body: raw
      };

      // NOTE: MODEL_VERSION_ID is optional, you can also call prediction with the MODEL_ID only
      // https://api.clarifai.com/v2/models/{YOUR_MODEL_ID}/outputs
      // this will default to the latest version_id

//         fetch("https://api.clarifai.com/v2/models/" + MODEL_ID + "/versions/" + MODEL_VERSION_ID + "/outputs", requestOptions)
// .then(response => response.text())
// .then(result => console.log(result))
// .catch(error => console.log('error', error));
      fetch("https://api.clarifai.com/v2/models/" + MODEL_ID + "/versions/" + MODEL_VERSION_ID + "/outputs", requestOptions)
      .then(response => response.text()) // Read the response as text
  .then(result => {
      console.log(result); // Log the raw response
      return JSON.parse(result); // Parse the raw response as JSON
  })
          .then(result => {
              try {
                  // Process the result
                  if (result.outputs && result.outputs.length > 0) {
                      const concepts = result.outputs[0].data.concepts;
                      const toxicConcept = concepts.find(concept => concept.name === 'toxic');
                      if (toxicConcept && toxicConcept.value >= 0.01) {
                    	  errorName.innerText = "Câu không phù hợp";
                    	  input.value = '';
                      } else {
                    	  errorName.innerText = "*";
                      }
                  } else {
                	  errorName.innerText = "Không có dữ liệu phản hồi.";
                  }
              } catch (error) {
                  
              }
          })
          .catch(error => {
              
          });
  }
</script>
</body>

</html>	
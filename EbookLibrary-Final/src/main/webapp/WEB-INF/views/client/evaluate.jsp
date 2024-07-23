<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đánh giá</title>
<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/toxicity"></script>

</head>
<body>
	<link rel="stylesheet" href="/assets/css/evaluate.css">
	<script type="text/javascript" src="/assets/js/evaluate.js"></script>
	<main class="container" style="margin: 0px; max-width: 2000px;">
		<form action="/user/evaluate/gui" method="post"
			enctype="multipart/form-data">
			<div class="row card-header1">
				<div class=" headerTrangThai" style="background-color: white;">
					<div>
						<a class="tenNguoiBan" href="/user/bill"> <img width="30"
							height="30" src="https://img.icons8.com/ios/50/back--v1.png"
							alt="back--v1" alt="left-squared" /> Quay lại
						</a>
					</div>
					<div class="">
						<c:choose>
							<c:when test="${empty evalue}">
								<button type="submit" class="btn btn-danger trangThai"
									style="width: 90px">Gửi</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-danger trangThai"
									style="width: 90px; display: none;">Gửi</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<input type="hidden" value="${idPro}" name="idPro">
			<div class="container-info-sanpham">
				<div class="form-info-sanpham row">
					<div class="info col-md-12">
						<div class="rating-container">
							<p id="" class="rating-text1">Chất lượng sản phẩm:</p>
							<span class="star  ${evalue.star >= 1 ? "
								selected" : "" }"  data-value="1"><i
								class="fa-solid fa-star"></i></span> <span
								class="star ${evalue.star >= 2 ? "
								selected" : "" }" data-value="2"><i
								class="fa-solid fa-star"></i></span> <span
								class="star ${evalue.star >= 3 ? "
								selected" : "" }" data-value="3"><i
								class="fa-solid fa-star"></i></span> <span
								class="star ${evalue.star >= 4 ? "
								selected" : "" }" data-value="4"><i
								class="fa-solid fa-star"></i></span> <span
								class="star ${evalue.star >= 5 ? "
								selected" : "" }" data-value="5"><i
								class="fa-solid fa-star"></i></span>
							<p id="rating-text" class="rating-text2"></p>
							<input id="rating-value" type="hidden" name="starDescription"
								value="0">
						</div>
						<div class="info col-md-12">
							<div class="card">
								<div class="card-header">
									<p>
										Đúng với thông tin sản phẩm: <span style="color: grey">để
											lại đánh giá</span>
									</p>
								</div>
								<div class="card-body">
									<c:choose>
										<c:when test="${not empty evalue.content}">
											<input name="content" class="form-control" id="" required
												value="${evalue.content}" disabled="disabled" />
										</c:when>
										<c:otherwise>
											<p id="errorContent"></p>
											<input name="content" class="form-control" id="content"
												required value="${evalue.content}" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

						<div class="info col-md-12">
							<div class="card">
								<div class="card-header">
									<p>
										Chất lượng sản phẩm: <span style="color: grey">để lại
											đánh giá</span>
									</p>
								</div>
								<div class="card-body">
									<c:choose>
										<c:when test="${not empty evalue.quality}">
											<input name="quality" class="form-control" id="quality"
												required value="${evalue.quality}" disabled="disabled" />
										</c:when>
										<c:otherwise>
											<p id="errorQuality" name="errorQuality"></p>
											<input name="quality" class="form-control" id="quality"
												required value="${evalue.quality}" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="info col-md-12 row">
							<c:choose>
								<c:when test="${not empty evalue.imageEvalues}">
									<c:forEach var="imageEvalue" items="${evalue.imageEvalues}">
										<div class="show-img-form slider">
											<div class="container-images slides">
												<div class="show-img-div">
													<div class="image">
														<img alt="Evalue Image"
															src="${pageContext.request.contextPath}/images/${imageEvalue.name}">
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<label for="" class="message" style="color: red;"></label>
									<div class="col-md-4 container-file-upload">
										<label for="file-upload" class="form-label custom-file-upload">
											<i class="fa fa-cloud-upload "></i> Đăng tải ảnh sản phẩm
										</label>
									</div>
									<div class="col-md-8 save-image">
										<div id="input-save-image">
											<input type="file" class="form-control" id="file-upload"
												name="images" multiple
												accept="image/png, image/jpeg, imgae/jpg" />
										</div>
										<div class="show-img-form slider">
											<div class="container-images slides">
												<div class="show-img-div">
													<div></div>
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			</div>
		</form>
	</main>

	<!-- Bootstrap JavaScript Libraries -->
	<!-- Modal -->
	<div class="modal fade" id="btnSeacrh" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<input class="form-control me-2 search" type="search"
						placeholder="Search" aria-label="Search">

				</div>
				<div class="modal-body">...</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="successModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Thông báo</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Gửi đánh giá thành công!</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="/assets/js/evaluate.js">
		
	</script>

</body>
</html>
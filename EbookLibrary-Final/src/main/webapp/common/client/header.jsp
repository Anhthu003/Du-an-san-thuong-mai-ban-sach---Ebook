<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  --%>
<header class="container  sticky-top">
	<style>
.mic-search:hover {
	cursor: pointer;
	background-color: rgba(128, 128, 128, 0.299);
}

#closeIcon {
	position: fixed;
	right: 10px;
	top: 10px;
	height: 50px;
	width: 50px;
}

#closeIcon>h1 {
	cursor: pointer;
}

.mic-search {
	border-radius: 50%;
	background-color: rgba(128, 128, 128, 0.129);
}

.model-record {
	position: absolute;
	width: 100%;
	top: 0px;
	right: 0px;
	left: 0px;
	height: 200px;
	z-index: 9999;
	background-color: white;
	box-shadow: 2px 2px 2px 2px gray;
}

.container-record {
	margin: 0px;
}

.textSpeak {
	margin-top: 20px;
	width: 500px;
	/* background-color: #808080; */
	text-align: left;
	font-size: 2rem;
	padding-right: 30px;
}

.record-button {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	position: relative;
	cursor: pointer;
}

.record-button::before {
	content: '';
	width: 120px;
	height: 120px;
	border: 10px solid gray;
	border-radius: 50%;
	position: absolute;
	top: -35px;
	left: -35px;
	animation: pulse 1.5s infinite;
}

.record-button .fa-microphone {
	color: red;
	font-size: 50px;
	z-index: 1;
}

.record-button.stopped {
	background-color: white;
	border: 1px solid gray;
	padding: 50px;
}

.record-button.stopped::before {
	display: none;
	padding: 50px;
}

.record-button.stopped .fa-microphone {
	color: red;
}

@
keyframes pulse { 0% {
	transform: scale(0.9);
	opacity: 1;
}

70










%
{
transform










:










scale








(










1










)








;
opacity










:










0








.7








;
}
100










%
{
transform










:










scale








(










0








.9










)








;
opacity










:










1








;
}
}
.close-icon {
	position: absolute;
	top: 20px;
	right: 20px;
	font-size: 24px;
}

.close-icon a:hover {
	color: #000;
}

.close-icon a {
	font-size: 2rem;
	text-decoration: none;
	color: #888;
}
</style>

	<div class="page-content rounded-2 "
		style="padding-top: 0px; padding-bottom: 0px;">
		<nav class="navbar navbar-expand-lg" id="navbar">
			<div
				class="collapse navbar-collapse row d-flex justify-content-center"
				id="navbarScroll">
				<a class="col-md-1" aria-current="page"
					href="/Ebook/user/buyBookHome"> <img
					src="/assets/img/logo/V.jpg" alt="" width="70%" height="70%">
				</a>
				<div class="col-md-5">
					<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
						style="--bs-scroll-height: 100px;">

						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="/user/home"> Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="/user/fillList/new"> Mua sách</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="/user/favorite"> Yêu Thích</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<form class="search d-flex" role="search" method="get"
						action="/user/home">
						<input class="form-control me-2" type="search" name="searchName"
							placeholder="Search" aria-label="Search"
							onblur="this.form.submit()">
						<div class="mic-search " id="open-record">
							<i class="fa-solid fa-microphone"
								style="font-size: 15px; margin: 10px; margin-left: 13px; margin-right: 13px"></i>
						</div>


						<div class="cart-icon position-relative">
							<a href="/user/shoppingcart"> <i class="bi bi-bag-check-fill"
								style="font-size: 27px; position: fixed; margin-left: 20px; color: green; top 0px; right: 0px; z-index: 999; position: relative;"></i></a>
							<span
								class="position-absolute top-200 start-10 translate-middle badge rounded-pill bg-danger">
								${listCarts.size()}+<span class="visually-hidden"></span>
							</span>
						</div>

					</form>

				</div>
				<div class="col-md-2">
					<ul style="margin: 0px">
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
								class="fa-solid fa-user" style="color: green;"></i> <c:if
									test="${account.username!=null}">${account.username}</c:if> <c:if
									test="${account.username==null}">Tài khoản</c:if>
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/user/changepass">Đổi
										mật khẩu</a></li>
								<li><a class="dropdown-item" href="/user/updateProfile">Cập
										nhật tài khoản</a></li>

								<li><a class="dropdown-item"
									href="/user/registerSell/registerSell01">Đăng ký bán sách</a></li>
								<!-- <hr> -->
								<li><a class="dropdown-item" href="/out">Đăng xuất</a></li>
								<%-- 		<c:if test="${roleDetailOptional!=null}"></c:if>		 --%>

								<c:forEach var="roleDetailOptional"
									items="${roleDetailOptional}">
									<li style="color: blue;"><a
										href="/${roleDetailOptional.role.name}/home"
										class="dropdown-item"> ${roleDetailOptional.role.name}</a></li>
								</c:forEach>



							</ul>
						</div>
					</ul>
				</div>
			</div>
	</div>
	<!-- </div> -->

	</nav>
	</div>
</header>
<div class="model-record" style="display: none;">
	<div id="content" class="container-record">
		<button id="btnTalk" hidden></button>
		<form action="/user/searchbuybook" method="get">
			<div class="container mt-5">
				<div class="d-flex justify-content-center ">

					<div class="close-icon" id="closeIcon">
						<h1>&times;</h1>
					</div>
					<div class="textSpeak text-center me-5">
						<p id="message">Đang nghe...</p>
						<a id="recordButton2" class="text-primary"
							style="cursor: pointer;">Thử lại</a>
					</div>

					<div class="record-button" id="recordButton">
						<i class="fas fa-microphone"></i>
					</div>
					<div class="textSpeak text-center me-5">
						<p id="message">Ebook Library</p>
					</div>
					<input type="text" id="searchName" name="searchName" value="Web"
						hidden>
					<button id="btnPOST" hidden></button>

				</div>
			</div>
		</form>
	</div>
</div>
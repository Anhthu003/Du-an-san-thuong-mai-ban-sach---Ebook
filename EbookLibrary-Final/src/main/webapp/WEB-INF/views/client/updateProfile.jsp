<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateProfile</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />

</head>
<body>
<link rel="stylesheet" href="/assets/css/updateProfile.css">
<%-- 	<%@include file="/common/client/header.jsp"%>  --%>
	<main class="container" style="margin: 0px; max-width: 2000px;">
		<div class="row">
			<article class="col-md-2">
				<nav class="vertical-menu">
					<div class="menu-item">
						<a class="text-nav" href="javascript:void(0);"
							onclick="toggleSubmenu()">Thông Tin Cá Nhân</a>
						<div class="submenu">
							<a class=" activeMenuCon" href="/Ebook/account/updateProfile">Xem
								Hồ Sơ</a> <a class="text-subnav" href="/Ebook/account/banks">Ngân
								Hàng</a>
						</div>
					</div>
					<a class="text-nav" href="/Ebook/account/bill">Đơn Hàng</a>
				</nav>
			</article>
			<aside class="col-md-10 row">
				<article class="col-md-8">
					<div class="title">
						<p>Hồ sơ của tôi</p>
						<p style="font-size: 1rem; padding: 0px; margin: 0px;"
							class="text-secondary">Quản lý thông tin hồ sơ để bảo mật tài
							khoản</p>
						<hr>
					</div>
					<div class="body">
						<form action="/user/updateProfile" method="post" enctype="multipart/form-data">

							<div class="form-group mb-3">
								<label for="tenShop" class="form-label">Tên shop</label> <input
									type="text" class="form-control" id="tenShop" name="shopName"
									value="${account.shopName}" required>

								<div class="form-text text-danger">${error }</div>
								<input type="hidden" class="form-control" id="" name="id"
									value="${account.id}">
							</div>
							<div class="form-group row g-3">
								<div class="col">
									<label for="username" class="form-label">Username</label> <input
										type="text" class="form-control" id="username"
										value="${account.username}" name="username" required>
								</div>
								<div class="col">
									<label for="password" class="form-label">Password</label> <input
										type="password" class="form-control" id="password" readonly
										value="${account.password}" name="password" disabled="disabled">
								</div>
							</div>
							<div class="form-group row g-3">
								<div class="col">
									<label for="fullname" class="form-label">Họ và tên</label> <input
										type="text" class="form-control" id="fullname"
										value="${account.fullname}" name="fullname" required>
								</div>
								<div class="col">
									<label for="email" class="form-label">Email</label> <input
										type="email" class="form-control" id="email"
										value="${account.email}" name="email" required>
										<span class="text-danger">${errorMail}</span>
								</div>
							</div>
							<div class=" form-group row g-3">
								<div class="col">
									<label for="birthday" class="form-label">Ngày sinh</label> <input
										type="date" class="form-control" id="birthday"
										value="${account.birthday}" name="birthday" required>
								</div>
								<div class="col">
									<label for="sdt" class="form-label">Số điện thoại</label> <input
										type="text" class="form-control" id="sdt"
										value="${account.phone}" name="phone" required>
								</div>
							</div>

							<span class="span">${error}</span>
							<div class="form-group md-3 d-flex justify-content-center">
								<button style="width: 100px;"
									class="register btn btn-outline-success" id='submitbtn'
									type="submit">Lưu</button>
							</div>
					</div>
				</article>
				<aside class="col-md-4">
					<div class="showImgBia">
						<img id="displayedBia" src="/assets/img/background/${account.background}">

					</div>
					<div class="showImgAvt">
						<img id="displayeAvt" src="/assets/img/account/${account.avatar}">
					</div>
					<div class="title-TenShop">
						<p>${account.shopName}</p>
					</div>
					
					<div class="uploadImg">
						<div class="form-group row g-3">
							<div class="col">
								<label for="ImgAvt" class="form-label">Ảnh đại diện</label> <input
									type="file" class="form-control" id="ImgAvt" name="avatar"
									value="${account.avatar}">
							</div>
							<div class="col">
								<label for="ImgBia" class="form-label">Ảnh bìa</label> <input
									type="file" class="form-control" id="ImgBia" name="background"
									value="${account.background}">
							</div>
						</div>
					</div>
				</aside>
			</aside>
			</form>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
		
		
	<script type="text/javascript">   
	
	const container = document.getElementById('container');
	const btnSubmit = document.getElementById('submitbtn');


	
   // ngăn submit
	btnSubmit.addEventListener('click', () => {
	    container.classList.add("active");
	});
   
	/* loginBtn.addEventListener('click', () => {
	    container.classList.remove("active");
	}); */

	/* forgotPassBtn.addEventListener('click', () => {
	    container.classList.add("show-forgot-password");
	});
	loginBtn.addEventListener('click', () => {
	    container.classList.remove("show-forgot-password");
	}); */
		
 		const profileForm = document.querySelector('.profileForm form');
 	    const errorSpan = document.getElementById('span');
 	

 	    // Thêm sự kiện submit cho form update profile
 	    //profileForm.addEventListener('submit', function (event) {
 	 
 	    	function validateForm() {
 	    	
 	    	//Lấy tất cả các giá trị từ form cập nhật hồ sơ
 	    	
 	   		const shopName = document.getElementById('tenshop').value
 	       
 	      const userName = document.getElementById('userName').value;
 	   
          const name = document.getElementById('fullName').value;
          const password = document.getElementById('password').value
          const email = document.getElementById('email').value
          const birthday = document.getElementById('birthday').value
          const numberphone = document.getElementById('sdt').value
          const ImgAvt = document.getElementById('ImgAvt').value
          const ImgBia = document.getElementById('ImgBia').value
 	        // Xóa thông báo lỗi trước khi kiểm tra
 	        errorSpan.textContent = '';
              
			 // Kiểm tra email hợp lệ
			 const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			 if (!emailPattern.test(email)) {
			     errorSpan.textContent = 'Email không hợp lệ.';
			     //event.preventDefault(); // Ngăn chặn việc submit form
			    
			 }
			 
			 // Kiem tra so dien thoai
			 
			const phonePattern = /^(?:\+84-?|0)(?:\d{2,3}-?)?\d{3}-?\d{4}$/
				
				if (!numberphone.match(birthdayPattern)) {
					  errorSpan.textContent = 'Số điện thoại không đúng định dạng';
					  //event.preventDefault(); // Ngăn chặn việc submit form
					 
				}
					
					
			// Kiem tra ngay sinh dinh dang (dd-mm-yyyy)
			
			const birthdayPattern = /^\d{2}-\d{2}-\d{4}$/
				
			// Kiem tra ngay sinh co dung voi dinh dang
			
			if (!birthday.match(birthdayPattern)) {
				  errorSpan.textContent = 'Ngày sinh không đúng định dang (dd-MM-yyyy)';
				  event.preventDefault(); // Ngăn chặn việc submit form
				
			}
			
			// Kiểm tra file co duoc chon hay khong
			
			var fileBia = ImgBia.files[0]
			var fileAvart = ImgAvt.files[0]
			
			if (!(fileBia || fileAvart)) {
 	    	errorSpan.textContent = 'Vui long chon file';
			  //event.preventDefault(); // Ngăn chặn việc submit form
	
 	   		 }
			
			if (errorSpan != "") 
				return false
 	    
 	   		// kiem tra file .jpg .png .
			
				return true;
			}
			
			
   </script>
</body>
</html>
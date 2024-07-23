<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/assets/css/login.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

</head>
<body>
	<div class="container" id="container">
		<div class="form-container sign-up">
			<form action="/register" method="post">
				<h1>Đăng Ký</h1>
				<div class="social-icons">
					<a href="#" class="icon"><i class='bx bxl-facebook'></i></a> <a
						href="#" class="icon"><i class='bx bxl-google'></i></a> <a
						href="#" class="icon"><i class='bx bxl-linkedin'></i></a> <a
						href="#" class="icon"><i class='bx bxl-github'></i></a>
				</div>
				<div class="password-container">
					<input id="fullName" type="text" name="fullName"
						placeholder="Họ và tên"> <input type="email" name="gmail"
						placeholder="Email"> <input id="userName" type="text"
						name="userName" placeholder="Tên Đăng Nhập"> <input
						type="password" name="password" placeholder="Mật Khẩu"
						id="password1"> <i class='itogglePassword3 bx bx-show-alt'
						id="togglePassword3" style="cursor: pointer;"></i> <span
						style="color: red;">${errorR}</span>
				</div>
				<button>Đăng Ký</button>
			</form>
		</div>
		<div class="form-container sign-in">
			<form action="login" method="post">
				<h1>Đăng Nhập</h1>
				<div class="social-icons">
					<a href="#" class="icon"><i class='bx bxl-facebook'></i></a> <a
						href="#" class="icon"><i class='bx bxl-google'></i></a> <a
						href="#" class="icon"><i class='bx bxl-linkedin'></i></a> <a
						href="#" class="icon"><i class='bx bxl-github'></i></a>
				</div>


				<div class="password-container">
					<input type="text" name="userName" placeholder="Tên Đăng Nhập">
					<input type="password" name="password" placeholder="Mật Khẩu "
						id="password"> <i class='bx bx-show-alt'
						id="togglePassword" style="cursor: pointer;"></i>
				</div>
				<span style="color: red;">${error}</span> <a href="#" class="fp"
					id="forgotPassword">Quên mật khẩu?</a>
				<button>Xác Nhận</button>
			</form>
		</div>
		<div class="form-container forgotPassword">
			<form action="forgotpassword" method="post">
				<h1>Quên Mật Khẩu</h1>
				<div class="social-icons">
					<a href="#" class="icon"><i class='bx bxl-facebook'></i></a> <a
						href="#" class="icon"><i class='bx bxl-google'></i></a> <a
						href="#" class="icon"><i class='bx bxl-linkedin'></i></a> <a
						href="#" class="icon"><i class='bx bxl-github'></i></a>
				</div>
				<input type="email" placeholder="Email" name="email"> <span
					style="color: red;">${errorF}</span>
				<button>Xác Nhận</button>

			</form>
		</div>


		<div class="toggle-container">
			<div class="toggle">
				<div class="toggle-panel toggle-right">
					<h1>Chào mừng bạn quay trở lại!</h1>
					<p>Hãy nhập thông tin cá nhân của bạn để sử dụng tất cả các
						tính năng của trang web</p>
					<button class="hidden" id="register">Đăng Ký</button>
				</div>
				<div class="toggle-panel toggle-left">
					<h1>Xin chào!</h1>
					<p>Hãy đăng ký với thông tin cá nhân của bạn để sử dụng tất cả
						các tính năng của trang web</p>
					<button class="hidden" id="login">Đăng Nhập</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script>
	
	document.getElementById('togglePassword').addEventListener('click', function () {
	    var passwordInput = document.getElementById('password');
	    var passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
	    passwordInput.setAttribute('type', passwordType);
	    
		var passwordInput = document.getElementById('password1');
		var passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
		passwordInput.setAttribute('type', passwordType);
		
	    this.classList.toggle('bx-show-alt');
	    this.classList.toggle('bx-hide');
	});
	
	document.getElementById('togglePassword3').addEventListener('click', function () {
	   
		var passwordInput = document.getElementById('password1');
		var passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
		passwordInput.setAttribute('type', passwordType);
	    this.classList.toggle('bx-show-alt');
	    this.classList.toggle('bx-hide');
	});

	
	const container = document.getElementById('container');
	const registerBtn = document.getElementById('register');
	const loginBtn = document.getElementById('login');
	const forgotPassBtn = document.getElementById('forgotPassword');

	

	registerBtn.addEventListener('click', () => {
	    container.classList.add("active");
	});
	loginBtn.addEventListener('click', () => {
	    container.classList.remove("active");
	});

	forgotPassBtn.addEventListener('click', () => {
	    container.classList.add("show-forgot-password");
	});
	loginBtn.addEventListener('click', () => {
	    container.classList.remove("show-forgot-password");
	});

	document.addEventListener("DOMContentLoaded",function(){
		let page =  "${page}";
 		if("ft" == page.toString()){
 		    container.classList.add("show-forgot-password");
		}else if( "rg" === page.toString()){
		
			container.classList.add("active");
		}else{
		    container.classList.remove("active");  
		}
 		
 		
 		 const registerForm = document.querySelector('.sign-up form');
 	    const loginForm = document.querySelector('.sign-in form');
 	    const forgotPasswordForm = document.querySelector('.forgotPassword form');
 	    const errorSpan = document.querySelector('.sign-up span');
 	    const loginErrorSpan = document.querySelector('.sign-in span');
 	    const forgotPasswordErrorSpan = document.querySelector('.forgotPassword span');

 	    // Thêm sự kiện submit cho form Đăng Ký
 	    registerForm.addEventListener('submit', function (event) {
 	        // Lấy giá trị từ các trường input
 	        const userName = document.getElementById('userName').value;
 	        const email = document.querySelector('.sign-up input[name="gmail"]').value;
 	        const password = document.querySelector('.sign-up input[name="password"]').value;
 	       // const fullName = document.queryselector('.sign-up input[name="fullName"]').value;
           const name = document.getElementById('fullName').value;
 	        // Xóa thông báo lỗi trước khi kiểm tra
 	        errorSpan.textContent = '';
              
 	        // Kiểm tra các điều kiện
 	        
 	        if (!name.trim()) {
 	            errorSpan.textContent = 'Vui lòng nhập Tên đầy đủ.';
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	            return;
 	        }

 	        
 	        if (!userName.trim()) {
 	            errorSpan.textContent = 'Vui lòng nhập Tên Đăng Nhập.';
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	            return;
 	        }

 	        if (!email.trim()) {
 	            errorSpan.textContent = 'Vui lòng nhập Email.';
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	            return;
 	        }

 	        if (!password.trim()) {
 	            errorSpan.textContent = 'Vui lòng nhập Mật Khẩu.';
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	            return;
 	        }

 	        // Kiểm tra email hợp lệ
 	        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
 	        if (!emailPattern.test(email)) {
 	            errorSpan.textContent = 'Email không hợp lệ.';
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	            return;
 	        }

 	        // Kiểm tra mật khẩu có ít nhất 6 ký tự
 	    //    if (password.length < 6) {
 	     //       errorSpan.textContent = 'Mật khẩu phải chứa ít nhất 6 ký tự.';
 	     //       event.preventDefault(); // Ngăn chặn việc submit form
 	     //       return;
 	    //    }
 	    });

 	    // Thêm sự kiện submit cho form Đăng Nhập
 	    loginForm.addEventListener('submit', function (event) {
 	        // Lấy giá trị từ các trường input
 	        const loginUserName = document.querySelector('.sign-in input[name="userName"]').value;
 	        const loginPassword = document.querySelector('.sign-in input[name="password"]').value;

 	        // Xóa thông báo lỗi trước khi kiểm tra
 	        loginErrorSpan.textContent = '';
 	        
 	       if (!loginUserName.trim()) {
	            loginErrorSpan.textContent = 'Vui lòng nhập đầy đủ Tên Đăng Nhập và Mật Khẩu.';
	         
	            event.preventDefault(); // Ngăn chặn việc submit form
	            return;
	        }

 	        // Kiểm tra các điều kiện
 	        if (!loginUserName.trim()) {
 	            loginErrorSpan.textContent = 'Vui lòng nhập đầy đủ Tên Đăng Nhập và Mật Khẩu.';
 	        
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	           return;
 	       
 	        }
 	        
 	  
 	        
 	    });

 	    // Thêm sự kiện submit cho form Quên Mật Khẩu
 	    forgotPasswordForm.addEventListener('submit', function (event) {
 	        // Lấy giá trị từ trường input
 	        const forgotPasswordEmail = document.querySelector('.forgotPassword input[name="gmail"]').value;

 	        // Xóa thông báo lỗi trước khi kiểm tra
 	        forgotPasswordErrorSpan.textContent = '';

 	        // Kiểm tra các điều kiện
 	        if (!forgotPasswordEmail.trim()) {
 	            forgotPasswordErrorSpan.textContent = 'Vui lòng nhập Email.';
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	            return;
 	        }

 	        // Kiểm tra email hợp lệ
 	        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
 	        if (!emailPattern.test(forgotPasswordEmail)) {
 	            forgotPasswordErrorSpan.textContent = 'Email không hợp lệ.';
 	            event.preventDefault(); // Ngăn chặn việc submit form
 	            return;
 	        }
 	    });

	});
	
	</script>

</body>
</html>
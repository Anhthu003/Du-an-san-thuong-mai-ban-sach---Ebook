<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi mật khẩu</title>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>
	<link rel="stylesheet" href="/assets/css/login.css">
	<div class="container" id="container">
		<div class="form-container sign-in">
			<form action="/forgotpassword/changepassword" method="post">
				<h1>Quên Mật Khẩu</h1>
				<div class="social-icons">
					<a href="#" class="icon"><i class='bx bxl-facebook'></i></a> <a
						href="#" class="icon"><i class='bx bxl-google'></i></a> <a
						href="#" class="icon"><i class='bx bxl-linkedin'></i></a> <a
						href="#" class="icon"><i class='bx bxl-github'></i></a>
				</div>
				<p style="color: red">${error}</p>
				<input type="text" placeholder="Mã OTP" name="maOTP" value="" required>
				<input type="password" placeholder="Mật Khẩu"  name="password" value="" required>
			    <input type="password" placeholder="Xác Nhận Mật Khẩu" name="confirm" required>
				<button id="xacNhan">Xác Nhận</button>
			</form>
		</div>



		<div class="toggle-container">
			<div class="toggle">
				<div class="toggle-panel toggle-right">
					<h1>Chào mừng bạn quay trở lại!</h1>
					<p>[Lưu ý] Hãy nhập đầy đủ thông tin và chính xác nhất để bạn
						có thể truy cập và sử dụng các tính năng của trang web</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
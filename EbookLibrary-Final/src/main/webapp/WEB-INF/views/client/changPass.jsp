
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi Mật Khẩu</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style>
    .inputbox {
        position: relative;
        margin: 30px 0;
        max-width: 310px;
        border-bottom: 2px solid #fff;
    }

    .inputbox input {
        width: 100%;
        height: 60px;
        background: transparent;
        border: none;
        outline: none;
        font-size: 1rem;
        padding: 20px 35px 0px 5px;
        color: #fff;
    }

    .inputbox ion-icon {
        position: absolute;
        right: 8px;
        color: #401111;
        font-size: 1.2rem;
        top: 20px;
    }

    .inputbox i {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #401111;
        font-size: 1.2rem;
    }

    .inputbox label {
        position: absolute;
        top: 20%;
        left: 5px;
        transform: translateY(-50%);
        color: #fff;
        font-size: 1rem;
        pointer-events: none;
        transition: all 0.5s ease-in-out;
    }

    main {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        background-image: url("/assets/img/background/changpass.jpg");
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
    }

    .body {
        position: relative;
        max-width: 400px;
        background-color: transparent;
        border: 1px solid #fff;
        border-radius: 20px;
        backdrop-filter: blur(55px);
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 2rem 3rem;
    }
</style>
</head>
<body>
	<link rel="stylesheet" href="/assets/css/changPass.css">
	<main>
		<div class="body">
			<form action="/Ebook/account/changePass" method="post">
				<h1>Đổi Mật Khẩu</h1>
				<h2 style="color: white;">Chào bạn :${fullname}</h2>
				<div class="inputbox">
					<ion-icon name="mail-outline"></ion-icon>
					<input value="" name="password" type="password" required id="password">
					<label for="password">Mật khẩu cũ</label>
					<i class='bx bx-show-alt' id="togglePassword1"></i>
				</div>
				<div class="inputbox">
					<ion-icon name="passnew-outline"></ion-icon>
					<input type="password" name="repassword" required id="newPassword">
					<label for="newPassword">Mật khẩu mới</label>
					<i class='bx bx-show-alt' id="togglePassword2"></i>
				</div>
				<div class="inputbox">
					<ion-icon name="xn-outline"></ion-icon>
					<input name="re1password" type="password" required id="confirmPassword">
					<label for="confirmPassword">Xác nhận mật khẩu</label>
					<i class='bx bx-show-alt' id="togglePassword3"></i>
				</div>
				<span>${error}</span>
				<br>
				<button>Xác nhận</button>
			</form>
		</div>
	</main>
	<script>
		document.getElementById('togglePassword1').addEventListener('click', function () {
			const passwordInput = document.getElementById('password');
			const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
			passwordInput.setAttribute('type', passwordType);
			this.classList.toggle('bx-show-alt');
			this.classList.toggle('bx-hide');
		});

		document.getElementById('togglePassword2').addEventListener('click', function () {
			const passwordInput = document.getElementById('newPassword');
			const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
			passwordInput.setAttribute('type', passwordType);
			this.classList.toggle('bx-show-alt');
			this.classList.toggle('bx-hide');
		});

		document.getElementById('togglePassword3').addEventListener('click', function () {
			const passwordInput = document.getElementById('confirmPassword');
			const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
			passwordInput.setAttribute('type', passwordType);
			this.classList.toggle('bx-show-alt');
			this.classList.toggle('bx-hide');
		});
	</script>
</body>
</html>

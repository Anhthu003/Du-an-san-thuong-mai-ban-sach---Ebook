<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/assets/css/login.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<script>
	function startTimer(duration, display) {

		var timer = duration, minutes, seconds;
		setInterval(function() {
			minutes = parseInt(timer / 60, 10);
			seconds = parseInt(timer % 60, 10);

			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;

			display.textContent = minutes + ":" + seconds;

			if (--timer < 0) {
				timer = 0;
				document.getElementById("resendLink").style.display = "inline";
				document.getElementById("resender").style.display = "inline";

			}
		}, 1000);
	}

	window.onload = function() {
		var oneMinute = 60,

		display = document.querySelector('#time');
		/*   const er = document.getElementById('lo');
		  setInterval(function () {
		      er.innerHTML = "...";
		  }, 1000) */

		startTimer(oneMinute, display);
	};
</script>
</head>
<body>
	<div class="container" id="container">

		<div class="form-container sign-in">
			<form action="/xacnhan" method="post">
				<h1>Xác nhận otp</h1>
				<input type="text" placeholder="nhập otp" name="otp">

				<p>
					Thời gian: <span id="time">01:00</span>
				</p>
				<span id="lo">${error}</span>
				<h1 id="resender" style="display: none;">Hết hạn OTP</h1>
				<a id="resendLink" href="/resendOtp/${gmail}" style="display: none;">Gửi
					lại </a>

				<button>xác nhận</button>


			</form>
		</div>


		<div class="toggle-container">
			<div class="toggle">
				<div class="toggle-panel toggle-right">
					<h1>Chào mừng bạn quay trở lại!</h1>
					<p>Hãy nhập otp và xác nhập</p>
					<h3>vui long kiểm tra mail: ${gmail}</h3>
				</div>

			</div>
		</div>
	</div>
	<script src="/views/js/login.js"></script>

</body>
</html>
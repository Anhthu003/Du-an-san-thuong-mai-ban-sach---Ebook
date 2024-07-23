<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<style>
.containerse {
	background: white;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	max-width: 500px;
	width: 90%;
}

.success-icon {
	margin-bottom: 20px;
}

h1 {
	color: green;
	margin-bottom: 20px;
}

p {
	color: #333;
	margin-bottom: 20px;
}

.transaction-summary {
	background: #f9f9f9;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 20px;
	text-align: left;
}

.transaction-summary h2 {
	margin-top: 0;
}

.transaction-summary p {
	margin: 5px 0;
}

.button {
	display: inline-block;
	margin: 10px 5px;
	padding: 10px 20px;
	background: #3498db;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	transition: background 0.3s ease;
}

.button:hover {
	background: #2980b9;
}
</style>

	<center style="margin-top: 50px; margin-bottom: 50px">
		<div class="containerse">
			<div class="success-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
					fill="green" class="bi bi-check-circle" viewBox="0 0 16 16">
                <path
						d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm3.47-8.12a.75.75 0 0 1 1.06 1.06l-4 4a.75.75 0 0 1-1.06 0l-2-2a.75.75 0 1 1 1.06-1.06L8 10.94l3.47-3.47z" />
            </svg>
			</div>
			<h1>Thanh Toán Thành Công</h1>
			<p>Cảm ơn bạn đã thanh toán. Giao dịch của bạn đã được hoàn tất.</p>
			<div class="transaction-summary">
				<!-- 	<h2>Transaction Summary</h2> -->
				<p>
					<strong>Mã giao dịch:</strong>${transactionId}
				</p>
				<p>
					<strong>Số tiền:</strong> ${totalPrice} VND
				</p>
				<p>
					<strong>Ngày:</strong> <span id = "date"></span>
				</p>
				<p>
					<strong>Nội dung giao dịch:</strong> ${orderId}
				</p>
			</div>
			<a href="/user/home" class="button">Về trang chủ</a>
		</div>
	</center>
	 <script>

    document.addEventListener("DOMContentLoaded", function() {
     
      var span = document.getElementById("date");
      var dateTimeString = `${paymentTime}`; // PHP code to embed the payment time
     
      //Cắt chuỗi thành các thành phần
      const year = dateTimeString.slice(0, 4);
      const month = dateTimeString.slice(4, 6);
      const day = dateTimeString.slice(6, 8);
      const hour = dateTimeString.slice(8, 10);
      const minute = dateTimeString.slice(10, 12);
      const second = dateTimeString.slice(12, 14);
      const formattedDateTime = day +"/" + month +"/" +year + " - "+hour+":"+minute+":"+second;
      span.innerHTML = formattedDateTime;
      console.log(formattedDateTime)


    });
  </script>
</body>

</html>
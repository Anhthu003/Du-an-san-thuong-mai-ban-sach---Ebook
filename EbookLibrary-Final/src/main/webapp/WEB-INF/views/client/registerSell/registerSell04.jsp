<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
<link rel="stylesheet" href="/assets/css/registerSell/registerSell04.css">
</head>
<body>
<div class="nav">
        <div class="logo">
            <div class="image">
                <img src="/assets/img/logo/V.jpg" alt="">
            </div>
            <div class="logo1">
                <a href="#">Virtual Library Web</a>
            </div>
        </div>
        <div class="avatar">
            <div class="container-avatar">
                <img src="/assets/img/books/Truyen/NhanGianKhuc.jpg" alt="">
                <p class="username">TeoNV</p>
            </div>
        </div>
    </div>

    <main class="container">
        <div class="container-steps">
            <div class="step1">
                <div class="step-dot">
                    <span class="dot"></span>
                </div>
                <div class="step-content">Thông tin shop</div>
                <div class="step-tail">
                    <div class="tail"></div>
                </div>
            </div>
            <div class="step2">
                <div class="step-dot">
                    <span class="dot"></span>
                </div>
                <div class="step-content">Thông tin thuế</div>
                <div class="step-tail">
                    <div class="tail"></div>
                </div>
            </div>
            <div class="step3">
                <div class="step-dot">
                    <span class="dot"></span>
                </div>
                <div class="step-content">Thông tin định danh</div>
                <div class="step-tail">
                    <div class="tail"></div>
                </div>
            </div>
            <div class="step4">
                <div class="step-dot">
                    <span class="dot"></span>
                </div>
                <div class="step-content">Hoàn tất</div>
                <div class="step-tail">
                    <div class="tail-end"></div>
                </div>
            </div>
        </div>
        <div class="container-form">
    <div class="container-thongbao-choduyet">
        <div class="thongbao">
            <div class="thongbao-icon">
                <img src="/img/icon/info-circle-svgrepo-com-orange.png" alt="Thông báo">
            </div>
            <div class="thongbao-content">
                <span>Đợi xét duyệt. Quay trở lại trang chủ</span>
            </div>
        </div>
    </div>
</div>
<form action="">
    <div class="md-2 form-btn">
        <a href="/Ebook/user/registerSell/edit/registerSell03/${account.id}" class="btn btn-quaylai">Quay lại</a>
        <a href="/Ebook/user/buyBookHome" class="btn btn-success btn-trangchu">Trang chủ</a>
    </div>
</form>

	</main>
</body>
</html>
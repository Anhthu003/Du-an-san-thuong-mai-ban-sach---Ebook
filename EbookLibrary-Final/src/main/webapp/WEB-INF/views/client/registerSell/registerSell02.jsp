<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
<link rel="stylesheet" href="/assets/css/registerSell/registerSell02.css">
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
                <div class="step-content">Chờ xác nhận</div>
                <div class="step-tail">
                    <div class="tail"></div>
                </div>
            </div>
            <div class="step5">
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
            <div class="container-thongbao">
                <div class="thongbao">
                    <div class="thongbao-icon">
                        <img src="/assets/img/icon/info-circle-svgrepo-com.png" alt="">
                    </div>
                    <div class="thongbao-content">
                        <span>Việc thu thập Thông Tin Thuế và Thông Tin Định Danh là bắt buộc theo quy định của Luật an
                            ninh mạng, Thương mại điện tử và Thuế của Việt Nam. Thông Tin Thuế và Thông Tin Định Danh sẽ
                            được bảo vệ theo chính sách bảo mật của Shopee. Người bán hoàn toàn chịu trách nhiệm về tính
                            chính xác của thông tin.</span>
                    </div>
                </div>
            </div>
        <form class="row" action="/Ebook/user/registerSell/edit/registerSell02/${account.id}" method="post">
  <div class="md-12 form-radio">
    <label for="loaihinh-kinhdoanh-shop" class="label-control">
      <span style="color: red;">*</span> Loại hình
    </label>
    <input type="hidden" name="id" class="form-control" value="${account.id }">
         <input type="hidden" name="avatar" value="${account.avatar}" class="form-control">
     <input type="hidden" name="background" value="${account.background}" class="form-control">
     <input type="hidden" name="username" value="${account.username}" class="form-control">
     <input type="hidden" name="password" value="${account.password}" class="form-control">
        
     <input type="hidden" name="phone" value="${account.phone}" class="form-control">
          <input type="hidden" name="shopName" value="${account.shopName}" class="form-control">
    <div class="radios">
      <div>
        <input type="radio" name="businessType" value="Cá nhân" required> Cá nhân
      </div>
      <div>
        <input type="radio" name="businessType" value="Hộ kinh doanh" required> Hộ kinh doanh
      </div>
      <div>
        <input type="radio" name="businessType" value="Công ty" required> Công ty
      </div>
    </div>
  </div>
  <div class="md-12 form">
    <label for="diachidk-shop" class="label-control">
      <span style="color: red;">*</span> Địa chỉ đăng ký kinh doanh
    </label>
    <input type="text" id="diachidk-shop" class="form-control" name="addresses[1].fullNameAddress" required value="${account.addresses[0].fullNameAddress}">
  </div>
  <div class="md-12 form">
    <label for="hoadon-shop" class="label-control">
      <span style="color: red;">*</span> Email nhận hóa đơn điện tử
    </label>
    <input type="email" id="hoadon-shop" class="form-control" name="email" required value="${account.email}">
  </div>
  <div class="md-12 form">
    <label for="thue-shop" class="label-control">
      <span style="color: red;">*</span> Mã số thuế
    </label>
    <input type="text" id="thue-shop" class="form-control" name="taxCode" required value="${taxCode}">
  </div>
  <hr>
  <div class="md-2 form-btn">
    <a href="/Ebook/user/registerSell/edit/${account.id}" class="btn btn-quaylai">Quay lại</a>
    <button type="submit" class="btn btn-success btn-tieptheo">Tiếp theo</button>
  </div>
</form>
</form>
        </div>
    </main>
</body>
</html>
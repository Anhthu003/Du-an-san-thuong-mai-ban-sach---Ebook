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
<link rel="stylesheet" href="/assets/css/registerSell/registerSell03.css">
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
                        <img src="/img/icon/info-circle-svgrepo-com.png" alt="">
                    </div>
                    <div class="thongbao-content">
                        <span>Vui lòng cung cấp Thông Tin Định Danh của Chủ Shop (nếu là cá nhân), hoặc Người Đại Diện
                            Pháp Lý trên giấy đăng ký kinh doanh.</span>
                    </div>
                </div>
            </div>
        <form class="row"  action="/Ebook/user/registerSell/edit/registerSellStep4/${account.id}" method="post" enctype="multipart/form-data">
  <div class="md-12 form-radio">
    <label for="giayto" class="label-control">
      <span style="color: red;">*</span> Hình thức định danh
    </label>
    <div class="radios">
      <div>
        <input type="radio" name="identityType" value="CCCD" required> Căn cước công dân (CCCD)
      </div>
      <div>
        <input type="radio" name="identityType" value="CMND" required> Chứng minh nhân dân (CMND)
      </div>
      <div>
        <input type="radio" name="identityType" value="Hộ chiếu" required> Hộ chiếu
      </div>
    </div>
  </div>
  <div class="md-12 form">
    <label for="so-shop" class="label-control">
      <span style="color: red;">*</span> Số CCCD/CMND/Hộ chiếu
    </label>
    <input type="hidden" name="id" value="${account.id}" class="form-control">
    <input type="text" id="so-shop" name="numberCitizenIdentification" value="${account.numberCitizenIdentification}" class="form-control" readonly>
  </div>
  <div class="md-12 form">
    <label for="hoten-shop" class="label-control">
      <span style="color: red;">*</span> Họ & Tên
    </label>
    <input type="text" id="hoten-shop" name="fullname" class="form-control" value="${account.fullname}" readonly>
  </div>
  <div class="md-12 form">
    <label for="anhchup-shop" class="label-control">
      Ảnh chụp mặt trước của thẻ CMND/CCCD  <span style="color: red;" id="error1">*</span>
    </label>
    <input type="file" id="fileInput1" name="" class="form-control" onchange="uploadImage1()" required>
         </div>
  <div class="md-12 form">
    <label for="anhchup-selfie" class="label-control" required>
      Ảnh chụp mặt sau của thẻ CMND/CCCD  <span style="color: red;" id="error2">*</span>
    </label>
    <input type="file" id="fileInput2" name="" class="form-control" onchange="uploadImage2()" required>
  </div>
  <input type="hidden" name="avatar" value="${account.avatar}" class="form-control">
     <input type="hidden" name="background" value="${account.background}"  class="form-control">
             <input type="hidden" name="phone" value="${account.phone}" class="form-control">
     <input type="hidden" name="phone" value="${account.phone}" class="form-control">
     <input type="hidden" name="username" value="${account.username}"class="form-control">
          <input type="hidden" name="email" value="${account.email}"class="form-control">
     <input type="hidden" name="password"  value="${account.password}"class="form-control">
          <input type="hidden" name="shopName"value="${account.shopName}"class="form-control">
  <hr>
  <div class="md-2 form-btn">
    <a href="/Ebook/user/registerSell/edit/registerSell02/${account.id}" class="btn btn-quaylai">Quay lại</a>
    <button type="submit" class="btn btn-success btn-tieptheo" >Tiếp theo</button>
  </div>
</form>
        </div>
    </main>
    <script>
      var fullname = document.getElementById('hoten-shop');
      var cardId = document.getElementById('so-shop');
      var btnXacNhan = document.getElementById('btnXacNhan');
      var idMatSau;

      
        function uploadImage1() {
            var fileInput = document.getElementById('fileInput1');
            var file = fileInput.files[0];

            var formData = new FormData();
            formData.append('image', file);

            var apiKey = 'avdx8CNfD4kdcSAfI8gTKc2BJq4Z32Uw'; 
            var url = 'https://api.fpt.ai/vision/idr/vnm/';

            fetch(url, {
                method: 'POST',
                headers: {
                    'api-key': apiKey
                },
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                // Xử lý dữ liệu trả về ở đây
                console.log(data);
                
                if(data.errorMessage =="" && data.data[0].id != undefined){
                  fullname.value =data.data[0].name;
                  cardId.value = data.data[0].id;
                }
                if(data.errorMessage !=""){
                document.getElementById("error1").innerHTML = "Ảnh không hợp lệ. Vui lòng chọn ảnh mặt trước CCCD/CMND";
              }else{
                document.getElementById("error1").innerHTML = "*";
              }
              if(data.data[0].id == undefined){
                document.getElementById("error1").innerHTML = "Vui lòng chọn ảnh mặt trước CCCD/CMND";
              }else{
                document.getElementById("error1").innerHTML = "*";
              }

                
            })
            .catch(error => {
                console.error('There was an error!', error);
            });
            checkCCCD();
        }
        function uploadImage2() {
            var fileInput = document.getElementById('fileInput2');
            var file = fileInput.files[0];

            var formData = new FormData();
            formData.append('image', file);

            var apiKey = 'avdx8CNfD4kdcSAfI8gTKc2BJq4Z32Uw';
            var url = 'https://api.fpt.ai/vision/idr/vnm/';

            fetch(url, {
                method: 'POST',
                headers: {
                    'api-key': apiKey
                },
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                // Xử lý dữ liệu trả về ở đây
                console.log(data);
                
                if(data.errorMessage =="" && data.data[0].id == undefined){
                idMatSau = data.data[0].mrz_details.cardId;
              }
              if(data.errorMessage !=""){
                document.getElementById("error2").innerHTML = "Ảnh không hợp lệ. Vui lòng chọn ảnh mặt sau CCCD/CMND";
              }else{
                document.getElementById("error2").innerHTML = "*";
              }
              if(data.data[0].id != undefined){
                document.getElementById("error2").innerHTML = "Vui lòng chọn ảnh mặt sau CCCD/CMND";
              }else{
                document.getElementById("error2").innerHTML = "*";
              }
                
            })
            .catch(error => {
                console.error('There was an error!', error);
                
            });
            checkCCCD();
        }

        function checkCCCD(){
          if(cardId.value != idMatSau){
            document.getElementById("error2").innerHTML = "Ảnh không khớp với mặt trước";
            btnXacNhan.disabled = true;
          }else{
            document.getElementById("error2").innerHTML = "*";
            btnXacNhan.disabled = false;
          }
        }
    </script>
</body>
</html>
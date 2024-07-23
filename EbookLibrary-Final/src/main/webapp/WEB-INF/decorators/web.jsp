<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Ebook Library</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="/assets/css/home.css">
</head>
<style>
.card-body>.card-title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.pageIndex{
 height: 40px;
}
/*  load page*/
        .preloader {
            position: fixed;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            /* background: #fff; */
            z-index: 99999999;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .door {
            position: absolute;
            top: 0;
            bottom: 0;
            width: 50%;
            background: black;
            transition: transform 1s ease-in-out;
        }

        .left-door {
            left: 0;
            transform-origin: left;
        }

        .right-door {
            right: 0;
            transform-origin: right;
        }

        .spinner {
            border: 8px solid #f3f3f3;
            border-top: 8px solid #34a725;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            animation: spin 0.5s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

</style>


<body>

	<div class="preloader">
		<div class="door left-door"></div>
		<div class="door right-door"></div>
		<div class="spinner"></div>
	</div>

	<div class="main-content">
		<%@include file="/common/client/header.jsp"%>
		<div>
			<sitemesh:write property='body' />
		</div>
		<%@include file="/common/client/footer.jsp"%>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							document.querySelector('.preloader').hidden = false;
							
							document.querySelector('.spinner').style.display = 'block';

							setTimeout(
									function() {
										document.querySelector('.spinner').style.display = 'none';
										
										document.querySelector('.left-door').style.transform = 'translateX(-100%)';
										document.querySelector('.right-door').style.transform = 'translateX(100%)';
										  document.querySelector('.main-content').style.display = 'block';
										  document.querySelector('.preloader').hidden = true;
										  

									}, 2000);
							 document.getElementById("closeIcon").addEventListener('click', function () {
							        document.querySelector(".model-record").style.display = 'none';
							    });
							    document.getElementById("open-record").addEventListener("click", function () {
							        document.querySelector(".model-record").style.display = 'block';
							        var message = document.querySelector('#message');
							        var recordButton = document.getElementById('recordButton');
							        var recordButton2 = document.getElementById('recordButton2');
							        var btnPOST = document.getElementById('btnPOST');
							        var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
							        var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;
							        var grammar = '#JSGF V1.0;';

							        var recognition = new SpeechRecognition();
							        var speechRecognitionList = new SpeechGrammarList();
							        speechRecognitionList.addFromString(grammar, 1);
							        recognition.grammars = speechRecognitionList;
							        recognition.lang = 'vi-VN';
							        recognition.interimResults = false;

							        recognition.onresult = function (event) {
							            var lastResult = event.results.length - 1;
							            var content = event.results[lastResult][0].transcript;
							            message.textContent = content + '.';
							            document.getElementById("searchName").value = content;
							            recordButton2.hidden = true;
							        };

							        recognition.onspeechend = function () {
							            if (message.textContent === 'Đang nghe...') {
							                message.textContent = 'Không nghe rỏ, vui lòng nói lại.';
							            } else {
							                setTimeout(function(){
							                    btnPOST.click();
							                },1000);
							            }
							            recognition.stop();
							            recordButton.classList.remove('recording');
							            recordButton.classList.add('stopped');
							            recordButton2.hidden = false;
							        };

							        recognition.onerror = function (event) {
							            message.textContent = 'Không nghe được: ';
							            recordButton.classList.remove('recording');
							            recordButton.classList.add('stopped');
							            recordButton2.hidden = false;
							        };

							        document.querySelector('#btnTalk').addEventListener('click', function () {
							            recognition.start();
							            recordButton2.hidden = true;
							            message.textContent = 'Đang nghe...';
							        });
							        recordButton2.addEventListener('click', function () {
							            if (recordButton.classList.contains('recording')) {
							                recognition.stop();
							            } else {
							                recognition.start();
							                recordButton.classList.remove('stopped');
							                recordButton2.hidden = true;
							                message.textContent = 'Đang nghe...';
							            }
							            recordButton.classList.toggle('recording');
							        })

							        recordButton.addEventListener('click', function () {
							            if (recordButton.classList.contains('recording')) {
							                recognition.stop();
							            } else {
							                recognition.start();
							                recordButton.classList.remove('stopped');
							                recordButton2.hidden = true;
							                message.textContent = 'Đang nghe...';
							            }
							            recordButton.classList.toggle('recording');
							        });
							        document.querySelector('#btnTalk').click();
							    })

						});
	</script>
	<script src="/views/js/BuyBookDetails.js">
		
	</script>



</body>
</html>
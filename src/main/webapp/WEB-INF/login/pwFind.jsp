<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>

h4{
	margin-bottom:20px;
}

label.control-label.col-sm-2 {
	width: 100px;
	font-weight: bold;
}

label.control-label.col-sm-2.email {
	display: flex;
	padding: 0px;
	margin-bottom: 15px;
	margin-top: 10px;
}

label.control-label.col-sm-2.number {
	display: flex;
	padding: 0px;
	margin-bottom: 15px;
}

.pwFindSubBox {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 354.91px;
}

.col-sm-10 {
	width: 100%;
	padding: 0;
}

.form-group {
	margin-bottom: 15px;
	width: 100%;
}

.col-sm-offset-2.col-sm-10 {
	text-align: center;
	margin: 0;
}

button.pwFindMybutton {
	width: 100%;
	height: 55px;
	color: white;
	background-color: #d5d5d5;
	font-size: 18px;
	border: 0px;
	border-radius: 5px;
	margin-top: 20px;
}

input#u_email {
	height: 55px;
	margin-bottom: 15px;
}

input#number {
	height: 55px;
	margin-bottom: 15px;
}

.alert.alert-danger {
	width: 100%;
}

.pwFindMainBox {
    display: flex;
    justify-content: center;
    margin-top: 100px;
}

</style>
</head>

<body>

	<div class="container">
		<div class="pwFindMainBox">
			<div class="pwFindSubBox">
			<h4>비밀번호 찾기</h4>

			<div class="form-group">
				<label class="control-label col-sm-2 email" for="u_email">이메일</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="u_email" placeholder="이메일을 입력해 주세요" name="u_email">
				</div>
			</div>
			<div class="form-group" style="display: none;">
				<label class="control-label col-sm-2 number" for="number">인증번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="number" placeholder="인증번호를 입력해 주세요" name="number">
				</div>
				<div class="time"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="pwFindMybutton" onclick="test()">본인 인증하기</button>
				</div>
			</div>
			<div class='alert alert-danger' style="display: none;"></div>
			</div>
		</div>
	</div>
	<script>
		var code;
		var count = 0;
		var timer = null;
		var isRunning = false;
		var display = $(".time");
		var leftSec = 180;

		function test() {
			const emailPattern = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
			let email = $("#u_email").val();
			if (emailPattern.test(email)) {
				pwFind();
			} else {
				$(".alert-danger").css("display", "block");
				$(".alert-danger").html("이메일 형식을 확인해 주세요");
			}
		}

		function startTimer(leftSec, display) {
			var minutes, seconds;
			timer = setInterval(function() {
				minutes = parseInt(leftSec / 60, 10);
				seconds = parseInt(leftSec % 60, 10);

				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;

				display.html(minutes + ":" + seconds);

				// 타이머 끝
				if (--leftSec < 0) {
					clearInterval(timer);
					display.html("시간초과");
					code = null;
				}
			}, 1000);
		}

		function pwFind() {
			var formData = {
				u_email : $("#u_email").val()
			};

			$.ajax({
				type : "POST",
				url : "pwFindId.ko",
				data : formData,
				cache : false,
				success : function(res) {
					console.log("res : ", res)
					if (res === "error") {
						$(".alert-danger").css("display", "block");
						$(".alert-danger").html("존재하지 않는 이메일입니다.");
					} else {
						$(".alert-danger").css("display","none");
						number();
					}
				}
			});
		}

		function number() {
			const email = $("#u_email").val() // 이메일 주소값 얻어오기!

			var formData = {
				email : email
			};

			$.ajax({
				type : 'POST',
				data : formData,
				url : 'mailCheck.ko',
				success : function(data) {
					console.log("data(인증번호ㅋ) : " + data);
					code = data;
					$('.form-group').css('display', 'block');
					$('.pwFindMybutton').text("인증번호 확인");
					$('.pwFindMybutton').attr("onclick", "check()");
					startTimer(leftSec, display);
				}
			});
		}

		function check() {
			const inputCode = $('#number').val();
			const $resultMsg = $('#mail-check-warn');

			if (inputCode === code) {
				$(".alert-danger").css("display", "none");
				clearInterval(timer);
				let email = $('#u_email').val();
// 				경로 바꾸기
				location.href="pwFindShow.ko?email="+email;
			} else {
				$(".alert-danger").css("display", "block");
				$(".alert-danger").html('인증번호가 불일치 합니다. 다시 확인해주세요.');
			}
		}
		
		//엔터 키가 눌렸을 때 기본 이벤트(폼 제출)막고 대신 test()함수 호출
		document.addEventListener('DOMContentLoaded', function() {
			// 특정 입력 필드 가져오기
			var inputField1 = document.getElementById("u_email");
			var inputField2 = document.getElementById("number");

			// 입력 필드에 포커스될 때 엔터 키 이벤트 처리
			inputField1.addEventListener("keydown", function(event) {
				// 엔터 키가 눌렸을 때 기본 이벤트(폼 제출) 막기
				if (event.key === "Enter") {
					event.preventDefault();
					test()
				}
			});
			
			inputField2.addEventListener("keydown", function(event) {
				// 엔터 키가 눌렸을 때 기본 이벤트(폼 제출) 막기
				if (event.key === "Enter") {
					event.preventDefault();
					check()
				}
			});
		});
	</script>
</body>
</html>
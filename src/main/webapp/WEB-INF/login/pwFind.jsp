<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>비채나</title>

<style>

.form-group {
    margin-bottom: 15px;
}

.form-control {
    width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    display: inline;
	height: 52px;
	margin-bottom: 10px;
}


h4{
	margin-bottom:20px;
	
	font-weight: bolder;
    color: #2d4739;
}

.control-label-email {
	width: 100px;
	font-weight: bold;
	display: flex;
	padding: 0px;
	margin-bottom: 15px;
	margin-top: 10px;
	color:#2d4739;
}

label.control-label.sm-2.number {
	padding: 0px;
	
	width: 100px;
    font-weight: bold;
    display: flex;
    padding: 0px;
    margin-bottom: 15px;
    margin-top: 10px;
    color: #2d4739;
}

.pwFindSubBox {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 334.91px;
}

.sm-10 {
	width: 100%;
	padding: 0;
}

.form-group {
	margin-bottom: 15px;
	width: 100%;
}

sm-offset-2.email {
	text-align: center;
	margin: 0;
}

button.pwFindMybutton {
	width: 100%;
	height: 52px;
	font-size: 18px;
	margin-top: 30px;
	display: flex;
	margin-bottom: 10px;
	justify-content: center;
	align-items: center;
	color: #fff;
	background-color:#005930;
	outline: none;
    box-sizing: border-box;
    border: 1px solid transparent;
    padding: 10px 16px;
    line-height: 1.3333333;
    border-radius: 6px;
}

.pwFindMybutton:active,.pwFindMybutton:hover { 
 	color: #fff; 
 	background-color: #2d4739;
    border-color: #2d4739;
 	outline: none; 
 } 

input#pwFind_email {
	width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #2d4739;
    border-radius: 4px;
    display: inline;
    height: 52px;
    margin-bottom: 10px;
}

#pwFind_email:hover,#pwFind_email:focus{
    border: 2px solid #2d4739;
}

input#number {
	width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #2d4739;
    border-radius: 4px;
    display: inline;
    height: 52px;
    margin-bottom: 10px;
}

#number:hover,#number:focus{
    border: 2px solid #2d4739;
}
.alert {
	width: 334.91px;
	margin-top:20px;
    padding: 15px;
    border: 1px solid transparent;
    border-radius: 4px;
}
    
.alert-danger {
	font-size:13px;
	margin-bottom: 10px;
	color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
}

.alert{
	width: 100%;
    margin-top: 10px;
    box-sizing: border-box;
}

.pwFindMainBox {
    display: flex;
    justify-content: center;
    margin-top: 100px;
}

.emailAgain{
	display:inline;
	cursor : pointer;
	bolder : 1px solie black;
	text-decoration:none;
}

div#timebox {
	margin-top: 10px;
    display: flex;
    justify-content: space-between;
}

@media ( max-width: 575px) {
	button.pwFindMybutton {
    margin-top: 0;
}

.pwFindSubBox {
    width: 280px;
}

label.control-label-email{
    margin-bottom: 0px;
}

label.control-label.sm-2.number {
    margin-top: 0px;
    margin-bottom: -10px;
}

input#pwFind_email {
    margin-bottom: 0px;
}

.pwFindMainBox {
    margin-top: 50px;
}

h4 {
    font-size: 22px;
}

}

</style>
</head>

<body>

	<div class="container">
		<div class="pwFindMainBox">
			<div class="pwFindSubBox">
			<h4>비밀번호 찾기</h4>

			<div class="form-group">
				<label class="control-label-email" for="u_email">이메일</label>
				<div class="sm-10">
					<input type="email" class="formControl" id="pwFind_email" placeholder="이메일을 입력해 주세요" name="u_email">
				</div>
			</div>
			<div class='alert alert-danger' style="display: none;" id="danger1"></div>
			<div class="form-group" style="display: none;">
				<label class="control-label sm-2 number" for="number">인증번호</label>
				<div id="timebox">
				<div class="time" style="display:inline; ; color:#2d4739;"></div>
				<a class="emailAgain" onclick="e_again()" style="display:none; color:#2d4739;">재전송</a>
				</div>
				<div class="sm-10">
					<input type="password" class="formControl" id="number" placeholder="인증번호를 입력해 주세요" name="number">
				</div>
			</div>
			<div class='alert alert-danger my' style="display:none;" id="danger2"></div>
			<div class="form-group">
				<div class="sm-offset-2 email">
					<button type="button" class="pwFindMybutton" onclick="test()">본인 인증하기</button>
				</div>
			</div>
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

		//05-12 연속 클릭 수정
		function e_again(){
			alert("해당 이메일로 인증번호를 재전송했습니다.");
			$(".emailAgain").attr("onclick","");
			const email = $("#pwFind_email").val() // 이메일 주소값 얻어오기!

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
					clearInterval(timer);
					startTimer(leftSec, display);
					$(".emailAgain").attr("onclick","e_again()");
				}
			});
		}
		
		
		function test() {
			const emailPattern = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
			let email = $("#pwFind_email").val();
			if (emailPattern.test(email)) {
				pwFind();
			} else {
				$("#danger1").css("display", "block");
				$("#danger1").html("이메일 형식을 확인해 주세요");
				setTimeout(function(){
				$("#danger1").css("display", "none");
				},2000);
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
				u_email : $("#pwFind_email").val()
			};

			$.ajax({
				type : "POST",
				url : "pwFindId.ko",
				data : formData,
				cache : false,
				success : function(res) {
					console.log("res : ", res)
					if (res === "error") {
						$("#danger1").css("display", "block");
						$("#danger1").html("존재하지 않는 이메일입니다.");
						setTimeout(function(){
						$("#danger1").css("display", "none");
						}, 2000);
					} else {
						$("#danger1").css("display","none");
						$('.pwFindMybutton').attr("onclick", "");
						number();
					}
				}
			});
		}

		function number() {
			if(count == 0){
				count = 1;
				alert("해당 이메일로 인증번호를 전송했습니다.");
				const email = $("#pwFind_email").val() // 이메일 주소값 얻어오기!
				$("#pwFind_email").attr("disabled", true);
				
				var formData = {
					email : email
				};

				$.ajax({
					type : 'POST',
					data : formData,
					url : 'mailCheck.ko',
					success : function(data) {
						console.log("data(인증번호) : " + data);
						code = data;
						$('.form-group').css('display', 'block');
						$('.pwFindMybutton').text("인증번호 확인");
						$('.pwFindMybutton').attr("onclick", "check()");
						startTimer(leftSec, display);
						$('.emailAgain').css('display','block');
					}
				});
			}
			
		}

		function check() {
			const inputCode = $('#number').val();
			const $resultMsg = $('#mail-check-warn');

			if (inputCode === code) {
				$(".alert-danger").css("display", "none");
				clearInterval(timer);
				let email = $('#pwFind_email').val();
// 				경로 바꾸기
				location.href="pwFindShow.ko?email="+email;
			} else {
				$("#danger2").css("display", "block");
				$("#danger2").html('인증번호가 불일치 합니다. 다시 확인해주세요.');
				setTimeout(function(){
				$("#danger2").css("display", "none");
				},2000);
			}
		}
		
		//엔터 키가 눌렸을 때 기본 이벤트(폼 제출)막고 대신 test()함수 호출
		document.addEventListener('DOMContentLoaded', function() {
			// 특정 입력 필드 가져오기
			var inputField1 = document.getElementById("pwFind_email");
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
		
		window.onpageshow = function(event){
			if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
				console.log("뒤로가기");
				location.reload();
			}
		}
		
	</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>
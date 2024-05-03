<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

	<form class="form-signin" id="form-signin-id">
		<input type="radio" name="menu" value="email" onclick="getMenu(event)">email
		<input type="radio" name="menu" value="phone" onclick="getMenu(event)">phone
		<div class="form-group">
			<label for="inputUserName" class="sr-only">SEARCH</label>
			<!-- 					<input	type="text" class="form-control" placeholder="email" name="email" id="email" required autofocus> -->
			<input type="text" class="form-control" name="email" id="email"
				placeholder="이메일" required autofocus>
		</div>
		<div class="input-group-addon">
			<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
		</div>
		<div class="mail-check-box">
			<input class="form-control mail-check-input"
				placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
		</div>
		<div class="time"></div>
		<span id="mail-check-warn"></span>
		<button id="mail-check-input" type="button">확인</button>
		</div>
		<button id="btn-success" type="button">검색하기</button>

	</form>
	<div id="box1"></div>
	<script>
		var radioValue = "email";
		var trimPhon;
		var code;
		var count = 0;
		var timer = null;
		var isRunning = false;
		var display = $(".time");
		var leftSec = 180;

		
		
		function startTimer(leftSec, display) {  
			  var minutes, seconds;
			  timer = setInterval(function () {
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
		

		$('#mail-Check-Btn').click(function() {

			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

			if (radioValue === "email") {
				const email = $('#email').val(); // 이메일 주소값 얻어오기!
				console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인

				var formData = {
					email : email
				};

				$.ajax({
					type : 'POST',
					data : formData,
					url : 'mailCheck.ko', // GET방식이라 Url 뒤에 email을 뭍힐수있다.
					success : function(data) {
						console.log("data : " + data);
						checkInput.attr('disabled', false);
						code = data;
						alert('인증번호가 전송되었습니다.');
						startTimer(leftSec,display);
					}
				}); // end ajax
			} else if (radioValue === "phon") {
				// 			$('#sendPhoneNumber').click(function(){
				let phoneNumber = $("#email").val();
				console.log('phoneNumber : ', phoneNumber);
				console.log('인증번호 발송 중!');
				$.ajax({
					type : "GET",
					url : "check/sendSMS.ko",
					data : {
						"phoneNumber" : phoneNumber
					},
					success : function(res) {

						console.log("인증번호 : " + res);
						checkInput.attr('disabled', false);
						code = res;
						alert('인증번호가 전송되었습니다.');
						startTimer(leftSec,display);
					}
				});
				// 			});  // 추가 끝

			}

		}); // end send eamil

		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$('#mail-check-input').click(function() {
			if (radioValue === "email") {

				console.log("인증번호 비교 : ", code);
				const inputCode = $('.mail-check-input').val();
				const $resultMsg = $('#mail-check-warn');

				if (inputCode === code) {
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color', 'green');
					$('#mail-Check-Btn').attr('disabled', true);
					$('#email').attr('readonly', true);
					$('#btn').attr('id', "btn-success");
					//변경
					clearInterval(timer);
					count = 1;
					test();					

				} else {
					$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
					$resultMsg.css('color', 'red');
					count = 0;
				}
			} else if (radioValue === "phon") {
				if ($.trim(code) === $('.mail-check-input').val()) {
					console.log("전화번호 인증 성공");
					//변경
					clearInterval(timer);
					count = 1;
					test();
				} else {
					console.log("전화번호 인증 실패");
					count = 0;
				}

			}

		});

		$('#btn-success').click(function() {
			if (count == 1) {
				test();
			}
		});

		//엔터 키가 눌렸을 때 기본 이벤트(폼 제출)막고 대신 test()함수 호출
		document.addEventListener('DOMContentLoaded', function() {
			// 특정 입력 필드 가져오기
			var inputField = document.getElementById("form-signin-id");

			// 입력 필드에 포커스될 때 엔터 키 이벤트 처리
			inputField.addEventListener("keydown", function(event) {
				// 엔터 키가 눌렸을 때 기본 이벤트(폼 제출) 막기
				if (event.key === "Enter" && count == 1) {
					event.preventDefault();
					test();
				}else if(event.key === "Enter" && count == 0){
					event.preventDefault();
				}
			});
		});

		// 어떤 라디오버튼(phon,email)을 누르는지 보고있다가 상태 바꾸기
		function getMenu(event) {
			console.log("event : ", event.target.value);
			if (event.target.value == 'phon') {
				$('#email').prop('name', "phon");
				$('#email').prop('placeholder', "phon");
				$('#email').val("");
				$('.mail-check-input').prop("placeholder","인증번호 4자리를 입력해주세요!");
				radioValue = "phon";
			} else if (event.target.value == 'email') {
				$('#email').prop('name', "email");
				$('#email').prop('placeholder', "email");
				$('#email').val("");
				radioValue = "email";
			}
		}

		// 전화번호 & 이메일 패턴이 올바른지 확인한 후, 맞으면 데이터 전송하는 search()함수 호출, 안 맞으면 전송하지 않음. 
		function test() {
			console.log("test");
			const emailPattern = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
			// 		const phonPattern = /^(?:(010)|(01[1|6|7|8|9]))-\d{3,4}-(\d{4})$/;
			const phonPattern = /^(?:(010)|(01[1|6|7|8|9]))\d{3,4}(\d{4})$/;
			if (radioValue === "phon") {
				//전화번호에 들어간 공백 제거하기
				let phon = $("#email").val();
				trimPhon = phon.replace(/\s/g, "");
				if (phonPattern.test(trimPhon)) {
					search();
				} else {
					$("#box1").html("전화번호 형식을 확인해 주세요");
				}
			} else if (radioValue === "email") {
				let email = $("#email").val();
				if (emailPattern.test(email)) {
					search();
				} else {
					$("#box1").html("이메일 형식을 확인해 주세요");
				}
			}

		}

		//사용자가 전송한 데이터를 받아 실행
		function search() {
			var formData = {
				menu : radioValue
			};

			if (radioValue === "email") {
				formData.u_email = $("#email").val();
			} else if (radioValue === "phon") {
				formData.u_tel = trimPhon; // "phon"으로 변경
			}

			console.log("formData : ", formData);
			var str = "";
			console.log("formData : ", formData)
			$.ajax({
				type : "POST",
				url : "idFind.ko",
				data : formData,
				cache : false,
				success : function(res) {
					console.log("res : ", res);
					if (res == "" || res == null) {
						if (radioValue == "email") {
							str = "해당하는 이메일을 찾을 수 없습니다.";
							count = 0;
						} else if (radioValue == "phon") {
							str = "해당하는 전화번호를 찾을 수 없습니다.";
							count = 0;
						}

					} else {
						str = "id : " + res.u_id;
						count = 0;
					}
					$("#box1").html(str);
					// 						 let str = (res == null) ? "해당하는 이름을 찾을 수 없습니다." : "id : " + res.id;
				},
				error : function(request, status) {
				}
			});
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
var nickCheck = 0;
var emailCheck = 0;
$(function() {

	//닉네임 중복체크
	$("#nick").change(function() {
		var nickCheckMessage = document.getElementById('nickCheckMessage');
		let nick = document.myPage.nick.value;
		let nickval = {
			"u_nick" : nick
		};
		console.log(nick);
		if (nick == '') {
			nickCheckMessage.style.display = 'none';
		} else {
			$.ajax({
				url : "checkNick.ko",
				type : "post",
				data : nickval,
				dataType : "json",
				cache : false,
				async : false,
				success : function(data) {
					console.log(data);
					if (data > 0) {
						if('${users.u_nick}' == nick) {
							nickCheckMessage.style.display = 'none';	
							nickCheck++;
						} else {
							nickCheck = 0;
							nickCheckMessage.style.display = 'block';							
						}
					} else {
						nickCheckMessage.style.display = 'none';
						nickCheck++;
					}
				},
				error : function(err) {
					console.log('error객체 : ', err);
				}
			});
		}
	});
	
	//email 중복체크
	$("#email").change(function() {
		var emailCheckMessage = document.getElementById('emailCheckMessage');
		let email = document.myPage.email.value;
		let emailval = {
			"u_email" : email
		};
		console.log(email);
		if (email == '') {
			emailCheckMessage.style.display = 'none';
		} else {
			$.ajax({
				url : "checkEmail.ko",
				type : "post",
				data : emailval,
				dataType : "json",
				cache : false,
				async : false,
				success : function(data) {
					if (data > 0) {
						if('${users.u_email}' == email) {
							emailCheckMessage.style.display = 'none';	
							emailCheck++;
						} else {
							emailCheck = 0;
							emailCheckMessage.style.display = 'block';
						}
					} else {
						emailCheckMessage.style.display = 'none';
						emailCheck++;
					}
				},
				error : function(err) {
					console.log('error객체 : ', err);
				}
			});
		}
	});
});

</script>
<style>
.uMyPage {
	display: flex;
	box-sizing: border-box;
	flex-direction: column;
}

.form_item {
	display: flex;
	align-items: center;
	position: relative;
	box-sizing: border-box;
	max-width: 100%;
	/* 	min-height: 50px; */
	padding: 0 10px 0 0px;
}

.container-con{
  border: 1px solid rgb(224, 224, 224);
  border-radius: 20px;
  width: 1000px;
  margin: 0 auto;
}

.inner {
	width: 400px;
  margin: 0 auto;
}

.inner-title{
  width: 800px;
  margin: 0 auto;
  border-bottom: 1px solid rgb(224, 224, 224);
  border-color:rgb(252, 197, 0);
}

.form_item input {
	outline: none;
	padding: 10px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 5px;
	color: rgb(62, 62, 62);
	font-size: 15px;
	line-height: 22px;
	width: 300px;
}
input.postcode {
	width: 220px;
	border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    border-bottom-left-radius: 0px;
}
input.detailAddress {
	border-top-right-radius: 0px;
    border-top-left-radius: 0px;
}
input.address {
	border-radius: 0px;
}
input.menu_h {
	width: 80px;
	font-size: 10px;
	padding: 5px;
	height: 44px;
	background-color: rgb(0, 150, 243);
    color: rgb(255, 255, 255);
	border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
}
input#male+label{
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
}
input#female+label{
	border-top-left-radius: 0px;
	border-bottom-left-radius: 0px;
}
input.menu_h:hover {
	background: rgb(178, 178, 178); 
	cursor: pointer;
}

.gender_item {
	display: flex;
}
.gender_item input[type=radio]{
    display: none;
}
.gender_item input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 40px;
    width: 159px;
    border: 1px solid #333;
    border-radius: 5px;
    line-height: 40px;
    text-align: center;
    font-weight:bold;
    font-size:14px;
}
.gender_item input[type=radio]+label{
    background-color: rgb(195, 195, 195);
    color: rgba(61, 61, 61, 0.3);
    border: none;
}
.gender_item input[type=radio]:checked+label{
    background-color: rgb(0, 150, 243);
    color: rgb(255, 255, 255);
    border: none;
}

.item_name {
	margin-bottom: 8px;
	margin-top: 8px;
}
.send {
	margin-top: 40px;
	width: 322px;
  padding: 5px;
}
.send {
	margin-top: 40px;
	width: 322px;
    padding: 5px;
    height: 40px;
    background-color: rgb(0, 150, 243);
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
}
/* extra small */
@media screen and (max-width:540px) {
		.inner {
		width: 90%;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
		.inner {
		width: 60%;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
		.inner {
		width: 70%;
	}
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
		.inner {
		width: 100%;
	}
}

</style>
</head>
<body>
  <div class="container-con">
    <div class="inner-title"><h3>회원정보 수정</h3></div>
	<div class="inner">
		<form class="uMyPage" name="myPage" id="myPage" action="upInfo.ko" method="post" onsubmit="return insertchk()">
			<div class="item_name">아이디</div>
			<div class="form_item">
				<div id="check">
				<input type="text" id="id" name="u_id" value="${users.u_id}" readonly>
				</div>
			</div>
			<div class="item_name">닉네임</div>
			<small>공백, 특수문자를 제외한 2~10자로 입력하세요.</small>
			<div class="form_item">
				<div>
					<input type="text" id="nick" name="u_nick" value="${users.u_nick}" minlength="1">
				</div>
			</div>
			<div id="nickCheckMessage" style="display: none; color: red;"><small>* 이미 존재하는 닉네임입니다.</small></div>
			<div id="nickErrorMessage" style="display: none; color: red;"><small>* 닉네임을 올바른 형식으로 입력해주세요.</small></div>

			<div class="item_name">성별</div>
			<div class="form_item">
				<div class="gender_item" id="gen" name="gen">
					<input type="radio" id="male" name="u_gen" value="남자" <c:if test="${users.u_gen eq '남자'}">checked</c:if> />
					<label for="male">남자</label>
					<input type="radio" id="female" name="u_gen" value="여자" <c:if test="${users.u_gen eq '여자'}">checked</c:if> />
					<label for="female">여자</label>
				</div>
			</div>
			<div class="item_name">생년월일</div>
			<div class="form_item">
				<div>
					<input type="text" id="birth" name="u_birth" placeholder="생년월일" value="${users.u_birth}" readonly>
				</div>
			</div>
			<div class="item_name">이메일</div>
			<div class="form_item">
				<div onclick="emailInput()">
					<input type="text" id="email" name="u_email" value="${users.u_email}">
				</div>
			</div>
			<div id="emailNoneMessage" style="display: none; color: red;"><small>* 이메일을
				입력해주세요.</small></div>
			<div id="emailErrorMessage" style="display: none; color: red;"><small>* 이메일을
				올바른 형식으로 입력해주세요.</small></div>
			<div id="emailCheckMessage" style="display: none; color: red;"><small>* 이미 존재하는 이메일입니다.</small></div>
			<div class="item_name">휴대전화</div>
			<div class="form_item">
				<div onclick="telInput()">
					<input type="tel" id="tel" name="u_tel" value="${users.u_tel}" required><br>
				</div>
			</div>
			<div class="item_name">주소</div>
			<div class="form_item">
				<div onclick="postcodeInput()">
					<input type="text" id="postcode" name="addr1" class="postcode" placeholder="우편번호" value="${users.addr1}">
				</div>
				<div>
					<input type="button" class="menu_h" onclick="execDaumPostcode()"
						value="우편번호 찾기">
				</div>
			</div>
			<div id="postcodeErrorMessage" style="display: none; color: red;"><small>* 우편번호를
				입력해주세요.</small></div>
			<div class="form_item">
				<div onclick="addressInput()">
					<input type="text" class="address" id="address" name="addr2" value="${users.addr2}"><br>
				</div>
			</div>
			<div id="addressErrorMessage" style="display: none; color: red;"><small>* 주소를 입력해주세요.</small></div>
			<div class="form_item">
				<div onclick="detailInput()">
					<input type="text" class="detailAddress" id="detailAddress" name="addr3" value="${users.addr3}">
				</div>
			</div>
			<div id="detailErrorMessage" style="display: none; color: red;"><small>* 상세주소를
				입력해주세요.</small></div>

			<button class="send" type="submit">회원정보 수정</button>
			<button class="send" type="button" onclick="javascript:history.go(-1)">뒤로 가기</button>
		</form>
	</div>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//                 document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
<script>
function insertchk(){
	var istrue = true;
	
	var nick = document.getElementById('nick');
	var email = document.getElementById('email');
	var postcode = document.getElementById('postcode');
	var address = document.getElementById('address');
	var detail = document.getElementById('detailAddress');
	
	var nickPattern = /^[가-힣a-zA-Z]+$/;
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	
	var emailNoneMessage = document.getElementById('emailNoneMessage');
	var postcodeErrorMessage = document.getElementById('postcodeErrorMessage');
	var addressErrorMessage = document.getElementById('addressErrorMessage');
	var detailErrorMessage = document.getElementById('detailErrorMessage');
	var nickErrorMessage = document.getElementById('nickErrorMessage');
	
	if(!nickPattern.test(nick.value)) {
		nick.focus();
		nickErrorMessage.style.display = 'block';
		istrue = false;
	}
	if(email.value == '' || email.value == null || !emailPattern.test(email.value)) {
		email.focus();
		emailErrorMessage.style.display = 'block'
		istrue = false;
	}
	if(postcode.value == '' || postcode.value == null) {
		postcode.focus();
		postcodeErrorMessage.style.display = 'block';
		istrue = false;
	}
	if(address.value == '' || address.value == null) {
		address.focus();
		addressErrorMessage.style.display = 'block';
		istrue = false;
	}
	if(detail.value == '' || detail.value == null) {
		detail.focus();
		detailErrorMessage.style.display = 'block';
		istrue = false;
	}
	
	if(nickCheck == 0) {
		if('${users.u_nick}' == nick.value){
			nickErrorMessage.style.display = 'none';
		} else {
			alert('닉네임 중복체크를 해주세요');
			istrue = false;			
		}
	}
	if(emailCheck == 0) {
		if('${users.u_email}' == email.value){
			emailErrorMessage.style.display = 'none';
		} else {
			alert('이메일 중복체크를 해주세요');
			istrue = false;			
		}
	}
	console.log(istrue);
	return istrue;
	
}

function nickInput() {
	var nick = document.getElementById('nick');
	var nickErrorMessage = document.getElementById('nickErrorMessage');

	nick.focus(); // Focus on the input field

	nick.addEventListener('input', function() {
		var pattern = /^[가-힣a-zA-Z]+$/; // 정규 표현식 패턴
		var nickvalue = nick.value.trim();
		if(!pattern.test(nickvalue)) {
			nickErrorMessage.style.display = 'block'; // Display error message				
		} else {
			nickErrorMessage.style.display = 'none'; // Hide error message
		}
	});
}

function emailInput() {
	var email = document.getElementById('email');
	var emailErrorMessage = document.getElementById('emailErrorMessage');
	var emailNoneMessage = document.getElementById('emailNoneMessage');		

	email.focus(); // Focus on the input field

	email.addEventListener('input', function() {
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		var emailvalue = email.value.trim();
		if (emailvalue == "") {
			emailNoneMessage.style.display = 'block';
			emailErrorMessage.style.display = 'none';						
		} else if (!emailPattern.test(emailvalue)){
			emailErrorMessage.style.display = 'block';						
			emailNoneMessage.style.display = 'none';
		} else {
			emailErrorMessage.style.display = 'none';
			emailNoneMessage.style.display = 'none';
		}
	});
}

function postcodeInput() {
	var postcode = document.getElementById('postcode');
	var postcodeErrorMessage = document.getElementById('postcodeErrorMessage');

	postcode.focus(); // Focus on the input field

	postcode.addEventListener('input', function() {
		var postcodevalue = postcode.value.trim();
		if (postcodevalue == "") {
			postcodeErrorMessage.style.display = 'block'; // Display error message
		} else {
			postcodeErrorMessage.style.display = 'none'; // Hide error message
		}
	});
}
function addressInput() {
	var address = document.getElementById('address');
	var addressErrorMessage = document.getElementById('addressErrorMessage');

	address.focus(); // Focus on the input field

	address.addEventListener('input', function() {
		var addressvalue = address.value.trim();
		if (addressvalue == "") {
			addressErrorMessage.style.display = 'block'; // Display error message
		} else {
			addressErrorMessage.style.display = 'none'; // Hide error message
		}
	});
}
function detailInput() {
	var detail = document.getElementById('detailAddress');
	var detailErrorMessage = document.getElementById('detailErrorMessage');

	detail.focus(); // Focus on the input field

	detail.addEventListener('input', function() {
		var detailvalue = detail.value.trim();
		if (detailvalue == "") {
			detailErrorMessage.style.display = 'block'; // Display error message
		} else {
			detailErrorMessage.style.display = 'none'; // Hide error message
		}
	});
}
</script>
</html>
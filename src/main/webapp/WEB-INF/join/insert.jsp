<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>비채나</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="resources/js/check.js?ver=2"></script>
<script>
$(document).ready(function(){
	var birth = document.getElementById('birth').value;
	if(new Date(birth).getFullYear() > 2005) {
		location.href = "main.ko?result=2";
	}
});

var cnt = 0;
var nickCheck = 0;
var emailCheck = 0;
	$(function() {
		//아이디 중복체크
		$("#check").change(function() {
			var idNoneMessage = document.getElementById('idNoneMessage');
			var idCheckMessage = document.getElementById('idCheckMessage');
			let ids = document.joinform.id.value;
			let idval = {
				"u_id" : ids
			};
			console.log(ids);
			if (ids == '') {
				idCheckMessage.style.display = 'none';
				idNoneMessage.style.display = 'block';
			} else {
				idNoneMessage.style.display = 'none';
				$.ajax({
					url : "checkId.ko",
					type : "post",
					data : idval,
					dataType : "json",
					cache : false,
					async : false,
					success : function(data) {
						console.log('아이디 중복체크 success');
						if (data > 0) {
							idCheckMessage.style.display = 'block';
							cnt = 0;
						} else {
							idCheckMessage.style.display = 'none';
							cnt++;
						}
					},
					error : function(err) {
						console.log('error객체 : ', err);
					}
				});
			}
		});
		
		//닉네임 중복체크
		$("#nick").change(function() {
			var nickCheckMessage = document.getElementById('nickCheckMessage');
			let nick = document.joinform.nick.value;
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
						if (data > 0) {
							nickCheckMessage.style.display = 'block';
							nickCheck = 0;
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
		
		//이메일 중복체크
		$("#email").change(function() {
			var emailCheckMessage = document.getElementById('emailCheckMessage');
			let email = document.joinform.email.value;
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
							emailCheckMessage.style.display = 'block';
							emailCheck = 0;
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
.joinform {
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

.inner {
	width: 330px;
	margin: 0 auto;
}

.form_item input {
	outline: none;
	padding: 10px;
	border: 1px solid rgb(174,174,174);
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
    border-bottom: none;
}
input.detailAddress {
	border-top-right-radius: 0px;
    border-top-left-radius: 0px;
    border-top: none;
}
input.address {
	border-radius: 0px;
}
input.menu_h {
	width: 80px;
	font-size: 10px;
	padding: 5px;
	height: 43px;
	background-color: #005930;
    color: rgb(255, 255, 255);
	border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
    border-left: none;
    border-bottom: none;
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
	background: #2d4739; 
	cursor: pointer;
}
.gender_item {
	display: flex;
	width: 300px;
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
    background-color: #005930;
    color: rgb(255, 255, 255);
    border: none;
}

.item_name {
	font-weight: bold;
	margin-bottom: 8px;
	margin-top: 8px;
}
.send {
	margin-top: 40px;
	width: 300px;
    padding: 5px;
    height: 40px;
    background-color: #005930;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
}
.send:hover {
	background-color: #2d4739;
}
/* extra small */
@media screen and (max-width:540px) {
	.inner {
		width: 320px;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	.inner {
		width: 310px;
	}
	.joinform {
		width: 105%;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	.inner {
		width: 330px;
	}
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
	.inner {
		width: 350px;
	}
	.joinform {
		width: 95%;
	}
}

</style>
</head>
<body>
<%@include file="/common/navbar.jsp" %>
	<div class="inner">
		<form class="joinform" name="joinform" action="insertUser.ko" method="post" onSubmit="return insertchk()">
			<div class="item_name">아이디</div>
			<div class="form_item">
				<div id="check" onclick="idInput()">
					<input type="text" id="id" name="u_id" placeholder="영문 대소문자, 숫자 포함 최소 9자이상">
				</div>
			</div>
			<div id="idErrorMessage" style="display: none; color: red;"><small>* 아이디를 올바른 형식으로 입력해주세요.</small></div>
			<div id="idNoneMessage" style="display: none; color: red;"><small>* 아이디를 입력해주세요.</small></div>
			<div id="idCheckMessage" style="display: none; color: red;"><small>* 이미 사용중인 아이디입니다.</small></div>
				
			<div class="item_name">비밀번호</div>
			<div class="form_item">
				<div onclick="pwInput()">
					<input type="password" id="pw" name="u_pw" placeholder="영문 대소문자,특수문자,숫자 포함 8~15자">
				</div>
			</div>
			<div id="pwErrorMessage" style="display: none; color: red;"><small>* 비밀번호를 올바른 형식으로 입력해주세요.</small></div>
			
			<div class="item_name">비밀번호 확인</div>
			<div class="form_item">
				<div onclick="pw1Input()">
					<input type="password" id="pw1" name="pw1" placeholder="비밀번호 확인">
				</div>
			</div>
			<div id="pw1ErrorMessage" style="display: none; color: red;"><small>* 비밀번호와 일치시켜 주세요.</small></div>
			<div class="item_name">이름</div>
			<div class="form_item">
				<div onclick="nameInput()">
					<input type="text" id="name" name="u_name" placeholder="이름" minlength="1" value="<%=request.getParameter("name")%>" readonly>
				</div>
			</div>
			<div id="nameErrorMessage" style="display: none; color: red;"><small>* 이름을 입력해주세요.</small></div>
				
			<div class="item_name">닉네임</div>
			<div class="form_item">
				<div onclick="nickInput()">
					<input type="text" id="nick" name="u_nick" class="nick" placeholder="특수문자,숫자,띄어쓰기 불가" minlength="1">
				</div>
			</div>
			<div id="nickCheckMessage" style="display: none; color: red;"><small>* 이미 존재하는 닉네임입니다.</small></div>
			<div id="nickErrorMessage" style="display: none; color: red;"><small>* 닉네임을 올바른 형식으로 입력해주세요.</small></div>

			<div class="item_name">성별</div>
			<div class="form_item">
				<div class="gender_item">
					<input type="radio" id="male" name="u_gen" value="남자" checked><label for="male">남자</label>
					<input type="radio" id="female" name="u_gen" value="여자"><label for="female">여자</label>
				</div>
			</div>
			<div id="genderErrorMessage" style="display: none; color: red;"><small>* 성별을 선택해주세요.</small></div>

			<div class="item_name">생년월일</div>
			<div class="form_item">
				<div onclick="birthInput()">
					<input type="text" id="birth" name="u_birth" placeholder="생년월일" value="<%=request.getParameter("birth")%>" readonly><br>
				</div>
			</div>
			<div id="birthErrorMessage" style="display: none; color: red;"><small>* 올바른 생년월일을 입력해주세요.</small></div>
				
			<div class="item_name">전화번호</div>
			<div class="form_item">
				<div onclick="telInput()">
					<input type="tel" id="tel" name="u_tel" placeholder="전화번호" value="<%=request.getParameter("tel")%>" readonly><br>
				</div>
			</div>
			<div id="telErrorMessage" style="display: none; color: red;"><small>* 전화번호를 입력해주세요.</small></div>
				
			<div class="item_name">이메일</div>
			<div class="form_item">
				<div onclick="emailInput()">
					<input type="text" id="email" name="u_email" placeholder="이메일"><br>
				</div>
			</div>
			<div id="emailNoneMessage" style="display: none; color: red;"><small>* 이메일을 입력해주세요.</small></div>
			<div id="emailErrorMessage" style="display: none; color: red;"><small>* 이메일을 올바른 형식으로 입력해주세요.</small></div>
			<div id="emailCheckMessage" style="display: none; color: red;"><small>* 이미 존재하는 이메일입니다.</small></div>
				
			<div class="item_name">주소</div>
			<div class="form_item">
				<div onclick="postcodeInput()">
					<input type="text" id="postcode" name="addr1" class="postcode" placeholder="우편번호"><br>
				</div>
				<div>
					<input type="button" class="menu_h" onclick="execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>
			<div class="form_item">
				<div onclick="addressInput()">
					<input type="text" class="address" id="address" name="addr2" placeholder="주소"><br>
				</div>
			</div>
			<div class="form_item">
				<div onclick="detailInput()">
					<input type="text" class="detailAddress" id="detailAddress" name="addr3" placeholder="상세주소"><br>
				</div>
			</div>
			<div id="postcodeErrorMessage" style="display: none; color: red;"><small>* 우편번호를 입력해주세요.</small></div>
			<div id="addressErrorMessage" style="display: none; color: red;"><small>* 주소를 입력해주세요.</small></div>
			<div id="detailErrorMessage" style="display: none; color: red;"><small>* 상세주소를 입력해주세요.</small></div>

			<button class="send" type="submit">회원가입 하기</button>
		</form>
	</div>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<%@ include file="../../common/footer.jsp"%>
</html>
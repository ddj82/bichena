<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
.container#container-pwChan {
	display: flex;
	justify-content: center;
	width: 1000px;
	margin: 50px auto;
	padding: 50px 20px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	}
	
.info-box#info-box {
	width: 50%;
 	margin: 0 auto; 
	height: 300px;
	}
	
</style>
<script>
function insertchk(){
	var istrue = true;
	
	var pw = document.getElementById('pw');
	var pw1 = document.getElementById('pw1');
	
	var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;

	var pwErrorMessage = document.getElementById('pwErrorMessage');
	var pw1ErrorMessage = document.getElementById('pw1ErrorMessage');

	if(pw.value == '' || pw.value == null || !pwPattern.test(pw.value)) {
		pw.focus();
		pwErrorMessage.style.display = 'block';
		istrue = false;
	}
	if(pw1.value != pw.value) {
		pw1.focus();
		pw1ErrorMessage.style.display = 'block';
		istrue = false;
	}
	
	console.log(istrue);
	return istrue;
}

function pwInput() {
	var pw = document.getElementById('pw');
	var pwErrorMessage = document.getElementById('pwErrorMessage');

	pw.focus(); // Focus on the input field

	pw.addEventListener('input', function() {
		var pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/; // 정규 표현식 패턴
		var pwvalue = pw.value.trim();
		if(!pattern.test(pwvalue)) {
			pwErrorMessage.style.display = 'block'; // Display error message				
		} else {
			pwErrorMessage.style.display = 'none'; // Hide error message
		}
	});
}

function pw1Input() {
	var pw1 = document.getElementById('pw1');
	var pw1ErrorMessage = document.getElementById('pw1ErrorMessage');
	var pw = document.getElementById('pw');
	
	pw1.focus(); // Focus on the input field

	pw1.addEventListener('input', function() {
		var pw1value = pw1.value.trim();
		if (pw1value == '' || pw1value != pw.value.trim()) {
			pw1ErrorMessage.style.display = 'block'; // Display error message
		} else {
			pw1ErrorMessage.style.display = 'none'; // Hide error message
		}
	});
}

</script>
</head>
<body>
<jsp:include page="../../common/navbar.jsp" />
<jsp:include page="/WEB-INF/user/myPageHeader.jsp" />

<div class="container" id="container-pwChan">
	<div class="info-box" id="info-box">
	<form class="chanMypw" name="pwChan" id="pwChan" action="updatePw.ko" method="post" onSubmit="return insertchk()">
	<h2>비밀번호 변경</h2>
		<p>영문 대소문자,특수문자,숫자 포함 8~15자로 입력하세요.</p>
		<div class="item_name">비밀번호</div>
		<div class="form_item">
			<div onclick="pwInput()">
				<input type="password" id="pw" name="u_pw" placeholder="비밀번호를 입력해 주세요.">
			</div>
		</div>
		<div id="pwErrorMessage" style="display: none; color: red;">
			<small>* 비밀번호를 올바른 형식으로 입력해주세요.</small>
		</div>
		<div class="item_name">비밀번호 확인</div>
		<div class="form_item">
			<div onclick="pw1Input()">
				<input type="password" id="pw1" name="pw1" placeholder="비밀번호 확인">
			</div>
		</div>
		<div id="pw1ErrorMessage" style="display: none; color: red;">
			<small>* 위 비밀번호와 일치시켜 주세요.</small>
		</div>
		<button type="button" onclick="javascript:history.go(-1)">뒤로 가기</button>
		<button type="submit">변경하기</button>
	</form>
	</div>
</div>
</body>
</html>
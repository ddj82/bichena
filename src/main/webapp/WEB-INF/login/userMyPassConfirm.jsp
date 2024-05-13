<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인</title>
<style>
.chanPwForm{
	width: 1000px; 
	height: 300px;	
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 20px;
}

#upw{
	width: 250px;
	height: 50px;
	padding: 10px;
}

#passPW{
	height: 50px;
/* 	border: 1px solid rgb(224, 224, 224); */
/* 	border-radius: 5px; */
/* 	padding: 10px; */
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<h3>비밀번호 재확인</h3>
	<form action="reconPw.ko" class="confirmPw" id="confirmPw" method="post">
		<p><small>개인정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.</small></p>
		<input type="password" id="upw" name="u_pw" placeholder="비밀번호를 입력해주세요." maxlength="16" pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+">
		<input type="button" id="passPW" onclick="passChk()" value="확인" class="btn btn-outline-secondary">
	</form>
</div>
</body>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		// 특정 입력 필드 가져오기
		var inputField = document.getElementById("confirmPw");
	
		// 입력 필드에 포커스될 때 엔터 키 이벤트 처리
		inputField.addEventListener("keydown", function(event) {
			// 엔터 키가 눌렸을 때 기본 이벤트(폼 제출) 막기
			if (event.key === "Enter") {
				event.preventDefault();
				passChk();
			}
		});
	});

	function passChk() {
		let upw = document.getElementById('upw').value;
		if (upw == '') {
			alert("비밀번호를 입력해주세요.");
		} else {
			let pwval = {
				"u_pw" : upw
			}

			$.ajax({
				url : "reconPw.ko",
				type : "post",
				data : pwval,
				dataType : "json",
				cache : false,
				async : false,
				success : function(data) {
					console.log('비밀번호 재확인!');
					if (data == 1) {
						location.href = 'userInfo.ko';
					} else {
						alert('비밀번호를 다시 확인해주세요.');
					}
				},
				error : function(err) {
					console.log('error : ', err);
				}
			});

		}
		console.log(upw);
	}
</script>
</html>
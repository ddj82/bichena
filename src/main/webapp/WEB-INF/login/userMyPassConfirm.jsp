<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인</title>
</head>

<body>
	<h3>비밀번호 재확인</h3>
	<form action="reconPw.ko" class="confirmPw" method="post">
		<p>개인정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.</p>
		<div>
			<input type="password" id="upw" name="u_pw" maxlength="16" pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+">
		</div>
		<div>
			<input type="button" onclick="passChk()" value="확인">
		</div>
	</form>
<!-- 	<p> -->
<!-- 		비밀번호가 기억나지 않으세요? -->
<!-- 		<a href="">비밀번호 재설정</a> -->
<!-- 	</p> -->
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
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
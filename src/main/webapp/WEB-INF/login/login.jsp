<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js" integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
<script>
Kakao.init('f8801431aadfbf2a0016165e1408e997'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.form-signin.mainBox {
	display: flex;
	flex-direction: column;
	align-items: center;
}

form.form-signin {
	text-align: center;
}

.form-signin.subBox {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	<div class="form-signin mainBox">
		<div class="form-signin subBox">
			<form id="form-signin">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name="u_id" id="u_id" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="u_pw" id="u_pw" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="button" onclick="btn()">로그인</button>
				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
					<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
				</a>
				<p id="token-result"></p>
				<button class="api-btn" onclick="requestUserInfo()" style="visibility: hidden">사용자 정보 가져오기</button>
			</form>
			<a class="nav-item" href="idFind.jsp">아이디 찾기</a>
		</div>
	</div>
	
	
	<script>
	//엔터 키가 눌렸을 때 기본 이벤트(폼 제출)막고 대신 test()함수 호출
		document.addEventListener('DOMContentLoaded', function() {
			// 특정 입력 필드 가져오기
			var inputField = document.getElementById("form-signin");

			// 입력 필드에 포커스될 때 엔터 키 이벤트 처리
			inputField.addEventListener("keydown", function(event) {
				// 엔터 키가 눌렸을 때 기본 이벤트(폼 제출) 막기
				if (event.key === "Enter") {
					event.preventDefault();
					btn();
				}
			});
		});
	</script>
	
<!-- 카카오 로그인  -->
<script>
	function loginWithKakao() {
	  Kakao.Auth.authorize({
	    redirectUri: 'http://localhost:8090/ko/kakao.ko'
	  });
	}
</script>


<script>
function btn(){
		var formData = {
			u_id : $("#u_id").val(),
			u_pw : $("#u_pw").val()
		};

		$.ajax({
			type : 'POST',
			data : formData,
			url : "login.ko",
			success : function(data) {
				location.href = data;
			}
		});
}
	
</script>

<%
if (request.getParameter("error") != null && request.getParameter("error").equals("1")) {
	out.println("<div class='alert alert-danger'>");
	out.println("아이디와 비밀번호를 확인해 주세요");
	out.println("</div>");
}
%>

	
</body>
</html>
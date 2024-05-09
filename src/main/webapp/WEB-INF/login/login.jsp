<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%
if (session.getAttribute("userID") != null) {
	response.sendRedirect("main.ko");
}
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js" integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
<script>
Kakao.init('f8801431aadfbf2a0016165e1408e997'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<!-- 네이버 시작 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 네이버 끝  -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- css 변경 -->
<style>
h2 {
	font-size: 30px;
	text-align: center;
}

.container {
	margin-top:100px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.container-sub {
	display: flex;
	flex-direction: column;
}

.form-control {
	display: inline;
	height: 55px;
	margin-bottom: 10px;
}

img {
	width: 100%;
	margin-bottom: 10px;
}

form#form-signin {
	width: 100%;
}

.btn-block {
	display: block;
	width: 100%;
	height: 55px;
	margin-bottom: 10px;
}

.btn-success {
    color: #fff;
    background-color: #0096f3;
    border-color: #0096f3;
    outline: none;
}

.btn-success:hover{
	color: #fff;
    background-color: #0096f3;
    border-color: #0096f3;
    outline: none;
}

.btn-success:focus {
  	color: #fff;
    background-color: #0096f3;
    border-color: #0096f3;
    outline: none;
}

div#find {
    margin-top: 10px;
    display: flex;
    justify-content: space-around;
}

.login-membership {
    height: 55px;
    border: 1px solid gray;
    border-radius: 7px;
    text-align: center;
    line-height: 55px;
    font-size: 18px;
    color: gray;
    margin-bottom: 10px;
}

.alert{
	margin-bottom: 0px;
}

button.btn.btn.btn-lg.btn-success.btn-block:active {
    color: #fff;
    background-color: #0096f3;
    border-color: #0096f3;
    outline: none;
}

.login-membership:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="form-group">
			<div class="col-sm-10">
				<div class="container-sub">
					<h2>LOGIN</h2>
					<form id="form-signin">
						<input type="text" class="form-control" id="u_id" placeholder="ID" name="u_id">
						<input type="password" class="form-control" id="u_pw" placeholder="password" name="u_pw">
					</form>
					<button class="btn btn btn-lg btn-success btn-block" type="button" onclick="btn()">로그인</button>
					<a id="kakao-login-btn" href="javascript:loginWithKakao()"> 
						<img src="img/login/kakao.png" alt="카카오 로그인 버튼" />
					</a> 
					<a id="naver-login-btn" href="javascript:showLoginPopup()"> 
						<img src="img/login/naver.png" alt="네이버 로그인 버튼" />
					</a>
					<div class="login-membership" onclick="location.href='terms.ko';">이메일 회원가입</div>
					<%
					if (request.getParameter("error") != null && request.getParameter("error").equals("1")) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");
					}
					%>
					<div id="find">
						<a class="nav-item" href="idf.ko">아이디 찾기</a>
						<a class="nav-item" href="pwf.ko">비밀번호 찾기</a>
					</div>
				</div>
			</div>
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


<!-- 카카오 로그인  -->

function loginWithKakao() {
	Kakao.Auth.authorize({
		redirectUri : 'http://localhost:8090/ko/kakao.ko'
	});
}
</script>

<!-- 네이버 로그인  -->
<%
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString();
%>

<c:set var="stat" value="<%=state%>" />

<script>
// 네이버 로그인을 위한 팝업창 생성
function showLoginPopup() {
	let uri = 'https://nid.naver.com/oauth2.0/authorize?'
			+ 'response_type=code' + // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
			'&client_id=zxmdaRxHzFpwT89DdNZe' + // 발급받은 client_id 를 입력
			'&state=${stat}' + // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
			'&redirect_uri=http://localhost:8090/ko/NaverLoginCallback.ko'; // 어플케이션에서 등록했던 CallBack URL를 입력

	location.href = uri;
}

function btn() {
	var formData = {
		u_id : $("#u_id").val(),
		u_pw : $("#u_pw").val()
	};

	$.ajax({
		type : 'GET',
		data : formData,
		url : "login.ko",
		success : function(data) {
			location.href = data;
		}
	});
}
</script>

</body>
</html>
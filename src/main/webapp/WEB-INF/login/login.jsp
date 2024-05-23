<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ include file="../../common/navbar.jsp" %>
<%
if (session.getAttribute("userID") != null) {%>
	<script>location.href="main.ko";</script>
<%}
response.setHeader("cache-control","no-cache");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js" integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
<script>
Kakao.init('f8801431aadfbf2a0016165e1408e997'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<!-- 네이버 시작 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<!-- 네이버 끝  -->
<head>
<meta charset="UTF-8">
<title>비채나</title>
<style>

.control.login {
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

a.loginH2{
	color: #2d4739;
	font-weight:bolder;
	text-decoration:none;
}

h2 {
	font-size: 30px;
	text-align: center;
}

.container.login {
	margin-top: 100px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.container-sub.login {
	display: flex;
	flex-direction: column;
	width: 334.91px;
}

form#form-signin {
	width: 100%;
	margin-bottom: 0px;
}

button.loginBtn {
	display: flex;
	width: 100%;
	height: 52px;
	margin-bottom: 10px;
	justify-content: center;
	align-items: center;
	color: #fff;
	background-color:#005930;
	outline: none;
    box-sizing: border-box;
    border: 1px solid transparent;
}

.loginBtn:active { 
 	color: #fff; 
 	background-color: #2d4739;
    border-color: #2d4739;
 	outline: none; 
 } 

.loginBtn:hover {
	color: #fff;
	background-color: #2d4739;
	border-color: #2d4739;
	outline: none;
}

.loginBtn {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 6px;
}

div#find {
	margin-top: 10px;
	display: flex;
	justify-content: space-around;
}

.login-membership {
    height: 52px;
    border: 1px solid #2d4739;
    border-radius: 7px;
    text-align: center;
    line-height: 52px;
    font-size: 18px;
    color: #2d4739;
    margin-bottom: 10px;
}

.alert {
	margin-bottom: 0px;
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

.login-membership:hover {
	cursor: pointer;
}


button { 
   -webkit-appearance: none; 
   -moz-appearance: none; 
   appearance: none; 
 } 

.container-sub {
    width: 334.9px;
}

.control.login:hover,.control.login:focus{
    border: 2px solid #2d4739;
    font-weight:bolder;
}



.loginImg {
    height: 25px;
    margin-right: 20px;
}


a#kakao-login-btn {
    display: inline-block;
    background-color: #ffe812;
    width: 100%;
    height: 52px;
    border-radius: 7px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
    line-height: 52px;
}

a#naver-login-btn {
    display: inline-block;
    background-color: #04d461;
    width: 100%;
    height: 52px;
    border-radius: 7px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
    color:white;
    line-height: 52px;
}

.login-membership:hover {
    border: 2px solid #2d4739;
    font-weight: bolder;
}

#u_id{
	margin-bottom: 0px;
}
#u_pw{
	margin-top:5px;
}

.rememberDiv{
	display:flex;
	align-items: center;
}


@media (max-width: 575px) {

	.container-sub {
	    width: 280px;
	    margin-top: -50px;
	}
	
	input#u_id,input#u_pw {
	    height: 40px;
	}
	
	a#kakao-login-btn,a#naver-login-btn {
		height: 40px;
	}
	
	button.loginBtn {
	    font-size: 15px;
	    height: 40px;
	}
	
	
	.login-membership {
	    height: 40px;
	    line-height: 40px;
	    font-size: 15px;
	}
	
	.loginImg {
	    height: 18px;
	}
	
	a.nav-item {
	    font-size: 15px;
	}
	
	.rememberDiv {
	    font-size: 15px;
	}

}

#u_pw {
    margin-bottom: 3px;
}

button.loginBtn {
    margin-top: 3px;
}

input#remember {
    margin-left: 15px;
    margin-right: 10px;
}
</style>
</head>
<% 
String chek="";
String chekPW="";
String userid="";
String userpw="";
Cookie[] cookie = request.getCookies();
if(cookie != null){
	for(int i = 0; i < cookie.length; i++){
		if(cookie[i].getName().equals("remember")){
			chek ="checked";
			userid = cookie[i].getValue();
			System.out.println(userid);
		}
		
	}
}
%>
<body>
	<div class="container login">
		<div class="form-group login">
			<div class="sm-10">
				<div class="container-sub">
					<h2>LOGIN</h2>
					<form id="form-signin">
						<input type="text" class="control login" id="u_id" placeholder="ID" name="u_id" value=<%=userid %>> 
						<input type="password" class="control login" id="u_pw" placeholder="password" name="u_pw" maxlength="20" value=<%=userpw %>>
<!-- 						추가 -->
						<div class="rememberDiv"><input type="checkbox" id="remember" name="remember" value="chk" <%=chek %>>아이디 저장</div>
						<script>
						$("#remember").on('click',function(){
							if(!($('input[id=remember]').is(':checked'))){
								$("#u_id").attr("value","");
							}
						});
						</script>
					</form>
					<div class='alert alert-danger' style="display: none;"></div>
					<button class="loginBtn" type="button" onclick="btn()">로그인</button>
					<a class="loginH2" id="kakao-login-btn" href="javascript:loginWithKakao()"> 
						<img class="loginImg" src="img/login/kakaoIcon.png" alt="카카오 로그인 버튼" />카카오 로그인
					</a> 
					<a class="loginH2" id="naver-login-btn" href="javascript:showLoginPopup()"> 
						<img class="loginImg" src="img/login/naverIcon.png" alt="네이버 로그인 버튼" />네이버 로그인
					</a>
					<div class="login-membership" onclick="location.href='terms.ko';">이메일 회원가입</div>
					<div id="find">
						<a class="nav-item loginH2" href="idf.ko">아이디 찾기</a> <a class="nav-item loginH2" href="pwf.ko">비밀번호 찾기</a>
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
	let url = window.location.href;
	if(url.indexOf('localhost:8090') >= 0){
		Kakao.Auth.authorize({
			redirectUri : "http://localhost:8090/ko/kakao.ko?version=1"
		});
	}else if(url.indexOf('localhost:14192') > 0){
		Kakao.Auth.authorize({
			redirectUri : "http://localhost:8090/ko/kakao.ko?version=1"
		});
	}else{
	Kakao.Auth.authorize({
		redirectUri : "http://bichena.kro.kr/kakao.ko?version=2"
	});
	}
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
	let url = window.location.href;
	let r_u ="";
	if(url.indexOf('localhost:8090') > 0){
		r_u = 'http://localhost:8090/ko/NaverLoginCallback.ko';
	}else if(url.indexOf('localhost:14192') > 0){
		r_u = 'http://localhost:8090/ko/NaverLoginCallback.ko';
	}else{
		r_u = 'http://bichena.kro.kr/NaverLoginCallback.ko';
	}
	let uri = 'https://nid.naver.com/oauth2.0/authorize?'
			+ 'response_type=code' + // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
			'&client_id=zxmdaRxHzFpwT89DdNZe' + // 발급받은 client_id 를 입력
			'&state=${stat}' + // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
			'&redirect_uri='+r_u; // 어플케이션에서 등록했던 CallBack URL를 입력
	location.href = uri;
}

function btn() {
	if($("#u_id").val() == null || $("#u_id").val() == ""){
		$(".alert-danger").css("display","block");
		$(".alert-danger").html("아이디를 입력해 주세요.");
		myExec = setTimeout(function(){ 
		$(".alert-danger").css("display","none");
		}, 2000);
	}else if($("#u_pw").val() == null || $("#u_pw").val() == ""){
		$(".alert-danger").css("display","block");
		$(".alert-danger").html("비밀번호를 입력해 주세요.");
		myExec = setTimeout(function(){ 
		$(".alert-danger").css("display","none");
		}, 2000);
	}else{
		
		var formData = {
				u_id : $("#u_id").val(),
				u_pw : $("#u_pw").val()
			};

		if($('input[id=remember]').is(':checked')){
			formData["remember"] = $("#remember").val();
		}
		
		if($('input[id=rememberPW]').is(':checked')){
			formData["rememberPW"] = $("#rememberPW").val();
		}
		
			$.ajax({
				type : 'GET',
				data : formData,
				url : "login.ko",
				success : function(data) {
					console.log("data : "+data);
					if(data == "loginErr.ko"){
							$(".alert-danger").html("일치하는 아이디나 비밀번호가 존재하지 않습니다.");
							$(".alert-danger").css("display","block");
							myExec = setTimeout(function(){ 
							$(".alert-danger").css("display","none");
							}, 2000); 
					}else{
						location.href = data;
					}
				}
			});
	}
	
}

</script>
</body>
<%@ include file="../../common/footer.jsp"%>
</html>
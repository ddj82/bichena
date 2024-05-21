<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ include file="../../common/navbar.jsp" %>
<%
if (session.getAttribute("userID") != null && session.getAttribute("userID").equals("admin")) {
	response.sendRedirect("admin2.ko");
}
%>
<%
if (request.getParameter("err") != null && request.getParameter("err").equals("3")) {
%>
<script>
alert('비밀번호를 확인해주세요.');
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비채나</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
*{
	box-sizing: border-box;
}
h2 {
	font-size: 30px;
	text-align: center;
}

.containerAdminLogin {
	margin-top:100px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.container-sub-AdminLogin {
	display: flex;
	flex-direction: column;
	width: 334.91px;
}

.control-AdminLogin {
	display: inline;
	height: 55px;
	margin-bottom: 10px;
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

.btnAdminLogin {
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
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 6px;
}

.btnAdminLogin:hover{
	color: #fff;
	background-color: #2d4739;
	border-color: #2d4739;
	outline: none;
}

.btnAdminLogin:active {
 	color: #fff; 
 	background-color: #2d4739;
    border-color: #2d4739;
 	outline: none; 
}

.alert{
	margin-bottom: 0px;
}

#u_id:hover,#u_id:focus,#u_pw:hover,#u_pw:focus{
    border: 2px solid #2d4739;
    font-weight:bolder;
}

@media (max-width: 575px) {
	.container-sub-AdminLogin {
    width: 280px;
}

.containerAdminLogin {
    margin-top: 50px;
}

}

</style>
</head>
<body>
	<div class="containerAdminLogin">
		<div class="form-group">
			<div class="sm-10-AdminLogin">
				<div class="container-sub-AdminLogin">
					<h2>LOGIN</h2>
					<form id="form-signin">
						<input type="text" class="control-AdminLogin" id="u_id" placeholder="ID" name="u_id">
						<input type="password" class="control-AdminLogin" id="u_pw" placeholder="password" name="u_pw">
					</form>
					<button class="btnAdminLogin" type="button" onclick="btn()">로그인</button>
					<%
					if (request.getParameter("error") != null && request.getParameter("error").equals("1")) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");
					}
					%>
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

function btn() {
	var formData = {
		u_id : $("#u_id").val(),
		u_pw : $("#u_pw").val()
	};

	$.ajax({
		type : 'GET',
		data : formData,
		url : "loginAdmin.ko",
		success : function(data) {
			location.href = data;
		}
	});
}

window.onload = function(){ //쿼리스트링 지워주는 친구
	history.replaceState({}, null, location.pathname);
};

// 뒤로가기시 알림창 뜨는 부분 수정. (양예진)
window.onpageshow = function(event){
	if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
		location.href="adminLoginPage.ko";
	}
}
</script>

</body>
</html>
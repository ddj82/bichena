<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%
if (session.getAttribute("userID") != null && session.getAttribute("userID").equals("admin")) {
	response.sendRedirect("admin2.ko");
}
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common/navbar.jsp" %>
<%
if (request.getParameter("email") == null || request.getParameter("email").equals("")) {%>
	<script>location.href="loginPage.ko";</script>
<!-- response.sendRedirect("loginPage.ko"); -->
<%}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비채나</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>

<style>

.idFindSearchSubBox {
    border: 3px solid #2d4739;
    width: 700px;
    height: 350px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
}

.idFindSearchMainBox {
	margin-top: 70px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

div#box1 {
    text-align: center;
    color: #2d4739;
    font-weight: bolder;
    font-size: 20px;
    position: relative;
    top: 50px;
}

a.loginbutton {
    background-color: #005930;
    color: white;
    text-decoration: none;
    width: 150px;
    display: inline-block;
    height: 40px;
    border-radius: 5px;
    text-align: center;
    line-height: 40px;
}

div#finallyPW {
    font-size: 20px;
    color: #2d4739;
}

@media (max-width: 575px) {
	.idFindSearchSubBox {
		width: 324.91px;
	}
	
	a.loginbutton{
		width: 100;
		font-size: 13px;
	}
	
	div#finallyPW{
		 text-align: center;
	}
	
}

span {
    color: #e5c687;
    font-weight: bolder;
}

a.loginbutton:hover{
	background-color:#2d4739;
}

</style>
<script>

$(document).ready(function(){
	if($(window).width() < 768){
		$("#box1").html("회원님의 임시 비밀번호가 <br> 발급되었습니다.");
	}
});

$(window).resize(function() {
	if($(window).width() < 768) { 	
		$("#box1").html("회원님의 임시 비밀번호가 <br> 발급되었습니다.");
	} 
});


$(window).resize(function() {
	if($(window).width() >= 768) { 	
		$("#box1").html("회원님의 임시 비밀번호가 발급되었습니다.");
	} 
});

</script>
</head>
<body>
<% String email = request.getParameter("email"); %>

<div class="idFindSearchMainBox">
	<div class="idFindSearchSubBox">
	<div id="box1">회원님의 임시 비밀번호가 발급되었습니다.</div>
<div id="finallyPW"></div>
	<div id="button">
	<a href="loginPage.ko" class="loginbutton">로그인 하기</a>
	</div>
	</div>
	</div>
</body>
<script>
	let email ="<%=email%>";
		var formData = {
			u_email : email
		};

		$.ajax({
			type : 'POST',
			data : formData,
			url : 'pwFindStart.ko',
			success : function(data) {
				console.log("data : " + data);
				code = data;
				$('#finallyPW').html("<b>회원님의 임시 비밀번호는</b> "+" <span>"+data+"</span> <b>입니다.</b>");
			}
		});
		
		
		window.onload = function(){
			history.replaceState({}, null, location.pathname);
			}
</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>
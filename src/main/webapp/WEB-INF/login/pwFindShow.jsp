<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if (request.getParameter("email") == null || request.getParameter("email").equals("")) {
	response.sendRedirect("loginPage.ko");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>

<style>

.idFindSearchSubBox {
    border: 1px solid black;
    width: 700px;
    height: 350px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
}

.idFindSearchMainBox {
    display: flex;
    flex-direction: column;
    align-items: center;
}

div#box1 {
    text-align: center;
}

a.loginbutton {
    background-color: #d5d5d5;
    color: white;
    text-decoration: none;
    width: 150px;
    heigth: 100px;
    display: inline-block;
    height: 40px;
    border-radius: 5px;
    text-align: center;
    line-height: 40px;
}

div#button {
}

div#finallyPW {
    font-size: 20px;
}

</style>

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
				$('#finallyPW').html("<b>회원님의 비밀번호는</b>"+" <span style='color:#1890ff;'>"+data+"</span> <b>입니다.</b>");
			}
		});
		
		
		history.replaceState({},null,location.pathname);
</script>
</body>
</html>
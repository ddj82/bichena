<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.success {
	width: 500px;
	margin: 0 auto;
}

.do {
	width: 322px;
	padding: 5px;
	height: 40px;
	background-color: rgb(0, 150, 243);
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
}

/* extra small */
@media screen and (max-width:540px) {
	.success {
		width: 320px;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	.success {
		width: 325px;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	.success {
		width: 325px;
	}
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
	.success {
		width: 325px;
	}
	.done {
		width: 300px;
	}
}

</style>
</head>
<body>
	<%@include file="/common/navbar.jsp" %>
	<div class="success">		
		<h1>결제가 완료되었습니다.</h1>
		<form action="myPage.ko" class="done">
			<input class="do" type="submit" value="주문내역 확인하기">
		</form>			
		
	</div>
</body>
</html>
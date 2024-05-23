<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>비채나</title>
<style>
.success {
	width: 420px;
	margin: 0 auto;
	margin-top: 40px;
}
.already {
	font-size: 30px;
	text-align: center;
	font-weight: bold;
}
.do {
	width: 322px;
	padding: 5px;
	height: 40px;
	background-color: #005930;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
	margin-left: 47px;
}
.do:hover {
	background-color: #2d4739;
}
p {
	text-align: center;
}
/* extra small */
@media screen and (max-width:540px) {
	.success {
		width: 320px;
	}
	.do {
		margin-left: 0px;
		width: 320px;
	}
	.already {
		font-size: 20px;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	.success {
		width: 400px;
	}
	.do {
		margin-left: 35px;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	.success {
		width: 395px;
	}
	.do {
		margin-left: 35px;
	}
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
	.success {
		width: 380px;
	}
	.done {
		width: 300px;
	}
	.do {
		margin-left: 25px;
	}
}

</style>
</head>
<body>
<%@include file="/common/navbar.jsp" %>
	<div class="success">
		<c:set var="result" value='<%=request.getParameter("result")%>'/>
		<c:choose>
			<c:when test="${result eq '1'}">
				<h1 class="already">이미 가입된 정보가 있습니다.</h1>
				<form action="loginPage.ko" class="done">
					<input class="do" type="submit" value="로그인하기">
				</form>
				<p>아이디를 잊어버리셨나요?</p>
				<form action="idf.ko" class="done">
					<input class="do" type="submit" value="아이디 찾기">
				</form>
			</c:when>
			<c:otherwise>
				<h1 class="already">회원가입이 완료되었습니다.</h1>
				<p>로그인 후 이용해주세요.</p>
				<form action="loginPage.ko" class="done">
					<input class="do" type="submit" value="로그인하기">
				</form>			
			</c:otherwise>
		</c:choose>
	</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>
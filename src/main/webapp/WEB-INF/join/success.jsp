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

</style>
</head>
<body>
	<div class="success">
		<c:set var="result" value='<%=request.getParameter("result")%>'/>
		<c:choose>
			<c:when test="${result eq '1'}">
				<h1>이미 가입된 정보가 있습니다.</h1>
				<form action="loginPage.ko">
					<input class="do" type="submit" value="로그인하기">
				</form>
				<p>아이디를 잊어버리셨나요?</p>
				<form action="idf.ko">
					<input class="do" type="submit" value="아이디 찾기">
				</form>
			</c:when>
			<c:otherwise>
				<h1>회원가입이 완료되었습니다.</h1>
				<p>로그인 후 이용해주세요.</p>
				<form action="loginPage.ko">
					<input class="do" type="submit" value="로그인하기">
				</form>			
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
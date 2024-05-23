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
	text-align: center;
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
}
.do:hover {
	background-color: #2d4739;
}
.message {
	font-weight: bold;
	font-size: 30px;
	padding: 15px;
	margin-top: 40px;
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
		<div class="message">결제가 완료되었습니다.</div>
		<form action="myPage.ko" class="done">
			<input class="do" type="submit" value="주문내역 확인하기">
		</form>			
		
	</div>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>
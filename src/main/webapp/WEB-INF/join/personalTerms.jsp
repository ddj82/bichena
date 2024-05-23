<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>비채나</title>
<style>
.personal {
	width: 700px;
	margin: 0 auto;
}
.submit {
	margin-top: 40px;
	margin-botoom: 40px;
	width: 300px;
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
.btn-div {
	padding: 0 200px;
}
/* extra small */
@media screen and (max-width:540px) {
	.personal {
		width: 300px;
		margin: 0 auto;
	}
	.btn-div {
		padding: 0;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	.personal {
		width: 400px;
		margin: 0 auto;
	}
	.btn-div {
		padding: 0 50px;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
	
}
</style>
</head>
<body>
<%@include file="/common/navbar.jsp" %>
<div class="personal">
<p>■ 개인정보 수집방법 및 수집·이용 목적</p>
<p>- 홈페이지 회원가입 및 관리</p>
<p>- 재화 또는 서비스 제공</p>
<p>■ 수집하는 개인정보의 항목</p>
<p>- 필수 항목</p>
<p>- 로그인ID, 비밀번호, 이름, 생년월일, 휴대전화번호, 이메일, 자택주소</p>
<p>인터넷 서비스 이용과정에서 개인정보(접속 IP정보, 서비스 이용기록, 접속 로그)는 자동으로 생성되어 수집될 수 있습니다.</p>
<p>■ 개인정보 보유 및 이용기간</p>
<p>- 보유근거 : 개인정보보호법 제15조(개인정보의 수집ㆍ이용), 도서관법 제28조(업무)</p>
<p>■ 보유·이용 기간</p>
<p>- 1년 동안 로그인 이력이 없는 웹 회원과 2년 동안 대출 및 좌석발급 이력이 없는 관외대출회원은 매 분기에 파기</p>
<p>- 탈퇴 신청 회원은 6개월 보관 후 파기</p>
<p>■ 수집 및 이용에 동의하지 않을 경우의 처리</p>
<p>- 신청자는 개인정보 수집·이용에 동의를 거부할 권리가 있습니다.</p>
<p>- 필수 항목의 수집·이용을 동의하지 않는 경우 비체나의 웹 회원가입이 불가합니다.</p>
<p>- 선택 항목의 수집·이용을 동의하지 않는 경우 비체나의 홍보자료를 수신하실 수 없습니다.</p>
<div class="btn-div">
	<input type="button" value="이전" id="submit" class="submit" onclick="history.back()">
</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>
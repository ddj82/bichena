<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<script src="resources/js/check.js"></script>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="../user/myPageHeader.jsp" %>
<div class="container">
	<h2>비밀번호 변경</h2>
	<form class="chanMypw" name="pwChan" id="pwChan" action="updatePw.ko" method="post" onSubmit="return pwchk()">
		<div class="item_name">비밀번호</div>
		<small>영문 대소문자,특수문자,숫자 포함 8~15자로 입력하세요.</small>
		<div class="form_item">
			<div onclick="pwInput()">
				<input type="password" id="pw" name="u_pw" placeholder="비밀번호를 입력해 주세요.">
			</div>
		</div>
		<div id="pwErrorMessage" style="display: none; color: red;">
			<small>* 비밀번호를 올바른 형식으로 입력해주세요.</small>
		</div>
		<div class="item_name">비밀번호 확인</div>
		<div class="form_item">
			<div onclick="pw1Input()">
				<input type="password" id="pw1" name="pw1" placeholder="비밀번호를 입력해 주세요.">
			</div>
		</div>
		<div id="pw1ErrorMessage" style="display: none; color: red;">
			<small>* 위 비밀번호와 일치시켜 주세요.</small>
		</div>
		<button type="button" onclick="javascript:history.go(-1)">뒤로 가기</button>
		<button type="submit">변경하기</button>
	</form>
</div>
</body>
</html>
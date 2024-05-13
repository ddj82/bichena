<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보(+수정)</title>
<style>

.container-sel {
	width: 1000px;
	margin: 0 auto;
	margin-top: 30px;
	padding: 20px;
	border: 1px solid rgb(224, 224, 224);
  	border-radius: 10px;
}

td {
	padding: 5px;
}
</style>
<script>
	function delUser() {
		if (window.confirm("정말로 탈퇴하시겠습니까?")) {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "delUser.ko", true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4) {
					if (xhr.status === 200) {
						alert("탈퇴되었습니다.");
						window.location.href = "loginPage.ko";
					} else {
						alert("오류가 발생했습니다. 다시 시도해주세요. 오류 코드: " + xhr.status);
					}
				}
			};
			xhr.send();
		}
	}
	
	function changePw(){
		window.location.href = "changePwForm.ko";		
	}
	
</script>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="../user/myPageHeader.jsp" %>
	<div class="container-sel">
<!-- 	<div class="container"> -->
		<div class="inner-title"><h3>${users.u_nick}님 회원정보</h3></div>
		<form action="infoForm.ko" class="uMyPage" name="uMyPage" method="post">
		<button type="submit" class="btn btn-outline-primary btn-sm">정보 수정하기</button>
			<table>
				<tr>
					<td>회원명</td>
					<td>${users.u_name}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${users.u_nick}</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><button type="button" onclick="changePw()" class="btn btn-outline-primary btn-sm">비밀번호 변경</button></td>
				</tr>				
				<tr>
					<td>이메일</td>
					<td>${users.u_email}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${users.u_tel}</td>
				</tr>
			</table>
			<div>
				<button type="button" onclick="delUser();" class="btn btn-outline-danger btn-sm">회원 탈퇴</button>
			</div>
		</form>
	</div>
</body>
</html>
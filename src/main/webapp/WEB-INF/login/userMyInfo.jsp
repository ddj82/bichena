<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보(+수정)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
#nc {
	border: none;
}

.container-sel {
	width: 500px;
	margin: 0 auto;
	border: black solid 1px;
	padding: 50px;
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
</script>
</head>
<body>
	<div class="container-sel">
		<h3>${users.u_nick}님회원정보</h3>
		<form action="modify.ko" class="uMyPage" name="uMyPage" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td>${users.u_id}</td>
				</tr>

				<tr>
					<td>닉네임</td>
					<td>${users.u_nick}</td>
				</tr>
				<tr>
					<td>등급</td>
					<td>${users.u_lev}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${users.u_name}</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>${users.u_tel}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${users.u_email}</td>
				</tr>
			</table>
			<div>
				<button type="submit">정보 수정하기</button>
				<button type="button" onclick="delUser();">회원 탈퇴</button>
			</div>
		</form>
	</div>
</body>
</html>
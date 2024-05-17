<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>계정 탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
.container#containerPw{
	display: flex;
	justify-content: center;
	width: 1000px;
	margin: 50px auto;
	padding: 50px 20px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
 	}

.conPwForm#conForm {
	width: 40%;
	height: 300px;
	}
	
.conPwForm h4.conPwTitle {
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

 .confirmPw {
	margin-top: 10px;
} 

.confirmPw p small {
    font-weight: 700;
    text-align: center;
    color: #333;
    padding: 20px 0; 
}

.confirmPw input[type=password] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.confirmPw input[type=submit] {
	width: 100%;
	padding: 10px;
	background-color: #17884a;
	border: none;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
}

.confirmPw input[type=submit]:hover {
	background-color: #27DB77;
}
</style>
</head>
<body>
<jsp:include page="../../common/navbar.jsp"/>
	
	<div class="container" id="containerPw">
		<div class="delAccForm" id="delAccForm">
				<form action="main.ko" class="delAccCon" id="delAccCon" method="post">
					<h4 class="conPwTitle">비밀번호 재확인</h4>
					<p style="text-align:center;"><small>계정 삭제를 위해 비밀번호를 다시 한 번 입력해주세요.</small></p>
					<div class="form_item">${users.u_nick}</div>
					<input type="password" id="upw" name="u_pw" placeholder="비밀번호를 입력해주세요." maxlength="16" pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+">
					<input type="button" id="confirmDel" onclick="passChk()" value="탈퇴 확인">
					<input type="submit" id="cancleDel" value="탈퇴 취소"> <!-- 홈으로 가도록 -->
				</form>
		</div>
	</div>
<%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
	// 특정 입력 필드 가져오기
	var inputField = document.getElementById("delAccCon");

	// 입력 필드에 포커스될 때 엔터 키 이벤트 처리
	inputField.addEventListener("keydown", function(event) {
		// 엔터 키가 눌렸을 때 기본 이벤트(폼 제출) 막기
		if (event.key === "Enter") {
			event.preventDefault();
			passChk();
		}
	});
});

function passChk() {
	let upw = document.getElementById('upw').value;
	if (upw == '') {
		alert("비밀번호를 입력해주세요.");
	} else {
		let pwval = {
			"u_pw" : upw
		}

		$.ajax({
			url : "reconPw.ko",
			type : "post",
			data : pwval,
			dataType : "json",
			success : function(data) {
				console.log('비밀번호 재확인!');
				if (data == 1) {
					alert("이용해 주셔서 감사합니다.");
					location.href = 'delUser.ko';
				} else {
					console.log('');
				}
			},
			error : function(err) {
				console.log('error : ', err);
			}
		});

	}
	console.log(upw);
}



</script>
</html>
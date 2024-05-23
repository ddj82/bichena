<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비채나</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
body {
    margin: 0;
    padding: 0;
}

.container#containerPw{
	display: flex;
    justify-content: center;
    width: 100%;
    max-width: 1000px;    
    margin: 50px auto;
    padding: 50px 20px;
    border: 1px solid #e0e0e0; 
    border-radius: 10px;
 	}

.delAccForm#delAccForm {
	width: 40%;
    margin: 20px 0 20px 0;
	}
	
.conPwTitle {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
    font-weight: bold;
    text-align: center;
	margin-bottom: 13px;
}

p.del-conPw {
	font-size: 15px;
    line-height: 10px;
    font-weight: 700;
	text-align: center;	
    color: #333;
    padding: 10px 0; 
}

 .confirmPw {
	margin-top: 10px;
} 

.pwBtn {
    display: flex;
    justify-content: space-between;
}

.delAccCon input[type=password] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.pwBtn input {
    background-color: #88958e;
    border: none;
    border-radius: 5px;
    color: #fff;
    padding: 10px 15px;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
    width: 80px;
    padding: 5px 10px;
}

.pwBtn input:hover {
    background-color: #bbb;
}

.pwBtn input[type="button"] {
    background-color: #0a6633e5;
    color: #fff;
    font-weight: bold;
}

.pwBtn input[type="button"]:hover {
    background-color: #2d4739;
}


.pwBtn input[type="button"] {
    width: 150px;
}

input#cancleDel {
    width: 150px;
}

</style>

<style>

/* extra small */
@media screen and (max-width:540px) {
.delAccForm#delAccForm {
    width: 300px;
}

form#delAccCon {
    display: flex;
    flex-direction: column;
    align-items: center;
}

	.container#containerPw {
    width: 350px;
}

p.del-conPw {
    line-height: 23px;
}

.delAccCon input[type=password] {
    margin-bottom: 10px;
}

h2.conPwTitle {
    line-height: 36px;
}


p.del-conPw {
    width: 197px;
    font-size: 14px;
}

h2.conPwTitle {
    width: 176px;
}

input#upw {
    width: 211px;
    font-size: 14px;
}

.pwBtn {
    width: 211px;
}

input#cancleDel {
    width: 90px;
}

.pwBtn input[type="button"] {
    width: 90px;
}

}


/* small */
@media screen and (min-width:541px) and (max-width:720px) {

.delAccForm#delAccForm {
    width: 283px;
}

.container#containerPw {
   width: 525px;
}

p.del-conPw {
    font-size: 14px;
}

input#cancleDel {
    width: 110px;
}

.pwBtn input[type="button"] {
    width: 110px;
}


}


/* medium */
@media screen and (min-width:721px) and (max-width:960px) {

.delAccForm#delAccForm {
    width: 283px;
}

.container#containerPw {
	width: 662px;
}

p.del-conPw {
    font-size: 14px;
}

input#cancleDel {
    width: 110px;
}

.pwBtn input[type="button"] {
    width: 110px;
}

}


/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
.container#containerPw {
    width: 750px;
}

p.del-conPw {
    font-size: 14px;
}

input#cancleDel {
    width: 110px;
}

.pwBtn input[type="button"] {
    width: 110px;
}

}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
	
<div class="container" id="containerPw">
	<div class="delAccForm" id="delAccForm">
		<form action="main.ko" class="delAccCon" id="delAccCon" method="post">
			<h2 class="conPwTitle">비밀번호 재확인</h2>
				<p class="del-conPw">계정 탈퇴를 위해 비밀번호를 입력해주세요.</p>
				<input type="password" id="upw" name="u_pw" placeholder="비밀번호를 입력해주세요.">
            <div class="pwBtn">
				<input type="submit" id="cancleDel" value="취소"> <!-- 홈으로 가도록 -->
				<input type="button" id="confirmDel" onclick="passChk()" value="확인">
			</div>
		</form>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
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
					alert("비밀번호를 다시 확인해주세요.");
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
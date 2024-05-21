<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 재확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
body {
    margin: 0;
    padding: 0;
}

.container#containerPw{
	display: flex;
	justify-content: center;
	width: 1000px;
	margin: 50px auto;
	padding: 50px 20px;
  	border: 1px solid #e0e0e0;;  
    border-radius: 8px;
}

.conPwForm#conForm {
	width: 40%;
	height: 300px;
    margin-top: 50px;
}
	
.conPwForm h2.conPwTitle {
	margin-bottom: 20px;
    font-size: 24px;
    color: #333;
    font-weight: bold;
	text-align: center;
	margin-bottom: 13px;
}

 .confirmPw {
	margin-top: 10px;
} 

p.del-conPw {
	font-size: 15px;
    line-height: 10px;
    font-weight: 700;
    text-align: center;
    color: #333;
    padding: 10px 0; 
}

.confirmPw input[type=password] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.confirmPw input[type=button] {
	width: 100%;
	padding: 10px;
	background-color: #005930;
	border: none;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
}

.confirmPw input[type=button]:hover {
	background-color: #B8B388;
}

/* extra small */
@media screen and (max-width: 540px) {
    .container#containerPw {
        width: 90%;
        padding: 20px 10px;
        margin: 20px auto;
    }

    .conPwForm#conForm {
        width: 100%;
    }

    .confirmPw input[type=password],
    .confirmPw input[type=button] {
        width: 100%;
    }
}

/* small */
@media screen and (min-width: 541px) and (max-width: 720px) {
    .container#containerPw {
        width: 90%;
        padding: 20px 10px;
        margin: 30px auto;
    }

    .conPwForm#conForm {
        width: 100%;
    }

    .confirmPw input[type=password],
    .confirmPw input[type=button] {
        width: 100%;
    }
}

/* medium */
@media screen and (min-width: 721px) and (max-width: 960px) {
    .container#containerPw {
        width: 80%;
        padding: 30px 15px;
        margin: 40px auto;
    }

    .conPwForm#conForm {
        width: 60%;
    }

    .confirmPw input[type=password],
    .confirmPw input[type=button] {
        width: 100%;
    }
}

/* large */
@media screen and (min-width: 961px) and (max-width: 1140px) {
    .container#containerPw {
        width: 70%;
        padding: 40px 20px;
        margin: 50px auto;
    }

    .conPwForm#conForm {
        width: 50%;
    }

    .confirmPw input[type=password],
    .confirmPw input[type=button] {
        width: 100%;
    }
}
</style>
</head>
<body>
<jsp:include page="../../common/navbar.jsp"/>
<jsp:include page="/WEB-INF/user/myPageHeader.jsp"/>
	
	<div class="container" id="containerPw">
		<div class="conPwForm" id="conForm">
				<form class="confirmPw" id="confirmPw" method="post">
					<h4 class="conPwTitle">비밀번호 재확인</h4>
					<p><small>개인정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.</small></p>
					<input type="password" id="upw" name="u_pw" placeholder="비밀번호를 입력해주세요." maxlength="16" pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+">
					<input class="btn btn-primary" type="button" id="passPW" onclick="passChk()" value="확인">
				</form>
		</div>
	</div>
<%-- <jsp:include page="../common/footer.jsp"/> --%>
</body>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		// 특정 입력 필드 가져오기
		var inputField = document.getElementById("confirmPw");
	
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
				cache : false,
				async : false,
				success : function(data) {
					console.log('비밀번호 재확인!');
					if (data == 1) {
						location.href = 'userInfo.ko';
					} else {
						alert('비밀번호를 다시 확인해주세요.');
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
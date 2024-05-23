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
width: 100%;
max-width: 1000px;
margin: 50px auto;
padding: 50px 20px;
}

.conPwForm#conForm {
width: 40%;
height: 300px;
margin-top: 50px;
}
	
.conPwForm h2.conPwTitle {
margin-bottom: 10px;
font-size: 24px;
color: #333;
font-weight: bold;
text-align: center;
}

.confirmPw {
margin-top: 10px;
} 

p.del-conPw {
font-size: 15px;
font-weight: 700;
text-align: center;
color: #333;
padding: 10px 0;
white-space: pre-line;
line-height: inherit;
}

.confirmPw input[type=password] {
width: 100%;
padding: 10px;
margin-bottom: 10px;
border: 1px solid #ccc;
border-radius: 5px;
font-size: 15px;
}

.confirmPw input[type=button] {
width: 100%;
padding: 10px;
background-color: #0a6633e5;
border: none;
border-radius: 5px;
color: #fff;
cursor: pointer;
}

.confirmPw input[type=button]:hover {
background-color: #2d4739;
}


/* extra small */
@media screen and (max-width: 540px) {
    .container#containerPw {
        width: 90%;
        padding: 20px 10px;
        margin: 20px auto;
    }

	.conPwForm h2.conPwTitle {
		font-size: 22px;
	}
	
    .conPwForm#conForm {
        width: 100%;
    }

    .pwConBtn {
        width: 100%;
        margin: 0 auto;
    }
    
    .confirmPw input[type=password] {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 10px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	}
    
	p.del-conPw {
	    font-size: 15px;
	    line-height: 21px;
	    font-weight: 700;
	    text-align: justify;
	    color: #333;
	    padding: 10px 0;
	}
}

/* small */
@media screen and (min-width: 541px) and (max-width: 720px) {
    .container#containerPw {
        width: 60%;
        padding: 20px 10px;
        margin: 30px auto;
    }

    .conPwForm#conForm {
        width: 100%;
    }
    
     p.del-conPw{
    	font-size: 14px;
    	white-space: pre-line;
    	line-height: inherit;
    }
    
	.conPwForm h2.conPwTitle {
    	font-size: 22px;
    }
    
    .confirmPw input[type=password] {
		font-size: 13px;
	}

    .pwConBtn {
        width: 100%;
    }
}

/* medium */
@media screen and (min-width: 721px) and (max-width: 960px) {
    .container#containerPw {
        width: 90%;
        padding: 30px 15px;
        margin: 40px auto;
    }
    
     p.del-conPw{ 
     	font-size: 14px; 
     	white-space: pre-line; 
     } 

    .conPwForm#conForm {
        width: 60%;
    }
	.confirmPw input[type=password] {
		font-size: 14px;
	}
	
    .pwConBtn {
        width: 100%;
        margin: 0 auto;
    }
}

/* large */
@media screen and (min-width: 961px) and (max-width: 1140px) {
    .container#containerPw {
        width: 100%;
        padding: 40px 20px;
        margin: 50px auto;
    }

    .conPwForm#conForm {
        width: 50%;
    }

	.conPwBox{
		width: 90%;
        padding: 0 20px;
        margin: 0 auto;
	}
	
	.confirmPw input[type=password] {
		font-size: 14px;
	}
	
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="../user/myPageHeader.jsp" %>
	
<div class="container" id="containerPw">
	<div class="conPwForm" id="conForm">
		<form class="confirmPw" id="confirmPw" method="post">
			<h2 class="conPwTitle">비밀번호 재확인</h2>
			<div class="conPwBox">
				<p class="del-conPw">개인정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.</p>
				<div class="pwConBtn">
					<input type="password" id="upw" name="u_pw" placeholder="비밀번호를 입력해주세요." maxlength="16" pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+">
					<input type="button" id="passPW" onclick="passChk()" value="확인">
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
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
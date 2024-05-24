<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
body {
    margin: 0;
    padding: 0;
}

.container#container-pwChan {
    display: flex;
    justify-content: center;
	width: 446px;
    max-width: 1000px;
    margin: 50px auto;
    padding: 50px 20px;
}

.info-box#info-box {
    width: 100%;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

.chanMypw h4.conPwTitle {
    margin-bottom: 10px;
    font-weight: bold;
}

.chanMypw p {
    color: #666;
    margin-bottom: 35px;
    font-size: 14px;
}

.item_name {
    margin-bottom: 5px;
    color: #000;
    font-weight: bold;
    font-size: 16px;
}

.pwdForm {
    margin-top: 20px;
}

.form_item input[type=password] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 1em;
}

.pwBtn {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.pwBtn button {
    background-color: #005930;
    border: none;
    border-radius: 5px;
    color: #fff;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 1em;
    font-weight: bold;
}

.pwBtn button:hover {
    background-color: #D4A035;
}

.pwBtn button[type="button"] {
	background-color: #88958e;
    color: #fff;
    font-weight: bold;
}

.pwBtn button[type="button"]:hover {
    background-color: #bbb;
}

.pwBtn button[type="submit"]:hover {
    background-color: #005930;
}

#pwErrorMessage,
#pw1ErrorMessage {
    display: none;
    margin-bottom: 30px;
}


</style>
    
<style>

/* extra small */
@media screen and (max-width:540px) {
	p {
		font-size: 15px;
	}

	.container#container-pwChan {
	    width: auto;
	    margin-top: 0;
	}

	.pwBtn button[type="button"] {
	    width: 110px;
	}

	.pwBtn button {
	    width: 110px;
	}
}


/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	p {
		font-size: 15px;
	}
	
	.container#container-pwChan {
	    width: 400px;
	    margin-top: 0;
	}
	
	.pwBtn button[type="button"] {
	    width: 135px;
	}
	
	.pwBtn button {
	    width: 135px;
	}

}

/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	p {
	    font-size: 15px;
	}
	
	.container#container-pwChan {
	    width: 400px;
	    margin-top: 0;
	}
	
	.pwBtn button[type="button"] {
	    width: 135px;
	}
	
	.pwBtn button {
	    width: 135px;
	}
}

/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
}


</style>
<script>
function insertchk() {
    var istrue = true;

    var pw = document.getElementById('pw');
    var pw1 = document.getElementById('pw1');

    var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;

    var pwErrorMessage = document.getElementById('pwErrorMessage');
    var pw1ErrorMessage = document.getElementById('pw1ErrorMessage');

    if (pw.value == '' || pw.value == null || !pwPattern.test(pw.value)) {
        pw.focus();
        pwErrorMessage.style.display = 'block';
        istrue = false;
    }
    if (pw1.value != pw.value) {
        pw1.focus();
        pw1ErrorMessage.style.display = 'block';
        istrue = false;
    }

    console.log(istrue);
    return istrue;
}

function pwInput() {
    var pw = document.getElementById('pw');
    var pwErrorMessage = document.getElementById('pwErrorMessage');

    pw.focus(); // Focus on the input field

    pw.addEventListener('input', function() {
        var pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/; // 정규 표현식 패턴
        var pwvalue = pw.value.trim();
        if (!pattern.test(pwvalue)) {
            pwErrorMessage.style.display = 'block'; // Display error message				
        } else {
            pwErrorMessage.style.display = 'none'; // Hide error message
        }
    });
}

function pw1Input() {
    var pw1 = document.getElementById('pw1');
    var pw1ErrorMessage = document.getElementById('pw1ErrorMessage');
    var pw = document.getElementById('pw');

    pw1.focus(); // Focus on the input field

    pw1.addEventListener('input', function() {
        var pw1value = pw1.value.trim();
        if (pw1value == '' || pw1value != pw.value.trim()) {
            pw1ErrorMessage.style.display = 'block'; // Display error message
        } else {
            pw1ErrorMessage.style.display = 'none'; // Hide error message
        }
    });
}
</script>
</head>

<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="../user/myPageHeader.jsp" %>

<div class="container" id="container-pwChan">
    <div class="info-box" id="info-box">
        <form class="chanMypw" name="pwChan" id="pwChan" action="updatePw.ko" method="post" onSubmit="return insertchk()">
            <h4 class="conPwTitle">비밀번호 변경</h4>
            <p>※&nbsp;영문 대소문자,특수문자,숫자 포함 8~15자로 입력하세요.</p>
            <div class="pwdForm">
                <div class="item_name">비밀번호</div>
                <div class="form_item">
                    <div onclick="pwInput()">
                        <input type="password" id="pw" name="u_pw" placeholder="비밀번호를 입력해 주세요.">
                    </div>
                </div>
                <div id="pwErrorMessage" style="display: none; color: red;">
                    <small>* 비밀번호를 올바른 형식으로 입력해주세요.</small>
                </div>
                <div class="pwdForm">
                    <div class="item_name">비밀번호 확인</div>
                    <div class="form_item">
                        <div onclick="pw1Input()">
                            <input type="password" id="pw1" name="pw1" placeholder="비밀번호 확인">
                        </div>
                    </div>
                </div>
            </div>
                <div id="pw1ErrorMessage" style="display: none; color: red;">
                    <small>* 위 비밀번호와 일치시켜 주세요.</small>
                </div>
            <div class="pwBtn">
                <button type="button" onclick="javascript:history.go(-1)">뒤로 가기</button>
                <button type="submit">변경하기</button>
            </div>
   	 </form>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>

</html>
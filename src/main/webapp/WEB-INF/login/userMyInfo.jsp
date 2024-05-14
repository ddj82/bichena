<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
.container#container-Info {
	display: flex;
	justify-content: center;
	width: 1000px;
	margin: 50px auto;
	padding: 50px 20px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	}

.info-box#info-box {
	width: 800px;
 	display: inline;  
	}
	
.infoContent{
	margin: 30px 0;
}
        
.box-top{
	border-bottom: 1px solid black;
	vertical-align: middle;
	padding: 10px 0;
	}

.uMyPage button[type=button] {
	/* float: right;
	padding: 5px;
	background-color: #7C93F5;
	border: none;
	border-radius: 5px;
	color: white; */
	float: right;
	padding: 5px;
	background-color: transparent; 
	border: none;
	border-radius: 5px;
	color: #7C93F5;
	font-weight: bold;
	text-decoration: underline;
	}

/* .uMyPage button#delBtn {
	float: right;
	padding: 5px;
	background-color: transparent; 
	border: none;
	border-radius: 5px;
	color: #7C93F5;
	font-weight: bold;
	text-decoration: underline;
	} */
	
.uMyPage button[type=submit] {
	float: right;
	width: 8%;
	padding: 5px;
	background-color: transparent; 
	border: none;
	border-radius: 5px;
	color: #7C93F5;
	font-weight: bold;
	text-decoration: underline;
	}

/* .uMyPage button[type=button]:hover { */
/* 	background-color: #AAB6F0; */
/* 	} */

.uMyPage button[type=submit]:hover, button[type=button]:hover  {
	color: #AAB6F0;
	font-weight: bold;
	}
	
.uMyPage button#delBtn:hover{
	color: #AAB6F0;
	font-weight: bold;
	}
	
#delBtn {
	margin-top: 20px;
	}

.item_box{
    display: flex;
    justify-content: space-between;	
    margin: 10px 20px;
	padding: 10px;
	font-size: 18px;
	}

.item_name {
	color: gray;
	}

.item_name, .form_item {
    display: inline-block;
    vertical-align: middle;
    font-weight: bold;
}

.infoDel {
	border-top: 1px solid black;
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

        function changePw() {
            window.location.href = "changePwForm.ko";
        }
    </script>
</head>

<body>
<jsp:include page="../../common/navbar.jsp" />
<jsp:include page="/WEB-INF/user/myPageHeader.jsp" />

<div class="container" id="container-Info">
    <div class="info-box" id="info-box">
        <form action="infoForm.ko" class="uMyPage" name="uMyPage" method="post">
            <div class="infoFormbox" id="infoFormbox">
                <div class="box-top">
                    <button type="submit">수정</button>
                    <h3>${users.u_nick}님 회원정보</h3>
                </div>
                <div class="infoContent">
                	<div class="item_box">
                		<div class="item_name">회원명</div>
                   		<div class="form_item ">${users.u_name}</div>
                    </div>
                    <div class="item_box">
                    	<div class="item_name">닉네임</div>
                    	<div class="form_item ">${users.u_nick}</div>
                    </div>
                    <div class="item_box">
                        <div class="item_name">비밀번호</div>
                        <div class="form_item "><button type="button" onclick="changePw()">비밀번호 변경</button></div>
                    </div>
                    <div class="item_box">
                    	<div class="item_name">이메일</div>
                    	<div class="form_item ">${users.u_email}</div>
                    </div>
                    <div class="item_box">
                    	<div class="item_name">전화번호</div>
                    	<div class="form_item ">${users.u_tel}</div>
                    </div>
                </div>
                <div class="infoDel">
                    <button type="button" id="delBtn" onclick="delUser();">회원 탈퇴</button>
                </div>
    		 </div>
        </form>
	</div>
</div>
    <%-- <jsp:include page="/WEB-INF/common/footer.jsp"/> --%>
</body>

</html>
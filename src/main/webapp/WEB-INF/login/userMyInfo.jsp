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
body {
    margin: 0;
    padding: 0;
}
.container#container-Info {
	display: flex;
	justify-content: center;
	width: 1040px;
	margin: 50px auto;
	padding: 50px 20px;
	border: 1px solid #e0e0e0;
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
	border-bottom: 2px solid #e0e0e0;
	vertical-align: middle;
	padding: 10px 5px;
	}

.uMyPage button[type=button], button[type=submit] {
	float: right;
    padding: 5px 10px;
    background-color: #005930;
    border: none;
    border-radius: 8px;
    color: white;
    font-weight: bold;
    font-size: 16px;
	}
	
.uMyPage button[type=button]#delBtn{
    background-color: transparent;
    border: none;
	color: black;
	font-weight: normal;
	margin-top: 20px;
	float: left;
	text-decoration: none;
	
}

.uMyPage button[type=submit]:hover, button[type=button]:hover  {
	background-color: #e6e5d58c;
	color:  #4a4a4a;
	font-weight: bold;
	}
	
.uMyPage button#delBtn:hover{
	color: #4a4a4a;
	font-weight: bold;
	}
	
.item_box{
    display: flex;
    justify-content: space-between;	
    margin: 10px 20px;
	padding: 10px;
	font-size: 18px;
	align-items: center;
	color: #4a4a4a;
	}

.item_name {
	color: #4a4a4a;
	display: inline-block;
    vertical-align: middle;
    font-weight: bold;
	}

.form_item {
    display: inline-block;
    vertical-align: middle;
    font-weight: bold;
    font-size:
}

.infoDel {
	border-top: 2px solid #e0e0e0;
}

/* extra small */
@media screen and (max-width:540px) {
    .container#container-Info {
    	width: 100%;
        margin: 20px auto;
        padding: 20px;
    }
    .info-box#info-box {
        width: 100%;
    }
    .item_box {
        flex-direction: column;
        align-items: center;
        font-size: 16px;
    }
    
    .item_name, .form_item {
        width: 100%;
        text-align: center;
    }
    .uMyPage button[type=button], button[type=submit] {
        width: 100%;
        margin-top: 10px;
        float: none;
    }
    .uMyPage button[type=button]#delBtn {
     	width: 100%;
        text-align: left;
    }
}

/* small */
@media screen and (min-width:541px) and (max-width:720px) {
    .container#container-Info {
        width: 100%;
        margin: 30px auto;
        padding: 30px;
    }
    .info-box#info-box {
        width: 100%;
    }
    .item_box {
        align-items: flex-start;
        font-size: 16px;
    }
    .uMyPage button[type=button], button[type=submit] {
        width: auto;
        margin-top: 10px;
    }
    .uMyPage button[type=button]#delBtn {
        float: none;
    }
}

/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
    .container#container-Info {
        width: 100%;
        margin: 40px auto;
        padding: 40px;
    }
    .info-box#info-box {
        width: 100%;
    }
    .item_box {
        align-items: flex-start;
        font-size: 17px;
    }
    .uMyPage button[type=button], button[type=submit] {
        width: auto;
        margin-top: 10px;
    }
    .uMyPage button[type=button]#delBtn {
        float: none;
    }
}

/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
    .container#container-Info {
        width: 100%;
        margin: 50px auto;
        padding: 50px 20px;
    }
    .info-box#info-box {
        width: 100%;
    }
    .item_box {
        flex-direction: row;
        align-items: center;
        font-size: 18px;
    }
    .uMyPage button[type=button], button[type=submit] {
        width: auto;
        margin-top: 0;
    }
    .uMyPage button[type=button]#delBtn {
        float: left;
    }
}
</style>
<script>
function changePw() {
	window.location.href = "changePwForm.ko";
}

function goDelAcc(){
	location.href = "delAcc.ko";
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
                    <h3 style="font-weight: bold;">${users.u_nick}님 회원정보</h3>
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
                    <button type="button" id="delBtn" onclick="goDelAcc()">회원 탈퇴&nbsp;&gt;</button>
                </div>
    		 </div>
        </form>
	</div>
</div>
    <%-- <jsp:include page="/WEB-INF/common/footer.jsp"/> --%>
</body>

</html>
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

.container#container-delAccInfo {
    display: flex;
    justify-content: center;
    width: 100%;
    max-width: 1000px;    
    margin: 50px auto;
    padding: 50px 20px;
/*     border: 1px solid #e0e0e0; */
    border-radius: 10px;
}

.info-box#info-box {
	width: 100%;
	max-width: 800px;
	display: inline;
}

.infoTitle {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
    font-weight: bold;
}

p.del-guaidance {
	font-size: 15px;
    line-height: 10px;
/*     margin: 0;  */
}

p.guidance {
    font-size: 15px;
    font-weight: bold;
    line-height: 25px;
    color: red;
   }

.wrapSign {
	width: 310px;
	margin: 0 auto;
	margin-top: 30px;
}

.form1 {
	margin-top: 30px;
}

.div1 {
	width: 600px;
	padding: 0px 0px 0px 3px;
	display: flex;
	justify-content: center;
	margin: 0 auto;
}

#delBtn {
	margin-top: 10px;
	width: 300px;
	padding: 5px;
	background-color: #0a6633e5;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
	height: 40px;
}

#delBtn:disabled {
	cursor: default;
	background-color: #C3C3C3 !important;
	color: rgba(61, 61, 61, 0.3) !important;
}

input[type="checkbox"] {
	border: none;
	zoom: 1.5;
	position: relative;
	top: 3.5px;
	margin-right: 8px;
	cursor: pointer;
}

input[type="checkbox"]:hover {
 	transform: scale3d(1, 1, 1);
}

p.must {
	color: #000;
	text-decoration-line: none;
	font-weight: bold;
	font-size: 15px;
}

pre {
    background-color: #f4f4f4;
    padding: 30px 25px;
    border-radius: 5px;
    border: 1px solid #e0e0e0;
    white-space: pre-wrap;
    word-wrap: break-word;
    font-size: 15px;
    margin: 20px 0;
    line-height: 1.5;
}

#clauseAll {
	margin-right: 10px;
}

input#delBtn:hover{
	background-color:#2d4739;
}
</style>

<style>

/* extra small */
@media screen and (max-width:540px) {
input#clause1 {
    margin-right: 4px;
    margin-left: 0px;
}

p.must {
    font-size: 14px;
}

p.guidance {
    font-size: 14px;
}

p.del-guaidance {
    line-height: 22px;
}

.info-box#info-box {
    width: 338px;
}

.form1 {
    margin-top: 30px;
    display: flex;
    justify-content: center;
}

.form2 {
    
    width: 450px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.div1 {
    width: auto;
    display: block;
}

.container#container-delAccInfo {
    padding: 0px 0px;
}
}

/* small */
@media screen and (min-width:541px) and (max-width:720px) {
.container#container-delAccInfo {
    padding: 0px 0px;
}

	.form1 {
    margin-top: 30px;
    display: flex;
    justify-content: center;
    
}

.form2 {
    width: 500px;
    
        margin: 0 10px;
}

.div1 {
    width: auto;
}

p.del-guaidance {
    font-size: 13.5px;
}

}

/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
.container#container-delAccInfo {
    padding: 0px 0px;
}

.form1 {
    margin-top: 30px;
    display: flex;
    justify-content: center;
}

.form2 {
	    width: 642px;
	}
	
.div1 {
    width: auto;
}
}

/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
.container#container-delAccInfo {
    width: auto;
}

}

</style>


</head>
<body>
<%-- <%@ include file="../../common/navbar.jsp" %> --%>

<div class="container" id="container-delAccInfo">
	<div class="info-box" id="info-box">
		<form class="form1" name="form1" id="delAcct">
			<div class="form2">
				<h2 class="infoTitle">회원 탈퇴 안내</h2>
				<p class="del-guaidance">회원 탈퇴를 진행하기 전에 안내 사항을 꼭 확인해주세요.</P>
				<p class="del-guaidance">탈퇴한 아이디는 재사용 및 복구가 불가하오니 신중하게 선택하시기를 바랍니다.</p>
				<div>
					<pre>
1) 회원 정보, 메일, 주소 등 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. 개인정보가 필요한 비채나의 모든 웹서비스 이용이 불가합니다.
					
2) 회원 탈퇴 후에도 작성하신 q&a와 리뷰는 자동 삭제되지 않고 그대로 남아 있습니다. 탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없기 때문에 리뷰를 임의로 삭제해 드릴 수 없습니다. 삭제를 원하시는 게시글이 있다면 반드시 해당 게시물을 삭제하신 후 탈퇴를 진행하시길 바랍니다.
					
3) 해당 아이디로 더 이상 비채나에 로그인 하실 수 없으시며, 다시 이용하시기를 원하신다면 새로 가입을 해주셔야 합니다.
					
4) 회원 탈퇴 후 모든 비채나 웹서비스 내에서의 계약 또는 청약 철회 등에 관한 기록은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 5년간 보관되며, 이를 위한 고객님의 개인정보는 관례 법률에 따른 보유 목적 외에 다른 목적으로는 이용되지 않습니다.</pre>
				</div>

				<p class="guidance">
				탈퇴 후에는 해당 아이디로 다시 가입하실 수 없으며 아이디와 데이터는 복구할 수 없습니다. 웹서비스에 남아있는 게시글은 탈퇴 후 삭제하실 수 없습니다.
				</p>
				<label>
					<p class="must"> <input type="checkbox" name="clause" id="clause1" value="agree">안내 사항을 모두 확인하였으며, 이에 동의합니다.</p>
				</label>

				<div id="div1" class="div1">
					<input type="button" value="회원 탈퇴" id="delBtn" class="delBtn" onclick="delConfirm()" disabled>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
document.form1.clause1.onclick = function() {
	let clause1 = document.form1.clause1.checked;
	if (!clause1) {
		document.form1.delBtn.disabled = true;
	} else if (clause1) {
		document.form1.delBtn.disabled = false;
	}
}

function delConfirm() {
	location.href = "delConfirm.ko";
}
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>비채나</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
.container#container-delAccInfo {
	display: flex;
	justify-content: center;
	width: 1040px;
	margin: 50px auto;
	padding: 50px 20px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
	}
	
.info-box#info-box {
	width: 800px;
 	display: inline;  
	}

</style>
</head>
<body>
<jsp:include page="../../common/navbar.jsp" />

<div class="container" id="container-delAccInfo">
	<div class="info-box" id="info-box">
	<form action="delConfirm.ko" class="uDelAcct" id="delAcct" name="delAcct" method="post">
		<div class="">
			<h3>회원 탈퇴 시 유의사항</h3>
                <div><span>회원 탈퇴를 진행하기 전에 안내 사항을 꼭 확인해주세요.</span></div>
                <div style="font-weight:bold; color:red;">사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</div>
                <div><span>탈퇴한 아이디는 재사용 및 복구가 불가하오니 신중하게 선택하시기를 바랍니다.</span></div>

                <p style="font-weight:bold; color:red;">탈퇴 후 회원정보 및 개인형 서비스 이용 기록은 모두 삭제됩니다.</p>
                <div><pre>
1) 회원 정보, 메일, 주소 등 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
개인정보가 필요한 비채나의 모든 웹서비스 이용이 불가합니다.

2) 회원 탈퇴 후에도 작성하신 q&a와 리뷰는 자동 삭제되지 않고 그대로 남아 있습니다. 
탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없기 때문에 리뷰를 임의로 삭제해 드릴 수 없습니다.
삭제를 원하시는 게시글이 있다면 반드시 해당 게시물을 삭제하신 후 탈퇴를 진행하시길 바랍니다.

3) 해당 아이디로 더 이상 비채나에 로그인 하실 수 없으시며, 다시 이용하시기를 원하신다면 새로 가입을 해주셔야 합니다.

4) 회원 탈퇴 후 모든 비채나 웹서비스 내에서의 계약 또는 청약 철회 등에 관한 기록은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 5년간 보관되며,
이를 위한 고객님의 개인정보는 관례 법률에 따른 보유 목적 외에 다른 목적으로는 이용되지 않습니다.
</pre></div>

<p>
탈퇴 후에는 해당 아이디로 다시 가입하실 수 없으며 아이디와 데이터는 복구할 수 없습니다.
웹서비스에 남아 있는 게시글은 탈퇴 후 삭제하실 수 없습니다.


</p>
<!-- 			<label for="delChk"><span>탈퇴하시겠습니까?</span></label> -->
			<input type="checkbox" id="delChk-box" onclick="delChkOK();">
			<span>탈퇴하시겠습니까?</span>
			<button type="submit" id="delBtn" style="display:none;">회원 탈퇴</button>
         </div>
    </form>
    </div>
</div>
<script>
function delChkOK() {
	let delChk = document.getElementById("delChk-box").checked;
	if (delChk) {
		document.getElementById("delBtn").style.display = "inline";
		document.getElementById("delChk-box").style.display = "none";
	}
}
</script>
</body>
</html>
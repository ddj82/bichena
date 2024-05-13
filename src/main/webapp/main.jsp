<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="result" value='<%=request.getParameter("result")%>'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
if (request.getParameter("err") != null && request.getParameter("err").equals("1")) {
%>
<script>
alert('관리자만 접근 가능합니다.');
</script>
<%
}
%>
<script>
history.replaceState({}, null, location.pathname);
</script>
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="container">
	<c:choose>
		<c:when test='${userID ne NULL}'>
			<div>${userID}님</div>
			<c:choose>
				<c:when test="${userID eq 'admin'}">
					<div>
						<a href="admin.ko">관리자페이지</a>
						<br>
						<a href="admin2.ko">관리자페이지2</a>
					</div>
				</c:when>
				<c:otherwise>
					<div>
	 					<a href="myPage.ko">나의정보</a>
						<br>
						<a href="myCartList.ko">장바구니</a>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${howLogin eq 1}">
					<a id="howLogin" href="logout.ko">로그아웃</a>
				</c:when>
				<c:when test="${howLogin eq 2}">
					<a id="howLogin" href="javascript:kakaoLogout()">(카카오)로그아웃</a>
				</c:when>
				<c:when test="${howLogin eq 3}">
					<a id="howLogin" href="javascript:naverLogout()">(네이버)로그아웃</a>
				</c:when>
			</c:choose>
			<a href="prodList.ko">상품</a>
		</c:when>
	</c:choose>
	<a href="loginPage.ko">로그인</a>
	<br>
	<a href="adminLoginPage.ko">관리자로그인</a>
	
	<h1>${aaa }</h1>
</div>

<%@ include file="common/footer.jsp" %>

<script>
window.onpageshow = function(event){
	if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
		console.log("뒤로가기");
		location.reload();
	}
}

function kakaoLogout(){
	location.href="logout.ko";
	let ifr = document.createElement("iframe");
	ifr.setAttribute("src","https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
	ifr.setAttribute("style","display:none");
	document.body.appendChild(ifr);
}

function naverLogout(){
	$.ajax({
		type: 'POST',
		url: "logoutNaver.ko",
		success : function(res){
			let popup = window.open("https://nid.naver.com/nidlogin.logout");	
			myExec = setTimeout(function(){ 
				popup.close();
				location.reload();
			}, 10); 
		}
	});
	
}
</script>
</body>
</html>
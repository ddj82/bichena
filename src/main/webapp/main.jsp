<%-- <%@ include file="common/navbar.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="result" value='<%=request.getParameter("result")%>'/>
<c:choose>
	<c:when test="${result eq '2'}">
		<script>
			alert('미성년자는 가입이 불가합니다.');
		</script>
	</c:when>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
history.replaceState({}, null, location.pathname);
</script>
</head>
<body>
<!-- <p style="display:none;"> -->
<!-- https://docs.google.com/spreadsheets/d/1-TviEZdj-1Jx-0CRodoYHl_dpwcom3HCH_jVk4wYQDE/edit?usp=sharing -->
<!-- </p> -->
<!-- <p style="display:none;"> -->
<!-- https://www.figma.com/file/347Ybkp07g466wFj8kWRHt/Untitled?type=design&node-id=0%3A1&mode=design&t=9LpKk6BlD65Vs4TM-1 -->
<!-- </p> -->
<div class="container">
	<c:choose>
		<c:when test='${userID ne NULL}'>
			<div>${userID}님, user1 - KQLHA1288418</div>
			<c:choose>
				<c:when test="${userID eq 'admin'}">
					<div>
						<a href="admin.ko">관리자페이지</a>
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
</div>

<%-- <%@ include file="common/footer.jsp" %> --%>

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
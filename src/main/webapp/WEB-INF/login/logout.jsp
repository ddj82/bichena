<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("cache-control","no-cache");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
</head>
<body>
<script>
let logout ="<%=request.getParameter("logout")%>";
if(logout == "2"){
	kakaoLogout();
}else if(logout == "3"){
naverLogout();
}else if(logout =="s2"){
	kakaoLogoutS();
}else if(logout =="s3"){
	naverLogoutS();
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
				location.href="main.ko";
			}, 10); 
		}
	});
}

function naverLogoutS(){
	$.ajax({
		type: 'POST',
		url: "logoutNaver.ko",
		success : function(res){
			let popup = window.open("https://nid.naver.com/nidlogin.logout");	
			myExec = setTimeout(function(){ 
				popup.close();
				location.reload();
				location.href="loginFailure.ko";
			}, 10); 
		}
	});
}


function kakaoLogout(){
	location.href="logout.ko";
	let ifr = document.createElement("iframe");
	ifr.setAttribute("src","https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
	ifr.setAttribute("style","display:none");
	document.body.appendChild(ifr);
}

function kakaoLogoutS(){
	location.href="logout.ko";
	let ifr = document.createElement("iframe");
	ifr.setAttribute("src","https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
	ifr.setAttribute("style","display:none");
	document.body.appendChild(ifr);
	location.href="loginFailure.ko";
}
</script>
</body>
</html>
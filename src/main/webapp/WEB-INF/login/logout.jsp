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
console.log("logout : " + logout);
if(logout == "2"){
	kakaoLogout();
}else if(logout == "3"){
naverLogout();
}else if(logout =="s2"){
	kakaoLogoutS();
}else if(logout =="s3"){
	naverLogoutS();
}

function naverLogoutS(){
	$.ajax({
		type: 'POST',
		url: "logoutNaver.ko",
		success : function(res){
			let popup = window.open("https://nid.naver.com/nidlogin.logout");	
			myExec = setTimeout(function(){ 
				popup.close();
				location.href="loginFailure.ko";
			}, 50); 
		}
	});
}



function kakaoLogout(){
	$.ajax({
		url : 'logoutKaKao.ko',
		type : 'POST',
		async : false,
		success : function(res){
			console.log('성공: ', res);
		},
		error : function(err){
			console.log('에러: ', err);
		}
	});
	
	let ifr = document.createElement("iframe");
	ifr.setAttribute("src","https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
	ifr.setAttribute("style","display:none");
	document.body.appendChild(ifr);
	location.href="main.ko";
}

function kakaoLogoutS(){
	$.ajax({
		url : 'logoutKaKao.ko',
		type : 'POST',
		async : false,
		success : function(res){
			console.log('성공: ', res);
		},
		error : function(err){
			console.log('에러: ', err);
		}
	});
	
	let ifr = document.createElement("iframe");
	ifr.setAttribute("src","https://accounts.kakao.com/logout?continue=https://accounts.kakao.com/weblogin/account");
	ifr.setAttribute("style","display:none");
	document.body.appendChild(ifr);
	location.href="loginFailure.ko";
}
</script>
</body>
</html>
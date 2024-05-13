<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userID") == null) {%>
<script>
location.href="main.ko";
</script>
<%}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain2.jsp" %>
<div>
   <h1>글쓰기</h1>      
</div>
<div>
<%@ include file="../../insertNotice.jsp" %>  
</div>
<script>
	$("#conList").click(function(){
		location.href = "getNoticeList.ko";
	});
</script>
</body>
</html>

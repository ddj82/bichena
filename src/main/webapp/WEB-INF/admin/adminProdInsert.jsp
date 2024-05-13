<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>주류추가</title>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain2.jsp" %>
<div class="container">
<%@ include file="/prodInsertEditer.jsp" %>
</div>
</body>
</html>
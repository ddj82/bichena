<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span.prod img {
width: 300px;
}
span.prod {
cursor: pointer;
}
</style>
<script>
</script>
</head>
<body>
<c:forEach items="${prodList }" var="list">
	<span class="prod" onclick="location.href = 'prodOne.ko?p_no=${list.p_no}';">
		<img class="float" src="img/${list.p_img }" title="img" alt="img"><br>
		<span>${list.p_name }</span>
	</span>
</c:forEach>
</body>
</html>
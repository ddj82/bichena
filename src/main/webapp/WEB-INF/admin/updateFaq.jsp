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
<style>
	.container {
		width: 80%;
		margin: 0 aut;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div>
   <h1>글쓰기</h1>      
</div>
<div class="container">
	<form action="updateFaq.ko" method="post" enctype="multipart/form-data">
		<input type="hidden" name="faq_no" value="${faq.faq_no}" readonly>
		<div style="padding-left: 10px;">
			<input type="text" name="faq_title" required value="${faq.faq_title}" style="width: 80%; height: 30px; margin: 0 auto; display: inline-block; padding-left: 10;">
			<button type="submit" style="float: right; margin: 0 10px;">수정</button>
			<button id="conList" type="button" style="float: right;">글목록</button>
		</div>
		<div>
	    		<textarea name="faq_content" rows="10" cols="100" style="width: 100%; resize: none; height: 300px; margin-top: 50px;">${faq.faq_content}</textarea>      
		</div>
	</form>
</div>

<script>
	$("#conList").click(function(){
		location.href = "getFaqList.ko";
	});
</script>
</body>
</html>

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
<title>문의사항</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain2.jsp" %>
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>상태</th>
			</tr>
	    </thead>
	    <tbody>
		<c:forEach items="${qnaList }" var="qna">
			<tr onclick="location.href = 'adminQnaView.ko?q_no=${qna.q_no }';" style="cursor: pointer">
				<td>${qna.q_no }</td>
				<td>${qna.q_cate }</td>
				<td>${qna.q_title }</td>
				<td>${qna.q_writer }</td>
				<td>${qna.q_date }</td>
				<td>${qna.q_state }</td>
			</tr>
		</c:forEach>
	    </tbody>
	</table>
</div>
</body>
</html>
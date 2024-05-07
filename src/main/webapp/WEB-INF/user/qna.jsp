<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
</style>
<script>
function qnaView(uid, qno, sid) {
	if (uid == sid) {
		location.href = 'qnaView.ko?q_no=' + qno;
	} else if (sid == 'admin') {
		location.href = 'adminQnaView.ko?q_no=' + qno;
	} else {
		alert('작성자만 조회 가능합니다.');
	}
}
</script>
</head>
<body>
	<section class="title">문의목록</section>
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
			<tr onclick="qnaView('${qna.q_writer }', ${qna.q_no }, '${userID }')" style="cursor: pointer">
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
	<c:if test="${userID != null }">
		<button type="button" class="btndel btn" onclick="location.href = 'qnaInsertbtn.ko';">문의하기</button>
	</c:if>
</div>	
</body>
</html>
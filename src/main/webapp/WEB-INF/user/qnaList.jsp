<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
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
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href = 'qnaList.ko';">목록</button>
	<button type="button" class="btn btn-outline-info btn-sm" onclick="location.href = 'qnaListMy.ko';">내 문의</button>
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
	<c:if test="${userID != null && userID != 'admin' }">
		<button type="button" class="btn btn-outline-primary" onclick="location.href = 'qnaInsertbtn.ko';">문의하기</button>
	</c:if>
	<br>
	<br>
	<!-- 페이징 처리 -->
	<c:choose>
	    <c:when test="${pagination.currPageNo == 1}">
	        <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
	        <span>이전</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 이전 페이지로 이동하는 링크 -->
	        <a href="qnaList.ko?currPageNo=${pagination.currPageNo - 1}" class="btn btn-primary btn-xs">이전</a>
	    </c:otherwise>
	</c:choose>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
		<c:choose>
			<c:when test="${page eq pagination.currPageNo}">
				<span>${page}</span>
			</c:when>
			<c:otherwise>
				<a href="qnaList.ko?currPageNo=${page}" class="">${page}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:choose>
	    <c:when test="${pagination.currPageNo == pagination.pageCnt}">
	        <!-- 현재 페이지가 마지막 페이지인 경우 -->
	        <span>다음</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 다음 페이지로 이동하는 링크 -->
	        <a href="qnaList.ko?currPageNo=${pagination.currPageNo + 1}" class="btn btn-primary btn-xs">다음</a>
	    </c:otherwise>
	</c:choose>
</div>	
</body>
</html>
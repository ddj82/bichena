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
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container">
	<nav id="searchNav">
<!-- 		<form action="adminQnaList.ko" method="post"> -->
<!-- 			<select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;"> -->
<%-- 				<option value="${conditionMapQNA['카테고리']}">카테고리</option> --%>
<%-- 				<option value="${conditionMapQNA['상태']}">상태</option> --%>
<%-- 				<option value="${conditionMapQNA['제목']}">제목</option> --%>
<%-- 				<option value="${conditionMapQNA['작성자']}">작성자</option> --%>
<!-- 			</select>  -->
<!-- 			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요."> -->
<!-- 			<button type="submit" class="btn btn-primary btn-sm">검색</button> -->
<!-- 		</form> -->
	</nav>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>리뷰번호</th>
				<th>상태</th>
			</tr>
	    </thead>
	    <tbody>
		<c:forEach items="${qnaList }" var="qna">
			<tr onclick="location.href = 'adminQnaView.ko?q_no=${qna.q_no }';" style="cursor: pointer">
				<td>${qna.rnum }</td>
				<td>${qna.q_cate }</td>
				<td>${qna.q_title }</td>
				<td>${qna.q_writer }</td>
				<td>${qna.q_date }</td>
				<td>${qna.q_no }</td>
				<td>${qna.q_state }</td>
			</tr>
		</c:forEach>
	    </tbody>
	</table>
	
	<div style="text-align: center;">
		<form action="adminQnaList.ko" method="post">
			<select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
				<option value="${conditionMapQNA['카테고리']}">카테고리</option>
				<option value="${conditionMapQNA['상태']}">상태</option>
				<option value="${conditionMapQNA['제목']}">제목</option>
				<option value="${conditionMapQNA['작성자']}">작성자</option>
			</select> 
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
			<button type="submit" class="btn btn-primary btn-sm">검색</button>
		</form>
	</div>
	
	<!-- 페이징 처리 -->
	<c:choose>
	    <c:when test="${pagination.currPageNo == 1}">
	        <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
	        <span>이전</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 이전 페이지로 이동하는 링크 -->
	        <a href="adminQnaList.ko?currPageNo=${pagination.currPageNo - 1}&searchKeyword=${keyword}&searchCondition=${condition}" class="btn btn-primary btn-xs">이전</a>
	    </c:otherwise>
	</c:choose>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
		<c:choose>
			<c:when test="${page eq pagination.currPageNo}">
				<span>${page}</span>
			</c:when>
			<c:otherwise>
				<a href="adminQnaList.ko?currPageNo=${page}&searchKeyword=${keyword}&searchCondition=${condition}" class="">${page}</a>
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
	        <a href="adminQnaList.ko?currPageNo=${pagination.currPageNo + 1}&searchKeyword=${keyword}&searchCondition=${condition}" class="btn btn-primary btn-xs">다음</a>
	    </c:otherwise>
	</c:choose>
</div>
</body>
</html>
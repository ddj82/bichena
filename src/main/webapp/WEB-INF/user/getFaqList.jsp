<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>FAQ</title>
<style>
#searchNav {
    -webkit-justify-content: flex-end;
    justify-content: flex-end;
}
table.table>tbody>tr>td, table.table>tbody>tr>th, table th {
    text-align: center;
    vertical-align: middle;
}
table {
    text-align: center;
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<div class="jumbotron">
		<h1>FAQ</h1>
	</div>
	<nav id="searchNav">
		<form action="getFaqList.ko" method="post">
		    <input type="hidden" name="not_no" value="${faq.faq_no}" readonly>
			<select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
				<option value="${conditionMap['제목']}">제목</option>
				<option value="${conditionMap['내용']}">내용</option>
			</select>
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
			<button type="submit" class="btn btn-primary btn-sm">검색</button>
		</form>
	</nav>
	
	<table class="table table">
		<thead>
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 90%; text-align: center;">제목</th>
			</tr>
		</thead>
	</table>    
	<!-- 아코디언 시작 부분 -->
	<div id="accordion">	
		<c:forEach items="${faqList}" var="faq">
			<div class="card">
				<div class="card-header" data-toggle="collapse" href="#collapse${faq.faq_no}">
					<table style="width: 100%">
						<tbody>
							<tr>
								<td style="width: 10%;">${faq.faq_no}</td>
								<th style="width: 90%; text-align: center;">${faq.faq_title}</th>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="collapse${faq.faq_no}" class="collapse" data-parent="#accordion">
					<div class="card-body">
						${faq.faq_content}
					</div>
				</div>
			</div>
		</c:forEach> 
	</div><!-- 아코디언 종료 -->  
	
	<!-- 페이징 처리 -->
	<c:choose>
	    <c:when test="${pagination.currPageNo == 1}">
	        <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
	        <span>이전</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 이전 페이지로 이동하는 링크 -->
	        <a href="getFaqList.ko?currPageNo=${pagination.currPageNo - 1}" class="btn btn-primary btn-xs">이전</a>
	    </c:otherwise>
	</c:choose>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
		<c:choose>
			<c:when test="${page eq pagination.currPageNo}">
				<span>${page}</span>
			</c:when>
			<c:otherwise>
				<a href="getFaqList.ko?currPageNo=${page}" class="">${page}</a>
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
	        <a href="getFaqList.ko?currPageNo=${pagination.currPageNo + 1}" class="btn btn-primary btn-xs">다음</a>
	    </c:otherwise>
	</c:choose>
	<br>
	<br>
</div>	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
.table>tbody#List>tr>td {
	vertical-align: middle;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain2.jsp" %>
<div class="container">
	<nav id="searchNav">
		<form action="adminRevList.ko" method="post">
			<select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
				<option value="${conditionMapRev['상품명']}">상품명</option>
				<option value="${conditionMapRev['상품번호']}">상품번호</option>
				<option value="${conditionMapRev['별점']}">별점</option>
			</select>
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
			<button type="submit" class="btn btn-primary btn-sm">검색</button>
		</form>
	</nav>
	<table class="table">
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>작성자</th>
				<th>상품번호</th>
				<th>상품이름</th>
				<th>별점</th>
				<th>날짜</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="List">
		<c:forEach items="${adminRevList }" var="rev">
			<tr>
				<td>${rev.pr_no }</td>
	            <td>${rev.u_nick }</td>
	            <td>${rev.p_no }</td>
	            <td>${rev.p_name }</td>
	            <td>
	            	<c:choose>
	            	<c:when test="${rev.pr_star eq '1' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:when test="${rev.pr_star eq '2' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:when test="${rev.pr_star eq '3' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:when test="${rev.pr_star eq '4' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:otherwise>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            	</c:otherwise>
	            	</c:choose>
	            </td>
	            <td>${rev.pr_date }</td>
	            <td>
	                <button type="button" class="btn btn-primary btn-sm tail" 
	                data-toggle="modal" data-target="#myModal" data-unick="${rev.u_nick }" data-con="${rev.pr_content }">상세보기</button>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 처리 -->
	<c:choose>
	    <c:when test="${pagination.currPageNo == 1}">
	        <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
	        <span>이전</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 이전 페이지로 이동하는 링크 -->
	        <a href="adminRevList.ko?currPageNo=${pagination.currPageNo - 1}" class="btn btn-primary btn-xs">이전</a>
	    </c:otherwise>
	</c:choose>
	
    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
        <c:choose>
            <c:when test="${page eq pagination.currPageNo}">
                <span>${page}</span>
            </c:when>
            <c:otherwise>
                <a href="adminRevList.ko?currPageNo=${page}" class="">${page}</a>
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
	        <a href="adminRevList.ko?currPageNo=${pagination.currPageNo + 1}" class="btn btn-primary btn-xs">다음</a>
	    </c:otherwise>
	</c:choose>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title" id="tail-date"></h3>
            </div>
            <div class="modal-body">
            	
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
$('#myModal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget); // modal을 열기 위해 클릭한 버튼
	var uNick = button.data('unick');
	var prCon = button.data('con');
	var modal = $(this);
	modal.find('.modal-title').text("");
	modal.find('.modal-body').text("");
	modal.find('.modal-title').text(uNick + "님 리뷰");
	modal.find('.modal-body').text(prCon);
});
</script>
</body>
</html>
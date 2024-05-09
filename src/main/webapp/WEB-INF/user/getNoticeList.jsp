<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>공지사항</title>
<style>
#searchNav {
    -webkit-justify-content: flex-end;
    justify-content: flex-end;
}
</style>
</head>
<body>
<div class="container">
	<div class="jumbotron">
		<h1>공지 사항</h1>
	</div>
	<nav id="searchNav">
		<form action="getNoticeList.ko" method="post">
			<select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
				<option value="${conditionMap['제목']}">제목</option>
				<option value="${conditionMap['내용']}">내용</option>
			</select> 
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
			<button type="submit" class="btn btn-primary btn-sm">검색</button>
		</form>
	</nav>
	<div>
		<table class="table table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList}" var="notice">
					<tr onclick="selTr(${notice.not_no})" style="cursor: pointer;">
						<td>${notice.not_no}</td>
						<td>${notice.not_title}</td>
						<td>${notice.not_writer}</td>
						<td>${notice.not_date}</td>
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
		        <a href="getNoticeList.ko?currPageNo=${pagination.currPageNo - 1}" class="btn btn-primary btn-xs">이전</a>
	    	</c:otherwise>
		</c:choose>
		
        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
            <c:choose>
                <c:when test="${page eq pagination.currPageNo}">
                    <span>${page}</span>
                </c:when>
                <c:otherwise>
                    <a href="getNoticeList.ko?currPageNo=${page}" class="">${page}</a>
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
		        <a href="getNoticeList.ko?currPageNo=${pagination.currPageNo + 1}" class="btn btn-primary btn-xs">다음</a>
		    </c:otherwise>
		</c:choose>
		<br>
		<br>
	</div>
</div>

<script>
function selTr(val){
	location.href = "getNotice.ko?not_no="+val;
}
$("#conWrite").click(function(){
	location.href = "writeNotice.ko";
});
</script>
</body>
</html>

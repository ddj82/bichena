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
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
#footer {
    text-align: right;
    padding-right: 15px;
	display: none;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container">
	<div>
		<table class="table table">
			<thead>
				<tr>
					<th style="width: 10%;">번호</th>
					<th style="width: 90%; text-align: center;">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${faqList}" var="faq">
					<tr onclick="selTr(${faq.faq_no})" style="cursor: pointer;">
						<td>${faq.faq_no}</td>
						<td>${faq.faq_title}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div id="footer">
			<button type="button" class="btn btn-primary btn-sm conWrite">글쓰기</button>
		</div>	
		
		<div style="text-align: center;">
			<form action="getFaqList.ko" method="post">
		        <select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
		            <c:choose>
		                <c:when test="${condition == 'TITLE'}">
		                    <option value="${conditionMap['제목']}">제목</option>
		                    <option value="${conditionMap['내용']}">내용</option>
		                </c:when>
		                <c:when test="${condition == 'CONTENT'}">
		                    <option value="${conditionMap['내용']}">내용</option>
		                    <option value="${conditionMap['제목']}">제목</option>
		                </c:when>
		                <c:otherwise>
		                    <option value="${conditionMap['제목']}">제목</option>
		                    <option value="${conditionMap['내용']}">내용</option>
		                </c:otherwise>
		            </c:choose>
		        </select>
		        <c:choose>
		           <c:when test="${keyword == ''}">
		              <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
		           </c:when>
		           <c:otherwise>
		              <input type="text" name="searchKeyword" value ="${keyword}">
		           </c:otherwise>
		        </c:choose>
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
		        <a href="getFaqList.ko?currPageNo=${pagination.currPageNo - 1}&searchKeyword=${keyword}&searchCondition=${condition}" class="btn btn-primary btn-xs">이전</a>
		    </c:otherwise>
		</c:choose>
		
        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
            <c:choose>
                <c:when test="${page eq pagination.currPageNo}">
                    <span>${page}</span>
                </c:when>
                <c:otherwise>
                    <a href="getFaqList.ko?currPageNo=${page}&searchKeyword=${keyword}&searchCondition=${condition}" class="">${page}</a>
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
		        <a href="getFaqList.ko?currPageNo=${pagination.currPageNo + 1}&searchKeyword=${keyword}&searchCondition=${condition}" class="btn btn-primary btn-xs">다음</a>
		    </c:otherwise>
		</c:choose>
		<br>
		<br>
<!-- 		<div id="footer2" style="display:none"> -->
<!-- 			<button type="button" class="btn btn-primary btn-sm conWrite">글쓰기</button> -->
<!-- 		</div> -->
	</div>
</div>	
<script>
document.addEventListener("DOMContentLoaded", function() {
    var userID = "${userID}";
    var userNO = "${userNO}";

    if (userID === 'admin') {
        document.getElementById("footer").style.display = "block";
    }
});

function selTr(val){
	location.href = "adminGetFaq.ko?faq_no="+val;
}


// 글쓰기 버튼 클릭 시 동작할 코드
$(".conWrite").click(function() {
    location.href = "writeFaq.ko";
});


</script>
</body>
</html>

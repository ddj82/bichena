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
.accordionFaq {
	max-width: 100%;
	margin: auto;
}
.accordionFaq-item {
	border-bottom: 1px solid #ddd;
}
.accordionFaq-header {
	background-color: #f4f4f4;
	padding: 10px;
	cursor: pointer;
}
.accordionFaq-body {
	display: none;
	padding: 10px;
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
					<input type="text" name="searchKeyword" value="${keyword}">
				</c:otherwise>
			</c:choose>
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
    <div class="accordionFaq">

      <c:forEach items="${faqList}" var="faq">
        <div class="accordionFaq-item">

          <div class="accordionFaq-header">

            <table style="width: 100%">
              <tbody>
                <tr>
                  <td style="width: 10%;">${faq.faq_no}</td>
                  <th style="width: 90%; text-align: center;">${faq.faq_title}</th>
                </tr>
              </tbody>
            </table>   

          </div>

          <div class="accordionFaq-body">
            ${faq.faq_content}
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
</div>	

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const accordionItems = document.querySelectorAll('.accordionFaq-item');

    accordionItems.forEach(item => {
      const header = item.querySelector('.accordionFaq-header');

      header.addEventListener('click', function() {
        const body = this.nextElementSibling;

        // Close all other accordion bodies
        accordionItems.forEach(otherItem => {
          const otherBody = otherItem.querySelector('.accordionFaq-body');
          if (otherBody !== body) {
            otherBody.style.display = 'none';
          }
        });

        if (body.style.display === 'block') {
          body.style.display = 'none';
        } else {
          body.style.display = 'block';
        }
      });
    });
  });
</script>
</body>
</html>

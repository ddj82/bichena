<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
if(session.getAttribute("userID") == null){
	response.sendRedirect("loginPage.ko");	
}else{
%>
<body>
<div class="jumbotron">
   <h1>글쓰기</h1>      
</div>
<div>

  <form action="updateFaq.ko" method="post" enctype="multipart/form-data"> <!-- post방식에서는 받는곳에서 인코딩을 해주어야 한다, 하지만, 필터를 사용하여 넣어준다. -->
    <input type="hidden" name="faq_no" value="${faq.faq_no}" readonly>
    <div>
      <div>
        <span>제목</span>
      </div>
      <input type="text" name="faq_title" placeholder="제목을 입력하세요." required value="${faq.faq_title}">      
    </div>

    <div>
      <div>
        <span>내용</span>
      </div>
      <textarea rows="10" id="comment" name="faq_content">${faq.faq_content}</textarea>      
    </div>  
    
    <div id="footer">
	  	<button id="conComplete" type="submit">수정버튼</button>
	  	<button id="conList" type="button">글목록</button>
	 </div>
  </form>  
</div>

<script>
	$("#conList").click(function(){
		location.href = "getFaqList.ko";
	});
</script>
</body>
<%} %>
</html>

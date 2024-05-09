<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
if(session.getAttribute("userID") == null){
	response.sendRedirect("loginPage.ko");	
}else{
%>
<body>
<div>
   <h1>글쓰기</h1>      
</div>
<div>
  <form action="updateNotice.ko" method="post" enctype="multipart/form-data"> <!-- post방식에서는 받는곳에서 인코딩을 해주어야 한다, 하지만, 필터를 사용하여 넣어준다. -->
  <input type="hidden" name="not_no" value="${notice.not_no}" readonly>
    <div>
      <div>
        <span>제목</span>
      </div>
      <input type="text" name="not_title" required value="${notice.not_title}">      
    </div>
    
    <div>
      <div>
        <span>작성자</span>
      </div>
      <input type="text" name="not_writer" value="${notice.not_writer}" readonly> <!-- el태그는 attribute중 이름이 같은것을 알아서 자료형을 맞춰 가져온다. -->      
    </div>
    
     <div>
      <div>
        <span>파일선택</span>
      </div>
      <input type="file" name="uploadFile">      
    </div>
    
    <div>
      <div>
        <span>내용</span>
      </div>
      <textarea rows="10" id="comment" name="not_content">${notice.not_content}</textarea>      
    </div>  
    
    <div id="footer">
	  	<button type="submit">수정버튼</button>
	  	<button id="conList" type="button">글목록</button>
	 </div>
  </form>  
</div>

<script>
	$("#conList").click(function(){
		location.href = "getNoticeList.ko";
	});
</script>
</body>
<%} %>
</html>

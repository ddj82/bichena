<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>
<div>
   <h1>글쓰기</h1>      
</div>
<div>
  <form action="insertNotice.ko" method="post" enctype="multipart/form-data"> <!-- post방식에서는 받는곳에서 인코딩을 해주어야 한다, 하지만, 필터를 사용하여 넣어준다. -->
    <div>
      <div>
        <span>제목</span>
      </div>
      <input type="text" name="not_title" placeholder="제목을 입력하세요." required>      
    </div>
    
    <div>
      <div>
        <span>작성자</span>
      </div>
      <input type="text" name="not_writer" value="${userID}" readonly> <!-- el태그는 attribute중 이름이 같은것을 알아서 자료형을 맞춰 가져온다. -->      
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
      <textarea rows="10" id="comment" name="not_content"></textarea>      
    </div>  
    
    
    <div id="footer">
	  	<button type="submit">새글 등록</button>
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
</html>

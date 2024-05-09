<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>상세보기</title>
</head>
<body>
	<div>
		<h1>상세 보기</h1>
	</div>
	<div>
		<input name="faq_no" value="${faq.faq_no}" readonly>
		<div>
			<div>
				<span>제목</span>
			</div>
			<input type="text" name="faq_title" value="${faq.faq_title}" readonly>
		</div>
		
		<div>
			<div>
				<span>내용</span>
			</div>
			<textarea rows="10" id="comment" name="faq_content" readonly>${faq.faq_content}</textarea>
		</div>

		<button id="conList" type="button">글목록</button>
	</div>
	
<script>
$("#conList").click(function(){
	location.href = "getFaqList.ko";
});
</script>

</body>
</html>

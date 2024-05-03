<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
</head>
<body>
<form action="qnaInsert.ko" method="post" enctype="multipart/form-data">
	<select name="q_cate">
		<option value="">문의내용</option>
		<option value="회원/정보관리">회원/정보관리</option>
		<option value="주문/결제">주문/결제</option>
		<option value="배송">배송</option>
		<option value="반품/환불/교환">반품/환불/교환</option>
		<option value="영수증/증빙서류">영수증/증빙서류</option>
		<option value="상품">상품</option>
		<option value="기타">기타</option>
	</select>
	<br>
	<input type="text" name="q_title">
	<br>
	<textarea rows="10" name="q_content"></textarea>
	<br>
	<input type="hidden" name="q_writer" value="${userID }">
	<br>
	<input type="file" name="uploadFile">
	<br>
	<button type="submit">등록</button>
</form>
</body>
</html>
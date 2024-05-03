<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="prodRevInsert.ko" method="post" enctype="multipart/form-data" id="prodRevInsert">
	<input type="hidden" name="u_no" value="${userNO }">
	<input type="hidden" name="o_no" value="" class="ono">
	<input type="hidden" name="p_no" value="" class="pno">
	<br>
	<span>별점</span>
	<input type="radio" name="pr_star" value="1">
	<input type="radio" name="pr_star" value="2">
	<input type="radio" name="pr_star" value="3">
	<input type="radio" name="pr_star" value="4">
	<input type="radio" name="pr_star" value="5">
	<br>
	<textarea rows="10" name="pr_content"></textarea>
	<br>
	<input type="file" name="uploadFile">
	<br>
	<button class="selectButton" type="submit">등록</button>
	<button class="close_btn" type="button">취소</button>
</form>

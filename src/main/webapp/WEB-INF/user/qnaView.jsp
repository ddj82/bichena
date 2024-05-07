<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의보기</title>
</head>
<body>
	<section class="title">문의목록</section>

	<table>
		<tr>
			<td>카테고리</td>
			<td>${qnaView.q_cate }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${qnaView.q_title }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${qnaView.q_writer }</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>${qnaView.q_date }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${qnaView.q_content }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<img src="img/imgQna/${qnaView.q_img }" title="img" alt="img" style="width: 200px;">
			</td>
		</tr>
	</table>
	<br>
	<c:if test="${qnaView.a_content != null}">
		<textarea rows="10" name="a_content" readonly>${qnaView.a_content }</textarea>
	</c:if>
	<c:if test="${qnaView.a_content == null}">
		<button type="button" class="btndel btn" onclick="qnaDelbtn(${qnaView.q_no })">삭제</button>
	</c:if>
	
<script>
	function qnaDelbtn(qno) {
		let con = confirm("정말 삭제하시겠습니까?");
		console.log(con);
		if (con) {
			location.href = 'qnaDelete.ko?q_no=' + qno;
		}
	}
</script>
</body>
</html>
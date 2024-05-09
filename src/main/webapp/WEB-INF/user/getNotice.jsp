<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>상세보기</title>
<style>
#imgBox {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	height: 100vh!imporpant;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999999;
}

#imgContentBox {
	width: 600px;
	max-height: 550px;
	overflow: auto;
	position: absolute;
	top: 30%;
	left: 30%;
	border-radius: 5px;
	z-index: 9999999;
}

#imgBoxTitleBar {
	border-bottom: 1px solid #777;
	border-radius: 5px 0 0;
	background-color: #ddd;
	width: 100%;
	padding: 10px;
	text-align: right;
	font-size: 20px;
	font-weight: bolder;
}

#imgBoxImg {
	width: 100%;
	border-radius: 0 0 5px 5px;
}

#closeX {
	padding: 5px 20px;
	border-radius: 5px;
	border: 1px solid #777;
	background-color: red;
	color: #fff;
}

#closeX:hover {
	background-color: #777;
	cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<h1>상세 보기</h1>
	</div>
	<div>
		<input type="hidden" name="not_no" value="${notice.not_no}" readonly>
		<div>
			<div>
				<span>제목</span>
			</div>
			<input type="text" name="not_title" value="${notice.not_title}" readonly>
		</div>
		<div>
			<div>
				<span>작성자</span>
			</div>
			<input type="text" value="${notice.not_writer}" readonly>
		</div>
		<div>
			<div>
				<span>내용</span>
			</div>
			<textarea rows="10" id="comment" name="not_content" readonly>${notice.not_content}</textarea>
		</div>
		<div>
			<div>
				<span>파일</span> <input type="hidden" name="not_img" value="${notice.not_img}" readonly>
			</div>
			<c:if test="${notice.not_img ne NULL }">
				<span style="cursor: pointer; adding: 0 20px;" onclick="seeImg()">[파일보기]</span>
				<script>
					function seeImg() {
						$("#imgBox").show();
					}
				</script>
			</c:if>
		</div>
		<div>
			<div>
				<span>등록일</span>
			</div>
			<input type="text" name="regDate" value="${notice.not_date}" readonly>
		</div>
		<button id="conList" type="button">글목록</button>
	</div>

	<div id="imgBox">
		<div id="imgContentBox">
			<div id="imgBoxTitleBar">
				<span id="closeX" onclick="closeX()">X</span>
				<script>
					function closeX(){
						$("#imgBox").hide();
					}
					
					
				</script>
			</div>
			<img id="imgBoxImg" src="img/${notice.not_img }">
		</div>
	</div>
	
	
<script>
$("#conList").click(function(){
	location.href = "getNoticeList.ko";
});
</script>
</body>
</html>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>상세보기</title>
<style>
.faq_container {
	width: 876px;
	margin: 0 auto;
	float: left;
}

.faq_title_wrapper {
	width: 100%;
	line-height: 1.3;
	border-top: 1px solid #7e7e7e;
	color: #333;
	font-size: 24px;
	background-color: #f9f9f9;
	word-break: break-all;
	font-weight: bold;
	padding: 25px 0;
	margin-top: 0 !important;
}

.faq_title {
	margin: 0 25px;
}

.faq_content_wrapper {
	margin: 25px;
	width: 80%;
	margin: 0 auto;
}

.back_btn {
	display: inline-block;
	font-size: 13px;
	color: #666;
	padding: 13px 11px;
	line-height: 1;
	border: 1px solid #e6e6e6;
	text-align: center;
	float: right;
	margin: 0 10px;
	background-color: white;
	width: 60px;
	cursor: pointer;
	border-radius: 10px;
}
</style>
<body>
<%@ include file="/WEB-INF/admin/adminMain2.jsp" %>
<div class="container" style="width: 80%; margin: 0 auto;">
	<div class=faq_container>
	<div>
		<h1>
			상세 보기
			<button class="back_btn conMod" type="button">수정</button>
			<button class="back_btn conDel" type="button">삭제</button>
		</h1>
	</div>
	<div>
		<div class="faq_title_wrapper">
			<span class="faq_title">${faq.faq_title}</span>
		</div>
		<div class="faq_content_wrapper">
			<div class="faq_content" style="clear: both;">${faq.faq_content }</div>
		</div>
		<div id="footer" style="display: none">
			<button class="back_btn conMod" type="button">수정</button>
			<button class="back_btn conDel" type="button">삭제</button>
		</div>
	</div>
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

	$(".conDel").click(function(){
		if(confirm("정말 삭제하시겠습니까?") == true){
			console.log(${faq.faq_no});
			location.href = "deleteFaq.ko?faq_no="+${faq.faq_no};
		}
	});

	$(".conMod").click(function(){
		location.href = "modifyFaq.ko?faq_no="+ ${faq.faq_no};
	})

	$("#conWrite").click(function(){
		location.href = "insertFaq.jsp";
	});

	$("#conList").click(function(){
		location.href = "getFaqList.ko";
	});
</script>


</body>
</html>

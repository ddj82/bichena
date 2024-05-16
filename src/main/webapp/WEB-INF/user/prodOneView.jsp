<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주류상세페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/prodOne.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
$(function(){
	let pno = ${prodOne.p_no};
	let objParams = {p_no : pno};
	let values = []; //ArrayList 값을 받을 변수를 선언
	$.ajax({
		method : "POST",
		url : "prodOneRev.ko",
		data : objParams,
		cache : false,
		success : function(res) {
			if (res.code == "OK") { //controller에서 넘겨준 성공여부 코드
				values = res.prodOneRev; //java에서 정의한 ArrayList명을 적어준다.
				console.log("배열 : ", values);
				$.each(values, function(i, o){
					$("#revTB").append("<table class='dtable'><tr><td>" + o.u_nick + "</td><td>" + o.p_name + "</td><td>" + o.pr_date + "</td></tr>"
							+ "<tr><td>" + o.pr_content + "</td><td>"
							+ "<tr><td>" + "<img alt='' src='img/imgRev/" + o.pr_img  + "' style='width:100px;'>" + "</td><td></table>");
				});
				console.log("성공");
			} else {
				console.log("실패");
			}
		}
	});
});
</script>
<style>
div.pay {
	top: 160px;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 10px;
}
/* Chrome, Safari, Edge 등에서 화살표를 숨기기 */
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/* Firefox에서 화살표를 숨기기 */
input[type=number] {
    -moz-appearance: textfield;
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
<%@ include file="pay.jsp" %>
	<div class="div1" style="width:60%;">
		<img class="float" src="img/${prodOne.p_img }" title="img" alt="img" style="padding:10px;">
		<div class="clear">
			<p><span class="span1"><small>${prodOne.p_desc}</small></span></p>
			<p><span class="span2"><strong>${prodOne.p_name}</strong></span></p>
			<p class="p1"><span class="span3"><small>판매가격</small></span></p>
			<p class="p2"><span class="span2"><strong>${prodOne.p_price}원</strong></span></p>
		</div>
	</div>
	<div class="dtable" style="width:30%;">
		<table style="width:100%;">
			<tr>
				<th>주류종류</th><td>${prodOne.p_type}</td>
			</tr>
			<tr>
				<th>도수</th><td>${prodOne.p_dgr}%</td>
			</tr>
			<tr>
				<th>용량</th><td>${prodOne.p_cap}ml</td>
			</tr>
		</table>
	</div>
	<br><br><br> 
	<div class="dtable" style="display:inline-block; width:30%">
		<table style="width:100%;">
			<tr>
				<th>단맛</th>
				<td>${prodOne.p_sw}</td>
			</tr>
			<tr>
				<th>신맛</th>
				<td>${prodOne.p_su}</td>
			</tr>
			<tr>
				<th>탄산</th>
				<td>${prodOne.p_sp}</td>
			</tr>
		</table>
	</div>
	<div class="dtable" style="display:inline-block; width:30%">
		<table style="width:100%;">
			<tr>
				<th>원료</th><td>${prodOne.p_mat}</td>
			</tr>
			<tr>
				<th>재고</th><td>${prodOne.p_stock}</td>
			</tr>
		</table>
	</div>
	<div id="detail2" style="width:60%;">${pageContext.request.contextPath }/WEB-INF/product/${prodOne.editfile }</div>
	<br>
	<br>
	<br> 
	<br>
	<br>
	<br> 
	<br>
	<br>
	<br> 
	<br>
	<br>
	<br> 
	<br>
	<br>
	<br> 
	<div id="revTB"></div>
</div>
<br>
<br>
<br> 
<br>
<script>
window.onload = function(){
	var httpReq = new XMLHttpRequest();
	httpReq.open("GET", './productDetailpage.ko?p_no=${prodOne.p_no}', false);
	httpReq.onreadystatechange = function(){
		if( httpReq.readyState == 4 && httpReq.status == 200  ) {
			var fileData = httpReq.responseText;
			console.log('fileData: ',fileData);
			document.querySelector("#detail2").innerHTML = fileData;
		}
	};
	httpReq.send();
};
</script>
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
</body>
</html>
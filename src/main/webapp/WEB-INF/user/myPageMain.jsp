<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 마이페이지 메인</title>
<style>
.none {
display: none;
}
table {
width: 50%;
border: 1px solid black;
margin: 20px 0;
padding: 0 20px;
}
form textarea {
width: 100%;
}
table#revContentTB {
width: 100%;
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="myPageHeader.jsp" %>
<div class="container">
	<h3>나의 정보</h3>
	<c:forEach items="${myOrderList }" var="myorder">
		<table>
			<tr>
				<td>${myorder.o_state }</td>
			</tr>
			<tr>
				<td>${myorder.o_date } <button type="button" class='btn btn-outline-primary btn-sm' onclick="location.href='myOrderDetail.ko?o_no=${myorder.o_no }';">주문 상세보기</button></td>
			</tr>
			<tr>
				<td>${myorder.u_name } | ${myorder.u_tel }</td>
			</tr>
			<tr>
				<td><img alt="img" title="img" src="img/${myorder.p_img }" style="width:50px"></td>
			</tr>
			<tr>
				<td>${myorder.p_name }</td>
			</tr>
			<tr>
				<td>${myorder.p_desc }</td>
			</tr>
			<tr>
				<td>${myorder.p_price }원 / 수량 ${myorder.o_stock }개</td>
			</tr>
		</table>
	</c:forEach>
</div>

</body>
</html>
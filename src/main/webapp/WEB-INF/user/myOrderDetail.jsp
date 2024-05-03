<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="ListArea">
	<table>
		<tr>
			<td>${myOrderDetail.o_date }</td>
		</tr>
		<tr>
			<td>${myOrderDetail.o_no }</td>
		</tr>
		<tr>
			<td>${myOrderDetail.u_name } | ${myOrderDetail.u_tel }</td>
		</tr>
		<tr>
			<td>${myOrderDetail.o_state }</td>
		</tr>
		<tr>
			<td><img alt="img" title="img" src="img/${myOrderDetail.p_img }" style="width:50px"></td>
		</tr>
		<tr>
			<td>${myOrderDetail.p_name }</td>
		</tr>
		<tr>
			<td>${myOrderDetail.p_desc }</td>
		</tr>
		<tr>
			<td>${myOrderDetail.p_price }원 / 수량 ${myOrderDetail.o_stock }개</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2">받는 분 정보</td>
		</tr>
		<tr>
			<td>받는분</td>
			<td>${myOrderDetail.u_name } | ${myOrderDetail.u_tel }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${myOrderDetail.o_addr }</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2">계산서</td>
		</tr>
		<tr>
			<td>총 주문 금액</td>
			<td>${myOrderDetail.o_total }</td>
		</tr>
		<tr>
			<td>총 결제 금액</td>
			<td>${myOrderDetail.o_total }</td>
		</tr>
	</table>
</section>
</body>
</html>
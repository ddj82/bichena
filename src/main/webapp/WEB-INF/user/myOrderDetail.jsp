<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="myPageHeader.jsp" %>
<div class="container">
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
		<c:forEach items="${detailList }" var="detail">
			<tr>
				<td><img alt="img" title="img" src="img/${detail.p_img }" style="width:50px"></td>
			</tr>
			<tr>
				<td>${detail.p_name } / ${detail.p_price }원 / 수량 ${detail.o_stock }개</td>
			</tr>
		</c:forEach>
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
			<td>총 결제 금액</td>
			<td>${myOrderDetail.o_total }</td>
		</tr>
	</table>
	<c:if test="${myOrderDetail.o_state eq '상품 준비중' }">
		<button id="cancel_module" type="button" value="${myOrderDetail.o_no }" class="btn btn-outline-warning btn-sm">결제취소</button>
	</c:if>
</div>
<script>
$("#cancel_module").click(function () {
	let result = confirm('취소하시겠습니까?');
	if(result){
		$.ajax({
			url : "cancle.ko",
			data : {"mid": $("#cancel_module").val()},
			method : "POST",
			success : function(val){
				console.log(val);
				if(val==1){
					alert("취소 완료");
					location.href = "myPage.ko";
				}
				else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error :  function(request, status){
				alert("취소가 실패하였습니다.");
			}
		});
	}
});
</script>
</body>
</html>
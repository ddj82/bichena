<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
tr {
/*     border-bottom: 1px solid black; */
/*     border-collapse: collapse; */
}
table th {
    text-align: center;
}
table {
/* 	width: 80%; */
	text-align: center;
}
.table-hover>tbody>tr:hover {
    background-color: #fff;
}
.btn-info.del {
    color: #fff;
    background-color: #d53131;
    border: none;
}
.btn-info.tail {
    color: #fff;
    background-color: #4385ff;
    border: none;
}
.btn-group-lg>.btn, .btn-lg {
    padding: 12px 10px;
    font-size: 14px;
    line-height: 0;
}
.btn-info.del:active {
	color: #fff;
	background-color: #d53131;
	background-image: none;
	border-color: #bc2626;
}
.btn-info.del:hover, .btn-info.del:focus {
    color: #fff;
    background-color: #a32121;
/*     border-color: #bc2626; */
}
.btn-info.tail:active {
    color: #fff;
    background-color: #4385ff;
    background-image: none;
    border-color: #2758b9;
}
.btn-info.tail:hover, .btn-info.tail:focus {
    color: #fff;
    background-color: #2758b9;
/*     border-color: #2758b9; */
}
</style>
</head>
<body>
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>주문자이름</th>
				<th>상품명</th>
				<th>주문금액</th>
				<th>주문상태</th>
				<th>주문취소</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${adminOrderList }" var="order">
			<tr>
				<td>${order.o_no }</td>
	            <td>${order.o_date }</td>
	            <td>${order.u_name }</td>
	            <td>${order.p_name }</td>
	            <td>${order.o_total }</td>
	            <td>${order.o_state }</td>
	            <td>
	                <button type="button" class="btn btn-info btn-lg del" onclick="">주문취소</button>
	            </td>
	            <td>
	                <button type="button" class="btn btn-info btn-lg tail" data-toggle="modal" data-target="#myModal" onclick="orderdetail('${order.o_no }')">상세보기</button>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>

<!-- 	<table class="orderTB"> -->
<!-- 	    <tr class="orderTB"> -->
<!-- 	        <th class="orderTB">주문번호</th> -->
<!-- 	        <th class="orderTB">주문날짜</th> -->
<!-- 	        <th class="orderTB">주문자이름</th> -->
<!-- 	        <th class="orderTB">상품명</th> -->
<!-- 	        <th class="orderTB">주문금액</th> -->
<!-- 	        <th class="orderTB">주문상태</th> -->
<!-- 	        <th class="orderTB">주문취소</th> -->
<!-- 	        <th class="orderTB">상세보기</th> -->
<!-- 	    </tr> -->
<%-- 		<c:forEach items="${adminOrderList }" var="order"> --%>
<!--         <tr class="orderTB"> -->
<%--             <td class="orderTB">${order.o_no }</td> --%>
<%--             <td class="orderTB">${order.o_date }</td> --%>
<%--             <td class="orderTB">${order.u_name }</td> --%>
<%--             <td class="orderTB">${order.p_name }</td> --%>
<%--             <td class="orderTB">${order.o_total }</td> --%>
<%--             <td class="orderTB">${order.o_state }</td> --%>
<!--             <td class="orderTB"> -->
<!--                 <button type="button" class="btn btn-info btn-lg del" onclick="">주문취소</button> -->
<!--             </td> -->
<!--             <td class="orderTB"> -->
<%--                 <button type="button" class="btn btn-info btn-lg tail" data-toggle="modal" data-target="#myModal" onclick="orderdetail('${order.o_no }')">상세보기</button> --%>
<!--             </td> -->
<!--         </tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
	
	
<script>
function orderdetail(ono){
	let objParams = {o_no : ono};
	$.ajax({
		type : "GET",
		url : "adminOrderDetail.ko",
		data : objParams,
		cache : false,
		success : function(val) {
			$("#tail-date").text("");
			$("#tail-no-name-tel").text("");
			$("#tail-state").text("");
			$("#tail-prod").text("");
			$("#tail-user").text("");
			$("#tail-pay").text("");
			
			$("#tail-date").append(val.o_date);
			$("#tail-no-name-tel").append("<p>주문번호 : " + val.o_no + "</p>" + "<div>" + val.u_name + " | " + val.u_tel + "</div>");
			$("#tail-state").append(val.o_state);
			$("#tail-prod").append("상품사진,상품명,상품설명,개당가격,수량");
			$("#tail-user").append("<tr><td>받는분</td><td>" + val.u_name + " | " + val.u_tel + "</td></tr><tr><td>주소</td><td>" + val.o_addr + "</td></tr>");
			$("#tail-pay").append("<tr><th>총 주문 금액</th><th>" + val.o_total + "원</th></tr>");
		}
	});	
}
</script>
	<div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	        <!-- Modal content-->
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                <h3 class="modal-title" id="tail-date"></h3>
                    <br>
	                <div id="tail-no-name-tel">
	                </div>
	            </div>
                <br>
	            <div class="modal-header">
	                <h4 class="modal-title" id="tail-state"></h4>
	            </div>
	            <div class="modal-header">
	                <div id="tail-prod"></div>
	            </div>
                <br>
	            <div class="modal-header">
	                <h4 class="modal-title">받는 분 정보</h4>
	            </div>
	            <div class="modal-body">
	                <table id="tail-user">
	                </table>
	            </div>
	            <div class="modal-header">
	                <br>
	                <h4 class="modal-title">계산서</h4>
	            </div>
	            <div class="modal-body">
	                <table id="tail-pay">
	                </table>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>
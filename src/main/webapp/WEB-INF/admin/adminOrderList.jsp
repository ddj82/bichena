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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
.table.table-hover>thead>tr>td {
	vertical-align: middle;
}
.table.table-bordered>thead>tr>td {
	border-bottom: none;
}
.table.table-bordered>thead>tr>td#td-title {
	vertical-align: middle;
	width: 15%;
	font-size: 1.4rem;
	background-color: #f5f5f5;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container">
	<table class="table table-bordered">
		<thead>
			<tr>
			    <td id="td-title">주문 번호</td>
			    <td>
			    	<div class="col-xs-4">
						<input class="form-control" id="myInput1" type="text" placeholder="주문번호">
			    	</div>
			    </td>
			</tr>
			<tr>
			    <td id="td-title">주문자 이름</td>
			    <td>
			    	<div class="col-xs-4">
						<input class="form-control" id="myInput2" type="text" placeholder="주문자이름">
			    	</div>
			    </td>
			</tr>
			<tr>
			    <td id="td-title">상품명</td>
			    <td>
			    	<div class="col-xs-4">
		                <input class="form-control" id="myInput3" type="text" placeholder="상품명">
			    	</div>
			    </td>
			</tr>
			<tr>
				<td id="td-title">상태</td>
				<td></td>
			</tr>
			<tr>
				<td id="td-title">주문 날짜</td>
				<td></td>
			</tr>
		</thead>
	</table>
	<table class="table">
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
		<tbody id="myList">
		<c:forEach items="${adminOrderList }" var="order">
			<tr>
				<td class="o_no">${order.o_no }</td>
	            <td>${order.o_date }</td>
	            <td class="u_name">${order.u_name }</td>
	            <td class="p_name">${order.p_name }</td>
	            <td>${order.o_total }</td>
	            <td>${order.o_state }</td>
	            <td>
	                <button type="button" class="btn btn-danger btn-sm del cancel_module" value="${order.o_no }">주문취소</button>
	            </td>
	            <td>
	                <button type="button" class="btn btn-primary btn-sm tail" data-toggle="modal" data-target="#myModal" onclick="orderDetail('${order.o_no }')">상세보기</button>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 처리 -->
	<c:choose>
	    <c:when test="${pagination.currPageNo == 1}">
	        <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
	        <span>이전</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 이전 페이지로 이동하는 링크 -->
	        <a href="adminOrderList.ko?currPageNo=${pagination.currPageNo - 1}" class="btn btn-primary btn-xs">이전</a>
	    </c:otherwise>
	</c:choose>
	
       <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
           <c:choose>
               <c:when test="${page eq pagination.currPageNo}">
                   <span>${page}</span>
               </c:when>
               <c:otherwise>
                   <a href="adminOrderList.ko?currPageNo=${page}" class="">${page}</a>
               </c:otherwise>
           </c:choose>
       </c:forEach>

	<c:choose>
	    <c:when test="${pagination.currPageNo == pagination.pageCnt}">
	        <!-- 현재 페이지가 마지막 페이지인 경우 -->
	        <span>다음</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 다음 페이지로 이동하는 링크 -->
	        <a href="adminOrderList.ko?currPageNo=${pagination.currPageNo + 1}" class="btn btn-primary btn-xs">다음</a>
	    </c:otherwise>
	</c:choose>
	<br>
	<br>
</div>
<script>
$(document).ready(function(){
    $("#myInput1").on("keyup", function() {
    var value = $(this).val().toLowerCase();
        $("#myList tr").filter(function() {
            $(this).toggle($(this).children(".o_no").text().toLowerCase().indexOf(value) > -1)
        });
    });
});

$(document).ready(function(){
    $("#myInput2").on("keyup", function() {
    var value = $(this).val().toLowerCase();
        $("#myList tr").filter(function() {
            $(this).toggle($(this).children(".u_name").text().toLowerCase().indexOf(value) > -1)
        });
    });
});

$(document).ready(function(){
    $("#myInput3").on("keyup", function() {
    var value = $(this).val().toLowerCase();
        $("#myList tr").filter(function() {
            $(this).toggle($(this).children(".p_name").text().toLowerCase().indexOf(value) > -1)
        });
    });
});

$(".cancel_module").click(function () {
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

function orderDetail(ono){
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
</body>
</html>
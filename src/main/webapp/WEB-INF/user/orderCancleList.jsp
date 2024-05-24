<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.none {
display: none;
}
.whole-div {
	width: 1050px;
	margin: 0 auto;
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	margin-top: 40px;
	margin-bottom: 50px;
	padding: 0 15px;
}
.title {
	border-bottom: 1px solid lightgray;
	margin-top: 20px;
	align-items: center;
	padding-bottom: 15px;
	font-weight: bold;
}
.list-count {
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	width: 300px;
	display: flex;
    justify-content: space-around;
    margin: 0 auto;
    margin-top: 30px;
    padding: 15px;
    font-weight:bold;
    color:rgb(174, 174, 174);
}
.status {
	display: flex;
    flex-direction: column;
    align-items: center;
}
.orderTable {
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	padding: 10px;
	width:50%;
/* 	height: 400px; */
	margin: 30px auto;
	display: flex;
    flex-direction: column;
}
.name-tel {
/* 	background-color: #deffdd; */
	padding-top: 5px;
	padding-bottom: 5px;
}
.content {
	border-top: 1px solid rgb(238, 238, 238);
	display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 5px;
    padding-bottom: 5px;
}
.each-content {
	display: flex;
    flex-direction: column;
}
.each-content div {
	width: 200px;
}
form textarea {
	width: 100%;
}
table#revContentTB {
	width: 100%;
}
.detail {
	display: flex;
    justify-content: space-between;
    font-weight: bold;
}
.total {
	border-top: 1px solid rgb(238, 238, 238);
	padding-top: 5px;
	margin-top: auto;
	display: flex;
	justify-content: space-between;
	font-weight: bold;
}
.orderEmpty {
	margin: 100px 40.3%;
    font-size: 20px;
    font-weight: bold;
}
/* extra small */
@media screen and (max-width:645px) {
	.each-content {
		font-size: 14px;
	}
	.whole-div {
		width: 90%;
	}
	.orderTable {
		width: 100%;
	}
	.orderEmpty {
		margin: 100px auto;
	    font-size: 16px;
	    font-weight: bold;
	    width: 250px;
	}
	.submit {
		width: 100%;
		margin: 0;
	}
	.list-count {
		width: 100%;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	.whole-div {
		width: 90%;
	}
	.orderTable {
		width: 80%;
	}
	.orderEmpty {
		margin: 100px auto;
		width: 50%;
	}
	.submit {
		width: 100%;
		margin: 0;
	}
	.list-count {
		width: 50%;
	}
	.text-p {
		width: 70%;
	    margin: 0 auto;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	.whole-div {
		width: 90%;
	}
	.orderTable {
		width: 70%;
	}
	.orderEmpty {
		margin: 100px auto;
		width: 300px;
	}
	.submit {
		width: 100%;
		margin: 0;
	}
	.list-count {
		width: 50%;
	}
	.text-p {
		width: 93%;
	    margin: 0 auto;
	}
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
	.whole-div {
		width: 90%;
	}
	.orderTable {
		width: 60%;
	}
	.orderEmpty {
		margin: 100px auto;
		width: 35%;
	}
	.list-count {
		width: 40%;
	}
	.submit {
		margin: 0;
		width: 100%;
	}
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
$(document).ready(function(){
    var orderEmpty = document.getElementById('orderEmpty');
    if (orderEmpty) {
        if (${myOrderList.size()} === 0) {
        	orderEmpty.style.display = "block";
        } else {
        	orderEmpty.style.display = "none";
        }
    }
});

function priceToString(price) {
    return price.toLocaleString();
}
</script>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="myPageHeader.jsp" %>
<div class="whole-div">
		<div class="title">취소/환불 내역</div>
		<div class="list-count">
			<div class="status">
				<span class="count">${cancle }</span>
				<span class="current"><small style="font-weight:bold;">취소</small></span>			
			</div>
			<div class="status">
				<span class="count">${recall }</span>
				<span class="current"><small style="font-weight:bold;">환불</small></span>			
			</div>
		</div>
		<div class="list-order">
			<c:forEach items="${myOrderList }" var="myorder">
				<c:if test="${myorder.o_state eq '취소' }">
					<div class="orderTable">
							<div class="inner-info">
								<div>
									<div class="detail">${myorder.o_state } <button type="button" class='btn btn-outline-primary btn-sm' onclick="location.href='myOrderDetail.ko?o_no=${myorder.o_no }';">주문 상세보기</button></div>
								</div>
								<div>
									<div>${myorder.o_date }</div>
								</div>
								<div class="name-tel">
									<div>${myorder.u_name } | ${myorder.u_tel }</div>
								</div>
								<c:forEach items="${myOrderConfirm }" var="myconfirm">
									<c:if test="${myorder.o_no eq myconfirm.o_no}">
										<div class="content">
											<div><img alt="img" title="img" src="img/${myconfirm.p_img }" style="width:60px; height:60px;"></div>					
											<div>
												<div class="each-content">
													<div>${myconfirm.p_name }</div>
													<div style="margin-top: auto;"><small>${myconfirm.p_price }원 / 수량 ${myconfirm.o_stock }개</small></div>
												</div>
											</div>
										</div>
									</c:if>					
								</c:forEach>
							</div>
							<div class="total">
								<div>총 결제 금액</div>
								<div>${myorder.str_allTotal }원</div>
							</div>	
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="orderEmpty" class="orderEmpty">
			<p style="text-align:center;">취소 내역이 없습니다.</p>
		</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>
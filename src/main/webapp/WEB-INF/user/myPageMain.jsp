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
border: 1px solid black;
}
.modal {
display: none;
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background: rgba(0,0,0,0.5);
z-index: 9999;
justify-content: center;
align-items: center;
}
</style>
</head>
<body>

<h3>나의 정보</h3>
<div id="">
	<a href="confirm.ko">&gt; 회원 정보 </a><br>
</div> 

<section id="ListArea">
	<c:forEach items="${myOrderList }" var="myorder">
		<table>
			<tr>
				<td>
					${myorder.o_state }
					<c:if test="${myorder.o_state eq '배송완료' }">
						<c:if test="${myorder.o_revstate eq '0' }">
							<button type="button" class="modal_btn" data-pno="${myorder.p_no }" data-ono="${myorder.o_no }">후기쓰기</button>
						</c:if>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>${myorder.o_date } <button type="button" onclick="location.href='myOrderDetail.ko?o_no=${myorder.o_no }';">주문 상세보기</button></td>
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
</section>


<div class="modal" id="myModal">
	<div class="modal-content">
		<%@ include file="prodRevInsert.jsp" %>
	</div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById('myModal');
    const modalOpenButtons = document.querySelectorAll('.modal_btn');
    const modalCloseButton = document.querySelector('.close_btn');
    const prodPno = document.getElementById('prodRevInsert').querySelector('.pno');
    const prodOno = document.getElementById('prodRevInsert').querySelector('.ono');

    modalOpenButtons.forEach(button => {
        button.addEventListener('click', function() {
            modal.style.display = 'flex';
            const p_no = this.getAttribute('data-pno');
            const o_no = this.getAttribute('data-ono');
            prodPno.value = p_no;
            prodOno.value = o_no;
        });
    });

    modalCloseButton.addEventListener('click', function() {
        modal.style.display = 'none';
    });

});
</script>



</body>
</html>
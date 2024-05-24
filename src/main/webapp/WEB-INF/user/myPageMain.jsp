<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>회원 마이페이지 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
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
	margin: 30px auto;
	display: flex;
    flex-direction: column;
}
.name-tel {
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
	margin: 100px 359px;
    font-size: 20px;
    font-weight: bold;
}
.submit {
	width: 100%;
    padding: 5px;
    height: 40px;
    background-color: #005930;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
}

.text-p {
	width: 65%;
    margin: 0 auto;
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
</script>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="myPageHeader.jsp" %>
<div class="whole-div">
	<div class="title">주문 내역</div>
	<div class="list-count">
		<div class="status">
			<span class="count">${ready }</span>
			<span class="current"><small style="font-weight:bold; color:rgb(174, 174, 174)">상품 준비중</small></span>			
		</div>
		<div class="status">
			<span class="count">${porter }</span>			
			<span class="current"><small style="font-weight:bold; color:rgb(174, 174, 174)">배송중</small></span>
		</div>
		<div class="status">
			<span class="count">${complete }</span>
			<span class="current"><small style="font-weight:bold; color:rgb(174, 174, 174)">배송완료</small></span>
		</div>
	</div>
	<div class="list-order">
		<c:forEach items="${myOrderList }" var="myorder">
			<c:if test="${myorder.o_state ne '취소' }">
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
	<form action="prodList.ko">
		<div id="orderEmpty" class="orderEmpty">
			<p class="text-p" style="text-align:center;">주문내역이 없습니다.</p>
			<div class="btn-div" style="margin-top: 10px;">
				<input type="submit" value="주문하러 가기" id="submit" class="submit">
			</div>
		</div>
	</form>
</div>

<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">리뷰작성</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form action="prodRevInsert.ko" method="post" enctype="multipart/form-data" id="prodRevInsert">
			<div class="modal-body">
					<input type="hidden" name="u_no" value="${userNO }">
					<input type="hidden" name="o_no" value="" class="ono">
					<input type="hidden" name="p_no" value="" class="pno">
					<br>
					<span>별점 : 
						<span id="star-fill" style="color:DarkOrange;">
							<span onclick="starFill(1);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(2);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(3);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(4);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(5);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
						</span>
					</span>
					<input type="radio" name="pr_star" id="star1" value="1" style="display:none;">
					<input type="radio" name="pr_star" id="star2" value="2" style="display:none;">
					<input type="radio" name="pr_star" id="star3" value="3" style="display:none;">
					<input type="radio" name="pr_star" id="star4" value="4" style="display:none;">
					<input type="radio" name="pr_star" id="star5" value="5" style="display:none;">
					<br><br>
					<textarea rows="8" name="pr_content"></textarea>
					<br><br>
					<label for="file" class="btn btn-outline-secondary btn-sm">첨부파일</label>
					<input type="file" id="file" name="uploadFile" class="btn btn-outline-secondary btn-sm" style="display:none;">
					<br>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" type="submit">등록</button>
				<button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
			</div>
			</form>
		</div>
	</div>
</div>
<script>
$('#myModal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget); // modal을 열기 위해 클릭한 버튼
	var oNo = button.data('ono');
	var pNo = button.data('pno');
	var modal = $(this);
	modal.find('.ono').val(oNo); // modal-body 내의 input 요소에 값 설정
	modal.find('.pno').val(pNo); // modal-body 내의 input 요소에 값 설정
});

// Modal이 닫힐 때 실행되는 함수
$('#myModal').on('hidden.bs.modal', function () {
    $('#prodRevInsert')[0].reset();
	let fill = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>';
	let fillNone = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>';
	let spanTag1 = '<span onclick="starFill(1);">';
	let spanTag2 = '<span onclick="starFill(2);">';
	let spanTag3 = '<span onclick="starFill(3);">';
	let spanTag4 = '<span onclick="starFill(4);">';
	let spanTag5 = '<span onclick="starFill(5);">';
	let spanEnd = '</span> ';
    let starFill = document.getElementById("star-fill");
    starFill.innerHTML = spanTag1 + fillNone + spanEnd + spanTag2 + fillNone + spanEnd + spanTag3 + fillNone + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
});

function starFill(star) {
	let fill = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>';
	let fillNone = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>';
	let spanTag1 = '<span onclick="starFill(1);">';
	let spanTag2 = '<span onclick="starFill(2);">';
	let spanTag3 = '<span onclick="starFill(3);">';
	let spanTag4 = '<span onclick="starFill(4);">';
	let spanTag5 = '<span onclick="starFill(5);">';
	let spanEnd = '</span> ';
	let starFill = document.getElementById("star-fill");
	let radio = document.querySelectorAll('input[type="radio"][name="pr_star"]');
	
	if (star === 1) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fillNone + spanEnd + spanTag3 + fillNone + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else if (star === 2) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fillNone + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else if (star === 3) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fill + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else if (star === 4) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fill + spanEnd + spanTag4 + fill + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fill + spanEnd + spanTag4 + fill + spanEnd + spanTag5 + fill + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	}
};
</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>
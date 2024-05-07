<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="pay">
	<form action="">
		<div>수량</div>
		<div>인풋요소 수량 정하는 부분</div>
		<div>총 상품가격</div>
		<div>인풋요소 가격 리드온니</div>
		<div><button type="button">장바구니</button></div>
		<div><button type="button">구매하기</button></div>
	</form>
	
	<div style="display: none;">
		<!-- 상품 아이디 -->
		<input type="hidden" id="productno" name="productno" value="${prodOne.p_no}" readonly>
		<!-- 상품 이름 -->
		<input type="hidden" id="productname" name="productname" value="${prodOne.p_name}" readonly>
	</div>
	<div>
		<label for="stock">개수:</label> <input type="number" id="stock" name="stock" placeholder="개수를 입력하세요.">
		<button type="button" onclick="Total(${prodOne.p_price})">확인</button>
	</div>
	<div>
		<p>
			총 가격 : <input type="text" id="total" name="total">
		</p>
	</div>
	<div>
		<button type="button" onclick="addCart('${userID}')">장바구니 담기</button>
		<button type="button" onclick="showCart()">내 장바구니 보기</button>
	</div>
</div>
<script>

function Total(p_price) {
	var tot = $('#stock').val();
	var price = p_price; 
	var total = tot * price;
	$('#total').val(total);
}

function addCart(uid) {
    $.ajax({
        url: "selectcount.ko",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ p_no: $('#productno').val() }),
        success: function(response) {
            if (response.code === "no") {
//                 alert("이미 등록된 상품입니다.");
                updateCart(response.c_stock, response.c_total);
            } else {
                AddCartInsert(uid);
            }
        },
        error: function(xhr) {
            alert("에러 발생: " + xhr.responseText);
        }
    });
}

function AddCartInsert(uid) { 
    var userid = uid;
    var productno = $('#productno').val();
    var productname = $('#productname').val();
    var stock = $('#stock').val();
    var total = $('#total').val();
	console.log(userid);
    var data = {
   		u_id: userid,
   		p_no: productno,
        p_name: productname,
        c_stock: stock,
        c_total: total
    };

    $.ajax({
        url: "cartinsert.ko",
        type: "post",
        data: data,
        success: function(response) {
            alert("장바구니에 추가되었습니다.");
            console.log("서버 응답:", response);
        },
        error: function(xhr, status, error) {
            alert("에러 발생: " + error);
            console.log("상태:", status);
            console.log("에러:", error);
        }
    });
}

function showCart() {
	location.href = "myCartList.ko";
}

function updateCart(stock, total) {
    var productno = $('#productno').val();
    var addStock = parseInt($('#stock').val()); 
    var updatedStock = stock + addStock; 
    var price = total / stock; 
    var updatedTotal = updatedStock * price; 

    $.ajax({
        url: "cartupdate.ko",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({
            p_no: productno,
            c_stock: updatedStock,
            c_total: updatedTotal
        }),
        success: function(updateResponse) {
            alert("장바구니가 업데이트되었습니다.");
        },
        error: function(xhr) {
            alert("업데이트 중 에러 발생: " + xhr.responseText);
        }
    });
}
</script>
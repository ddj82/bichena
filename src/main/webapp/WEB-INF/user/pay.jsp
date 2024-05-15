<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="pay">
	<div style="display: none;">
		<!-- 상품 아이디 -->
		<input type="hidden" id="productno" name="productno" value="${prodOne.p_no}" readonly>
		<!-- 상품 이름 -->
		<input type="hidden" id="productname" name="productname" value="${prodOne.p_name}" readonly>
	</div>
	<div>
		<label for="stock">수량 :</label> <br>
		<button onclick="stockMinus();"> - </button>
		<input type="number" id="stock" name="stock" placeholder="개수를 입력하세요." value="1">
		<button onclick="stockPlus();"> + </button>
<%-- 		<button type="button" onclick="Total(${prodOne.p_price})">확인</button> --%>
	</div>
	<div>
		<label for="total">총 가격 :</label> <br>
		<input type="text" id="total" name="total" value="${prodOne.p_price}">
		<span id="defaultPrice" style="display:none;">${prodOne.p_price}</span>
	</div>
	<div>
		<button type="button" onclick="addCart('${userID}')">장바구니 담기</button>
		<button type="button" onclick="showCart()">내 장바구니 보기</button>
	</div>
</div>
<script>

// 입력 내용이 변경될 때마다 호출되는 이벤트 핸들러를 추가합니다.
document.getElementById("stock").addEventListener("change", function(event) {
	let numberInput = document.getElementById("stock");
    // 입력된 값이 양수가 아니면 0으로 설정합니다.
    if (parseInt(numberInput.value) <= 0 || numberInput.value == "") {
        numberInput.value = 1;
    } else {
    	//수량
    	let tot = parseInt(numberInput.value); 
    	//상품금액
    	let price = document.getElementById("defaultPrice").innerText; //기본가격
    	let total = tot * price;
    	document.getElementById("total").value = total;
    }
});

function stockMinus() {
	let numberInput = document.getElementById("stock");
	numberInput.value = parseInt(document.getElementById("stock").value) - 1;
	if (parseInt(numberInput.value) <= 0 || numberInput.value == "") {
        numberInput.value = 1;
    } else {
    	//수량
    	let tot = parseInt(numberInput.value); 
    	//상품금액
    	let price = document.getElementById("defaultPrice").innerText; //기본가격
    	let total = tot * price;
    	document.getElementById("total").value = total;
    }
}
function stockPlus() {
	let numberInput = document.getElementById("stock");
	numberInput.value = parseInt(document.getElementById("stock").value) + 1;
	if (parseInt(numberInput.value) <= 0 || numberInput.value == "") {
        numberInput.value = 1;
    } else {
    	//수량
    	let tot = parseInt(numberInput.value); 
    	//상품금액
    	let price = document.getElementById("defaultPrice").innerText; //기본가격
    	let total = tot * price;
    	document.getElementById("total").value = total;
    }
}


function Total(p_price) {
	var tot = $('#stock').val();
	var price = p_price; 
	var total = tot * price;
	$('#total').val(total);
}

function addCart(uid) {
	if (uid == "") {
		alert("로그인창으로 보내기");
	} else {
	    $.ajax({
	        url: "selectcount.ko",
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify({ p_no: $('#productno').val() }),
	        success: function(response) {
	            if (response.code === "no") {
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
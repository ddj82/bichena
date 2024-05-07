<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 장바구니</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MyCart.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
</head>
<body>

    <section class="cart">
        <div class="cart_info">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>배송중인 상품은 취소할 수 없습니다.</li>
            </ul>
        </div>
        <table class="cart_list">
                <thead>
                    <tr>
                        <td><input type="checkbox" class="All" onclick="Allselect()"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody id="cartItems">
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><button type="button" class="cart_list_optionbtn" onclick="deletecart()">선택상품 삭제</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
        </table>
        <div class="cart_mainbtns">
            <button class="cart_bigorderbtn left" onclick="CartInsert()">쇼핑 계속하기</button> <!-- 클릭하면 메인페이지로 돌아가게 할것 -->
            <button class="cart_bigorderbtn right">주문하기</button> <!-- 주문하기페이지로 보내거나 바로 결제 API로 보내기 -->
        </div>
    </section>
</body>

<script>

(function(){
	listCart();
})();

function listCart() {
    var data = { u_id: "${userID}" }; //세션에서 가져올것
    $.ajax({
        url: "cartSelect.ko",
        type : "get",
        data : data,
        success : function(res) {
            console.log("요청 성공", res);
            CartItems(res); 
        },
        error : function(xhr, status, error) {
            alert("에러발생: " + error);
            console.log("에러상태: " + status);
            console.log("에러원인: ", error);
        }
    });
}

function CartItems(items) {
    var output = "";
    for (var i = 0; i < items.length; i++) {
        output += "<tr class='cart_list_detail'>" +
                  "<td><input type='checkbox' class='item-checkbox' value='" + items[i].p_no + "'></td>" +
                  "<td><img src='img/" + items[i].p_img + "' alt='" + items[i].p_img + "'></td>" +
                  "<td><a href='#'>" + "</a><span class='cart_list_smartstore'></span>" +
                  "<p>" + items[i].p_name + "</p>" +
                  "<span class='price'>" + items[i].c_total.toLocaleString() + "원</span></td>" +
                  "<td class='cart_list_option'><p>상품명: " + items[i].p_name + " / 수량: <span id='qty_" + i + "'>" + items[i].c_stock + "</span>개</p>" +
                  "<button class='cart_list_optionbtn' onclick='plus(" + i + ", \"" + items[i].p_no + "\")'>+</button><button class='cart_list_optionbtn' onclick='minus(" + i + ", \"" + items[i].p_no + "\")'>-</button></td>"+
                  "<td><span id='price_" + i + "' class='price'>" + items[i].c_total.toLocaleString() + "원</span><br>" +
                  "<button class='cart_list_orderbtn'>주문하기</button></td>" +
                  "<td>무료</td>" +
                  "</tr>";
    }
    $("#cartItems").html(output);
}

function plus(index, p_no) {
    var stock = document.getElementById('qty_' + index);
    var price = document.getElementById('price_' + index);
    var currentQty = parseInt(stock.innerText);
    var currentTotal = parseInt(price.innerText.replace('원', '').replace(/,/g, ''));
    var currenPrice = currentTotal / currentQty;

    var newQty = currentQty + 1;
    var updatedTotal = currenPrice * newQty ;

    $.ajax({
        url: "cartupdate.ko",
        type: "post",
        contentType: "application/json",
        data: JSON.stringify({ p_no: p_no, c_stock: newQty, c_total: updatedTotal }),
        success: function(response) {
            stock.innerText = newQty;
            price.innerText = updatedTotal.toLocaleString() + "원";
        },
        error: function(xhr, status, error) {
            alert("업데이트 실패: " + error);
        }
    });
}

function minus(index, p_no) {
    var stock = document.getElementById('qty_' + index);
    var price = document.getElementById('price_' + index);
    var currentQty = parseInt(stock.innerText);
    var currentTotal = parseInt(price.innerText.replace('원', '').replace(/,/g, ''));
    var currenPrice = currentTotal / currentQty;

    if (currentQty > 1) {
        var newQty = currentQty - 1;
        var updatedTotal = currenPrice * newQty;

        $.ajax({
            url: "cartupdate.ko",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify({ p_no: p_no, c_stock: newQty, c_total: updatedTotal }),
            success: function(response) {
                stock.innerText = newQty;
                price.innerText = updatedTotal.toLocaleString() + "원";
            },
            error: function(xhr, status, error) {
                alert("업데이트 실패: " + error);
            }
        });
    }
}

function deletecart() {
    var selectedItems = $(".item-checkbox:checked").map(function() {
        return this.value;  // 체크된 항목의 상품번호만을 배열로 변환
    }).get();

    if (selectedItems.length === 0) {
        alert("삭제할 상품을 선택하세요.");
        return;
    }
    var result = confirm("선택한 상품을 삭제하시겠습니까?");
    if(result) {
        $.ajax({
            url: "cartdelete.ko",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(selectedItems),
            success: function(response) {
                console.log("삭제 성공");
                listCart();
            },
            error: function(xhr, status, error) {
                alert("삭제 실패: " + error);
            }
        });
    }
}

function Allselect() {
    var allCheckbox = document.querySelector('.All');
    var itemCheckboxes = document.querySelectorAll('.item-checkbox');

    for (var i = 0; i < itemCheckboxes.length; i++) {
        itemCheckboxes[i].checked = allCheckbox.checked; 
    }
}
function CartInsert(){ // 쇼핑 계속하기 선택시 해당 페이지로 이동하게 함 
	location.href = "prodList.ko";
}

</script>
</html>


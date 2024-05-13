<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
$(document).ready(function() {
    listCart();

    $(document).on('click', '#All', function() {
        $(".item-checkbox").prop("checked", this.checked);
        Allselect();
    });

    $(document).on('click', '.item-checkbox', function() {
        Allselect();
    });
});

function listCart() {
    var data = { u_id: "${userID}" }; // 세션에서 가져올 것
    $.ajax({
        url: "cartSelect.ko",
        type: "get",
        data: data,
        success: function(res) {
            console.log("요청 성공", res);
            ok(res);
        },
        error: function(xhr, status, error) {
            alert("에러발생: " + error);
            console.log("에러상태: " + status);
            console.log("에러원인: " + error);
        }
    });
}

function CartItems(items) {
    var output = "";
    for (var i = 0; i < items.length; i++) {
        output += "<tr class='cart-item'><td><input type='checkbox' name='chk' class='item-checkbox' value=" + items[i].p_no + "></td>" + 
        "<td><img src='img/" + items[i].p_img + "' alt='상품 이미지' class='product-image'></td>" + 
        "<td class='product-name'>" + items[i].p_name + "</td>" + 
        "<td class='button-container'><button class='btn' onclick='minus(" + i + ", \"" + items[i].p_no + "\")'>-</button><input type='text' id='qty_" + i + "' value='" + items[i].c_stock + "' readonly><button class='btn' onclick='plus(" + i + ", \"" + items[i].p_no + "\")'>+</button></td>" + 
        "<td class='right-align product-price' id='price_" + i + "'>" + items[i].c_total.toLocaleString() + "원</td></tr>";
    }
    $("#MycartList").html(output);
}

function showpping() {
    location.href = "prodList.ko";
}

function plus(index, p_no) {
    var stock = document.getElementById('qty_' + index);
    var price = document.getElementById('price_' + index);
    var currentQty = parseInt(stock.value);  
    var currentTotal = parseInt(price.innerText.replace('원', '').replace(/,/g, ''));
    var currentPrice = currentTotal / currentQty;

    var newQty = currentQty + 1;
    var updatedTotal = currentPrice * newQty;

    $.ajax({
        url: "cartupdate.ko",
        type: "post",
        contentType: "application/json",
        data: JSON.stringify({ p_no: p_no, c_stock: newQty, c_total: updatedTotal }),
        success: function(response) {
            stock.value = newQty;  
            price.innerText = updatedTotal.toLocaleString() + "원";
            updateTotal();
        },
        error: function(xhr, status, error) {
            alert("업데이트 실패: " + error);
        }
    });
}

function minus(index, p_no) {
    var stock = document.getElementById('qty_' + index);
    var price = document.getElementById('price_' + index);
    var currentQty = parseInt(stock.value); 
    var currentTotal = parseInt(price.innerText.replace('원', '').replace(/,/g, ''));
    var currentPrice = currentTotal / currentQty;

    if (currentQty > 1) {
        var newQty = currentQty - 1;
        var updatedTotal = currentPrice * newQty;

        $.ajax({
            url: "cartupdate.ko",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify({ p_no: p_no, c_stock: newQty, c_total: updatedTotal }),
            success: function(response) {
                stock.value = newQty;  
                price.innerText = updatedTotal.toLocaleString() + "원";
                updateTotal();
            },
            error: function(xhr, status, error) {
                alert("업데이트 실패: " + error);
            }
        });
    }
}

function updateTotal() {
    var total = 0;
    $("[id^=price_]").each(function() {
        var value = parseInt($(this).text().replace('원', '').replace(/,/g, ''));
        total += value;
    });
    $('#protot').text(total.toLocaleString() + "원");
    $('#totalP').text(total.toLocaleString() + "원");
    $('.totalprice span').first().text(total.toLocaleString() + "원");
    $('.tot span').last().text(total.toLocaleString() + "원");
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
    if (result) {
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
    var total = $(".item-checkbox").length;
    var checked = $(".item-checkbox:checked").length;
    $("#All").prop("checked", total === checked);
    $("#All").next('label').text(' 모두선택 (' + checked + '/' + total + ')');
}

function Allsel() {
    var allCheckbox = document.querySelector('#All');
    var itemCheckboxes = document.querySelectorAll('.item-checkbox');
    for (var i = 0; i < itemCheckboxes.length; i++) {
        itemCheckboxes[i].checked = allCheckbox.checked;
    }
    Allselect();
}

function ok(res) {
    var xCart = document.getElementById('Xcart');
    if (xCart) {
        if (res == null || res.length === 0) {
            xCart.style.display = "block";
            CartItems(res); 
            updateTotal();
            Allselect();
        } else {
            xCart.style.display = "none";
            CartItems(res); 
            updateTotal();
            Allselect();
        }
    }
}

var IMP = window.IMP;
IMP.init('imp70405420');

function order() {
	let values = {};
	var selectedItems = $(".item-checkbox:checked").map(function() {
        return this.value;  // 체크된 항목의 상품번호만을 배열로 변환
    }).get();

    if (selectedItems.length === 0) {
        alert("주문할 상품을 선택하세요.");
        return;
    }
    
    var result = confirm("선택한 상품을 주문하시겠습니까?");
    if(result) {
    	let o_no = "";
    	$.ajax({
    		url: "orderNoCreate.ko",
            type: "post",
            success: function(res) {
            	o_no = res;
            	console.log(o_no);
            },
            error: function(error) {
                alert("주문번호 실패: " + error);
                //밑에 결제 안들어가게 order()를 종료시키게
            }
    	});
    	
    	$.ajax({
            url: "order.ko",
            type: "post",
            data: JSON.stringify(selectedItems),
            contentType: "application/json",
            success: function(response) {
            	console.log('vo : ', response.user);  
            	IMP.request_pay({
         			pg: 'html5_inicis.INIpayTest', // 자신이 설정한 pg사 설정
        			pay_method: 'card',
        			merchant_uid: o_no,
        			name: response.p_name,
        			amount: response.price, // 결제 금액
        			buyer_email: response.user.u_email ,
        			buyer_name: response.user.u_name ,
        			buyer_tel: response.user.u_tel ,
        			buyer_addr: response.addr ,
        			custom_data: response.p_no
        			}, function (rsp) {
        				console.log(rsp);
        				if (rsp.success) {
        					location.href = "pay.ko?o_no=" + rsp.merchant_uid
        							+ "&u_name=" + rsp.buyer_name
        							+ "&p_no=" + rsp.custom_data
        							+ "&p_name=" + rsp.name
        							+ "&o_total=" + rsp.paid_amount
        							+ "&o_addr=" + rsp.buyer_addr
        							+ "&u_tel=" + rsp.buyer_tel
        							+ "&o_stock=" + response.c_stock;
        							
        				} else {
        					var msg = '결제에 실패하였습니다.';
        					msg += '\n에러내용 : ' + rsp.error_msg;
        				}   				
        		});
            },
            error: function(error) {
                alert("결제 실패: " + error);
            }
        });
    }    
}

</script>
<style>

</style>
</head>
<body>
<div class="box1 container">
    <div class="first-box">
        <div class="container header-container" >
        <div id="dddd">
            <input type="checkbox" id="All" onclick="Allsel()"><label for="All"></label>
        <span><a class="deletechk" onclick="deletecart()">선택삭제</a></span>
        </div>
            <div class="header">장바구니</div>
        </div>
        <div class="cart">
            <div id="body">
                <div id="Xcart">
                    <p>지금은 장바구니가 비어 있어요.</p>
                </div>
                <table id="MycartList"></table>
                <div id="item">
                    <div class="item-price">
                        <span>상품금액</span>
                        <span id="protot"></span>
                    </div>
                    <div class="item-price">
                        <span>배송비</span>
                        <span id="free">무료배송</span>
                    </div>
                    <div class="total">
                        <span>총 금액</span>
                        <span id="totalP" class="totalP"></span>
                    </div>
                    <div class="roll">
                        <button type="button" class="showpping" onclick="showpping()">상품 더보기 &gt;</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="summary">
        <div>계산서</div><hr>
        <div class="totalprice">총상품 금액: <span></span></div>
        <div class="totalprice">총 배송비: <span>무료배송</span></div>
        <hr>
        <div class="tot">총 결제 예상금액: <span id="alltot"></span></div>
        <button class="button" onclick="order()">구매하기</button>
    </div>
</div>
</body>
</html>

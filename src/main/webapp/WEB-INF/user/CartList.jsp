<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="./style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css">
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
        var data = { userid: "user1" }; // 세션에서 가져올 것
        $.ajax({
            url: "cartselect.ko",
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
            "<td><img src='" + items[i].p_img + "' alt='상품 이미지' class='product-image'></td>" + 
            "<td class='product-name'>" + items[i].p_name + "</td>" + 
            "<td class='button-container'><button class='btn' onclick='minus(" + i + ", \"" + items[i].p_no + "\")'>-</button><input type='text' id='qty_" + i + "' value='" + items[i].c_stock + "' readonly><button class='btn' onclick='plus(" + i + ", \"" + items[i].p_no + "\")'>+</button></td>" + 
            "<td class='right-align product-price' id='price_" + i + "'>" + items[i].c_total.toLocaleString() + "원</td></tr>";
        }
        $("#MycartList").html(output);
    }

    function showpping() {
        location.href = "CartInsert.jsp";
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

    </script>
    <style>

    </style>
</head>
<body>
<div class="box1 container">
    <div class="first-box">
        <div class="container header-container" >
            <input type="checkbox" id="All" onclick="Allsel()" style="text-align : left;"><label for="All"></label>
        <span><a class="deletechk" onclick="deletecart()">선택삭제</a></span>
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
                        <span>무료배송</span>
                    </div>
                    <div class="total">
                        <span>총 금액</span>
                        <span id="totalP"></span>
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
        <button class="button">구매하기</button>
    </div>
</div>
</body>
</html>

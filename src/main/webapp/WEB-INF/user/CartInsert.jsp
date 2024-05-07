<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>


<%
// String uid = "user2"; //유저테이블 임의 데이터 회원번호
String uid = "user1"; //유저테이블 임의 데이터 회원번호
int productno = 1; //장바구니테이블(상품테이블 번호) 임의 데이터
int productno1 = 2;
int productno2 = 3;
String productname = "소주"; // 장바구니 테이블 상품이름 임의 데이터
String productname1 = "과실주"; 
String productname2 = "약주";
int total = 10000;

// HttpSession Session = request.getSession();
// System.out.println(Session.getAttribute("userID"));
%>

<script>

function Total() {
	var tot = $('#stock').val();
	var price = 10000; 
	var total = tot * price;
	$('#total').val(total);
}

function addCart() {
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
                AddCartInsert();
            }
        },
        error: function(xhr) {
            alert("에러 발생: " + xhr.responseText);
        }
    });
}




function AddCartInsert() { 
    var userid = <%=(String)session.getAttribute("userID")%>;
    var productno = $('#productno').val();
    var productname = $('#productname').val();
    var stock = $('#stock').val();
    var total = $('#total').val();

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
</head>
<body>
<button id = "btn1" onclick="pro(1)">상품1</button>
<button id = "btn2" onclick="pro(2)">상품2</button>
<button id = "btn3" onclick="pro(3)">상품3</button>
<script>
function pro(val) {
    if (val == 1) {
        document.getElementById("productno").value = '<%=productno%>';
        document.getElementById("productname").value = '<%=productname%>';
    } else if (val == 2) {
        document.getElementById("productno").value = '<%=productno1%>';
        document.getElementById("productname").value = '<%=productname1%>';
    } else {
        document.getElementById("productno").value = '<%=productno2%>';
        document.getElementById("productname").value = '<%=productname2%>';
    }
}

</script>
<h1>장바구니</h1>
<div style="display: none;">
	<!-- 상품 아이디 -->
	<input type="hidden" id="productno" name="productno"
		value="<%=productno%>" readonly>
	<!-- 상품 이름 -->
	<input type="hidden" id="productname" name="productname"
		value="<%=productname%>" readonly>
</div>
<div>
	<label for="stock">개수:</label> <input type="number" id="stock"
		name="stock" placeholder="개수를 입력하세요.">
	<button type="button" onclick="Total()">확인</button>
</div>
<div>
	<p>
		총 가격 : <input type="text" id="total" name="total">
	</p>
</div>
<div>
	<button type="button" onclick="addCart()">장바구니 담기</button>
	<button type="button" onclick="showCart()">내 장바구니 보기</button>
</div>
</body>
</html>

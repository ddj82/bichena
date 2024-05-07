<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
table.table>tbody>tr>td, table.table>tbody>tr>th, table th {
    text-align: center;
    vertical-align: middle;
}
table {
    text-align: center;
}
table#table1, table#table2, 
table.table#form>tbody>tr>td, 
table.table#table2>tbody>tr>td, 
table.table#form1>tbody>tr>td {
    text-align: justify;
}
table.table.table0>tbody>tr>td, 
table.table.table0>tbody>tr>td, 
table.table.table0>tbody>tr>th {
    border: none;
}
table.table#table2>tbody>tr>td, 
table.table#table2>tbody>tr>td, 
table.table#table2>tbody>tr>th {
    width: 25%;
}
table.table#form>tbody>tr>td>label {
    width: 30%;
}
table.table#form>tbody>tr>td>input,
table.table#form>tbody>tr>td>textarea {
    width: 60%;
}
table.table#form>tbody>tr>td#td-rowspan5, 
table.table#form>tbody>tr>td#td-rowspan2 {
    width: 40%;
}
/* 파일 선택 버튼의 기본 스타일 숨기기 */
input[type="file"]#p_img {
    display: none;
}

/* 파일 선택 버튼을 가리키는 레이블 스타일링 */
.custom-file-label {
    cursor: pointer;
}
p {
margin: 50px 10px;
text-align: right;
}
</style>
<script>
</script>
</head>
<body>
<div class="container">
	<p>
		<button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModal2" onclick="">상품등록</button>
	</p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품사진</th>
				<th>주류종류</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="myList">
		<c:forEach items="${adminProdList }" var="prodlist">
			<tr>
				<td>${prodlist.p_no }</td>
	            <td>
	            	<img src="img/${prodlist.p_img }" title="img" alt="img" style="width:80px;">
	            </td>
	            <td>${prodlist.p_type }</td>
	            <td>${prodlist.p_name }</td>
	            <td>${prodlist.p_price }</td>
	            <td>${prodlist.p_stock }</td>
	            <td>
	                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" onclick="prodDetail('${prodlist.p_no }')">상세보기</button>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>

	<script>
	function prodDetail(pno){
		let objParams = {p_no : pno};
		$.ajax({
			type : "GET",
			url : "adminProdDetail.ko",
			data : objParams,
			cache : false,
			success : function(val) {
				$("#table1").text("");
				$("#table2").text("");
				
				$("#table1").append(
						"<tr><td rowspan='3'><img src='img/" + val.p_img + "' alt='' style='width: 200px;'></td><td>" + 
						"<h4 class='modal-title'><strong>" + val.p_name + "</strong></h4>" + 
						"<h5 class='modal-title'><strong>" + val.p_stock + "개</strong></h5></td></tr>" + 
						"<tr><td>" + val.p_desc + "</td></tr>" +
						"<tr><td><h5 class='modal-title'><small>판매가격:</small></h5>" + 
						"<h4 class='modal-title'><strong>" + val.p_price + "원</strong></h4></td></tr>");
				
				
				
				
				$("#table2").append("<caption><strong style='font-size: 18px;'>상품설명</strong></caption>" + 
			            "<tr><td>주종</td><td>" + val.p_type + "</td><td>단맛</td><td>" + val.p_sw + "</td></tr>" + 
			            "<tr><td>도수</td><td>" + val.p_dgr + "%</td><td>신맛</td><td>" + val.p_su + "</td></tr>" + 
			            "<tr><td>용량</td><td>" + val.p_cap + "ml</td><td>탄산</td><td>" + val.p_sp + "</td></tr>" + 
			            "<tr><td>제조사</td><td>" + val.p_made + "</td><td>원료</td><td>" + val.p_mat + "</td></tr>");
			}
		});	
	}
	</script>
	<div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	                <table class="table table0" id="table1">
	                </table>
	                <table class="table table0" id="table2">
	                </table>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	
<div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
		<form action="adminProdInsert.ko" method="post" enctype="multipart/form-data">
	        <div class="modal-content">
	            <div class="modal-body">
	                    <table class="table table0" id="form">
	                        <tr>
	                            <td rowspan="5" id="td-rowspan5">
	                                <img id="preview" src="img/" alt="" style="width: 200px;"></td>
	                            <td><label for="name">상품 이름</label> <input type="text" id="name" name="p_name"></td>
	                        </tr>
	
	                        <tr><td><label for="desc">상품 설명</label> <textarea id="desc" name="p_desc" rows="3"></textarea></td></tr>
	
	                        <tr><td><label for="price">상품 가격</label> <input type="text" id="price" name="p_price"></td></tr>
	
	                        <tr><td><label for="made">제조사</label> <input type="text" id="made" name="p_made"></td></tr>
	
	                        <tr><td><label for="dgr">도수</label> <input type="text" id="dgr" name="p_dgr"> %</td></tr>
	
	                        <tr>
	                            <td id="td-rowspan2">
	                                <div id="div-filename"></div>
	                            </td>
	                            <td><label for="cap">용량</label> <input type="text" id="cap" name="p_cap"> ml</td>
	                        </tr>
	
	                        <tr>
	                            <td id="td-rowspan2">
	                                <button type="button" class="btn btn-default" onclick="fileUploadBtn()">사진등록</button>
	                                <label for="p_img" class="custom-file-label"></label>
	                                <input type="file" id="p_img" name="uploadFile">
	                            </td>
	                            <td><label for="stock">수량</label> <input type="text" id="stock" name="p_stock"> 개</td>
	                        </tr>
	                    </table>
	
	                    <table class="table table0" id="form1">
	                        <tr>
	                            <th>주류종류</th>
	                            <td><input type="radio" name="p_type" id="p_type1" value="약·청주"> <label for="p_type1">약·청주</label></td>
	                            <td><input type="radio" name="p_type" id="p_type2" value="소주"> <label for="p_type2">소주</label></td>
	                            <td><input type="radio" name="p_type" id="p_type3" value="증류주"> <label for="p_type3">증류주</label></td>
	                            <td><input type="radio" name="p_type" id="p_type4" value="과실주"> <label for="p_type4">과실주</label></td>
	                            <td><input type="radio" name="p_type" id="p_type5" value="기타"> <label for="p_type5">기타</label></td>
	                        </tr>
	                        <tr>
	                            <th>단맛</th>
	                            <td><input type="radio" name="p_sw" id="p_sw1" value="강"> <label for="p_sw1">강</label></td>
	                            <td><input type="radio" name="p_sw" id="p_sw2" value="중"> <label for="p_sw2">중</label></td>
	                            <td><input type="radio" name="p_sw" id="p_sw3" value="약"> <label for="p_sw3">약</label></td>
	                        </tr>
	                        <tr>
	                            <th>신맛</th>
	                            <td><input type="radio" name="p_su" id="p_su1" value="강"> <label for="p_su1">강</label></td>
	                            <td><input type="radio" name="p_su" id="p_su2" value="중"> <label for="p_su2">중</label></td>
	                            <td><input type="radio" name="p_su" id="p_su3" value="약"> <label for="p_su3">약</label></td>
	                        </tr>
	                        <tr>
	                            <th>탄산</th>
	                            <td><input type="radio" name="p_sp" id="p_sp1" value="강"> <label for="p_sp1">강</label></td>
	                            <td><input type="radio" name="p_sp" id="p_sp2" value="중"> <label for="p_sp2">중</label></td>
	                            <td><input type="radio" name="p_sp" id="p_sp3" value="약"> <label for="p_sp3">약</label></td>
	                            <td><input type="radio" name="p_sp" id="p_sp4" value="없음"> <label for="p_sp4">없음</label></td>
	                        </tr>
	                        <tr>
	                            <th>원료</th>
	                            <td><input type="radio" name="p_mat" id="p_mat1" value="과일"> <label for="p_mat1">과일</label></td>
	                            <td><input type="radio" name="p_mat" id="p_mat2" value="꽃"> <label for="p_mat2">꽃</label></td>
	                            <td><input type="radio" name="p_mat" id="p_mat3" value="견과"> <label for="p_mat3">견과</label></td>
	                            <td><input type="radio" name="p_mat" id="p_mat4" value="약재"> <label for="p_mat4">약재</label></td>
	                            <td><input type="radio" name="p_mat" id="p_mat5" value="기타"> <label for="p_mat5">기타</label></td>
	                        </tr>
	                    </table>
	            </div>
	            <div class="modal-footer">
	                <button type="submit" class="btn btn-primary">상품등록</button>
	                <button type="button" class="btn btn-default" data-dismiss="modal">등록취소</button>
	            </div>
	        </div>
		</form>
    </div>
</div>
	
	
	<script>
    function fileUploadBtn() {
        $(".custom-file-label").click();
    };
    
    $("#p_img").change(function(event){
        var fileInput = document.getElementById('p_img');
        // 파일이 선택되었는지 확인합니다.
        if (fileInput.files.length > 0) {
            // 파일이 선택된 경우, 파일 이름을 가져와서 표시합니다.
            console.log(fileInput.files[0]);
            var fileName = fileInput.files[0].name;
            console.log(fileName);
            document.getElementById("div-filename").innerText = fileName;

            // 파일 입력 요소에서 선택된 파일 가져오기
            var file = event.target.files[0];
    
            // FileReader 객체 생성
            var reader = new FileReader();
    
            // 파일을 읽은 후 실행될 함수 정의
            reader.onload = function(event) {
                // 이미지를 표시할 img 요소 가져오기
                var imgElement = document.getElementById('preview');
    
                // FileReader가 읽은 데이터를 img 요소의 src 속성에 설정하여 이미지 표시
                imgElement.src = event.target.result;
                console.log(imgElement.src);
            };
    
            // 파일을 읽기
            reader.readAsDataURL(file);
        }
    });
	</script>
</div>
</body>
</html>
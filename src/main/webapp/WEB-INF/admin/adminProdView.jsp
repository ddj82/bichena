<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userID") == null) {%>
<script>
location.href="main.ko";
</script>
<%}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
</style>
<script>
</script>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain2.jsp" %>
<div class="container">
	<nav id="searchNav">
		<form action="adminProdList.ko" method="post">
			<select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
				<option value="${conditionMapProd['상품명']}">상품명</option>
				<option value="${conditionMapProd['상품번호']}">상품번호</option>
				<option value="${conditionMapProd['주종']}">주종</option>
			</select>
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
			<button type="submit" class="btn btn-primary btn-sm">검색</button>
		</form>
		<button type="button" class="btn btn-warning" onclick="location.href='adminProdInsertBtn.ko';">주류등록</button>
	</nav>
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
				<th>수정하기</th>
				<th>삭제하기</th>
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
	                <button type="button" class="btn btn-primary btn-sm" onclick="prodDetail('${prodlist.p_no }')">상세보기</button>
	            </td>
	            <td>
	                <button type="button" class="btn btn-success btn-sm" onclick="prodUpdate('${prodlist.p_no }')">수정하기</button>
	            </td>
	            <td>
	                <button type="button" class="btn btn-danger btn-sm" onclick="prodDelete('${prodlist.p_no }')">삭제하기</button>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 처리 -->
	<c:choose>
	    <c:when test="${pagination.currPageNo == 1}">
	        <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
	        <span>이전</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 이전 페이지로 이동하는 링크 -->
	        <a href="adminProdList.ko?currPageNo=${pagination.currPageNo - 1}" class="btn btn-primary btn-xs">이전</a>
	    </c:otherwise>
	</c:choose>
	
       <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
           <c:choose>
               <c:when test="${page eq pagination.currPageNo}">
                   <span>${page}</span>
               </c:when>
               <c:otherwise>
                   <a href="adminProdList.ko?currPageNo=${page}" class="">${page}</a>
               </c:otherwise>
           </c:choose>
       </c:forEach>

	<c:choose>
	    <c:when test="${pagination.currPageNo == pagination.pageCnt}">
	        <!-- 현재 페이지가 마지막 페이지인 경우 -->
	        <span>다음</span>
	    </c:when>
	    <c:otherwise>
	        <!-- 다음 페이지로 이동하는 링크 -->
	        <a href="adminProdList.ko?currPageNo=${pagination.currPageNo + 1}" class="btn btn-primary btn-xs">다음</a>
	    </c:otherwise>
	</c:choose>
<script>
function prodDetail(pno){
	location.href = 'adminProdDetail.ko?p_no=' + pno;
}
function prodUpdate(pno){
	location.href = 'adminProdUpdateSet.ko?p_no=' + pno;
}
function prodDelete(pno){
	location.href = '.ko?p_no=' + pno;
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
	                            <td><input type="radio" name="p_type" id="p_type1" value="탁주"> <label for="p_type1">탁주</label></td>
	                            <td><input type="radio" name="p_type" id="p_type2" value="약·청주"> <label for="p_type2">약·청주</label></td>
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
</body>
</html>
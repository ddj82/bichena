<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="adminMain.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css"/>
<style>
body {
margin: 0;
padding: 0;
}

.container#container-memList{
margin: 10px auto;
padding: 50px 20px;
 border-radius: 8px;
}

table.table {
width: 100%;
margin-bottom: 16px;
border-collapse: collapse;
table-layout: fixed;
}

table.table th, 
table.table td { 
padding: 12px; 
text-align: center; 
} 

.table>tbody>tr>td{
vertical-align: middle;
border-top: 1px solid #ddd;
}


table.table thead th { 
text-align: center; 
border-bottom: 2px solid #000; 
} 

table.table tbody+tbody { 
border-top: 2px solid #dee2e6; 
} 
 
.table>thead>tr>th {
padding: 15px 8px;
line-height: 1.4;
}

.divTable{
margin-top: 50px;
}

#selecState{
border: none;
}

#selecState:focus{
outline: none; 
}

.btn-info {
color: #fff;
background-color: #0a6633e5;
border: none;
font-size: 15px;
}

.deBtn{
border-bottom:0px;
}

.searchForm {
margin-bottom: 20px;
text-align: center;
margin-top: 30px;
display: flex;
justify-content: center;
}

.searchForm select,
.searchForm input[type="text"],
.searchForm button {
height: 40px;
border: 1px solid #000;
border-radius: 4px;
margin: 10px 5px;;
}

.searchForm select {
width: 105px;
}

.searchForm input[type="text"] {
width: 230px;
}

.searchForm button {
/*     background-color: #005930; */
background-color: #0a6633e5;
color: #fff;
border: none;
cursor: pointer;
}

.searchForm button:hover {
/*     background-color: #B8B388; */
background-color: #2d4739;
}

#detailMemBtn:hover{
background-color: #2d4739;
border: none;
}

.list-pagination {
display: flex!important;
justify-content: center;
margin-bottom: 60px!important;
margin-top: 20px!important;
}

page-link:hover {
z-index: 2;
/* color: green!important!important; */
text-decoration: none!important;
/* background-color: #e9ecef!important; */
/* border-color: #dee2e6!important; */
border-radios: 5px!important;
}

.page-link:focus {
box-shadow: 0 0 0 .2rem rgb(23 147 9 / 25%)!important;
/* color: green!important; */
border-radius: 5px!important;
}

.page-link {
padding: .5rem .75rem!important;
margin-left: -1px;
line-height: 1.25!important;
/* color: green!important; */
/* background-color: #fff!important; */
border: none!important;
}

.page-item.active .page-link {
/* background-color: green!important; */
/* border-color: green!important; */
border-radius: 5px!important;
color:white!important;
}

.findMem{
text-align: center;
margin-top: 30px;
display: right;
}


/* 모달 */
.modal-header {
    background-color: #dabc7a;
    color: white;
    padding: 15px;
/*     border-bottom: 1px solid #ddd; */
}

.modal-footer {
    padding: 15px;
    border-top: 1px solid #ddd;
}

div.modal-content div.modal-body table.table.table-bordered tr th.tr.detail-th{
	width: 30%;
	text-align: center;
	vertical-align: middle;
}

div.modal-content div.modal-body table.table.table-bordered tr td{
	text-align: left;
	padding: 15px;
}

.btn-info:focus {
    color: #fff;
/*     border-color: #1b6d85; */
    background-color: #2d4739;
    bolder:none;
    outline:none;
}

button#detailMemBtn {
    background-color: #0a6633e5;
}

button#detailMemBtn:active {
    background-color: #2d4739;
    bolder:none;
    outline:none;
}
</style>
<style>

/* extra small */
@media screen and (max-width:540px){
/*
	select#selOp {
	    width: 20px;
	    margin-left: 5px;
	    margin-right: 5px;
	}
	
	.searchForm input[type="text"] {
	    width: 150px;
	    margin-left: 5px;
	    margin-right: 5px;
	}
	
	.searchForm button {
	    margin-left: 5px;
	}
	
	
	table.table.divTable {
	    font-size: 20px;
	}
	.container {
	        width: 300px;
	}
	
	.container#container-memList {
	    margin: 10px auto;
	    padding: 50px 10px;
	    border-radius: 8px;
	}
	    
	.divTable thead {
	    border: none;
	    clip: rect(0 0 0 0);
	    height: 1px;
	    margin: -1px;
	    overflow: hidden;
	    padding: 0;
	    position: absolute;
	    width: 1px;
	}
	
	.divTable th {
	    display: block;
	}
	
	.divTable tr {
	   	border-top: 3px solid black;
	    display: block;
	    margin-bottom: 50px;
	}
	
	.divTable td {
	    display: block;
	    font-size: .8em;
	    text-align: right;
	}
	
	.divTable td::before {
	    content: attr(data-label);
	    float: left;
	    font-weight: bold;
	    text-transform: uppercase;
	}
	
	   .btn-info {
	    color: #fff;
	    background-color: #0a6633e5;
	    border: none;
	    font-size: 14px;
	}
 */   
	div#container-MemList table.table th.css-none,
	div#container-MemList table.table td.css-none,
   	div#container-MemList table.table th.css-none2,
	div#container-MemList table.table td.css-none2 {
		display: none;
	}
	div#container-MemList table.table {
/* 		width: 80%; */
		margin: 0 auto;
	}
}


/* small */
@media screen and (min-width:541px) and (max-width:720px) {
/*

	table.table.divTable {
	    font-size: 20px;
	}
	.container {
	       width: 500px;
	}
	    
	.divTable thead {
	    border: none;
	    clip: rect(0 0 0 0);
	    height: 1px;
	    margin: -1px;
	    overflow: hidden;
	    padding: 0;
	    position: absolute;
	    width: 1px;
	}
	
	.divTable th {
	    display: block;
	}
	
	.divTable tr {
	    border-top: 3px solid black;
	    display: block;
	    margin-bottom: 50px;
	}
	
	.divTable td {
	    display: block;
	    font-size: 16px;
	    text-align: right;
	}
	
	.divTable td::before {
	    content: attr(data-label);
	    float: left;
	    font-weight: bold;
	    text-transform: uppercase;
	}
   */
   	div#container-MemList table.table th.css-none,
	div#container-MemList table.table td.css-none,
   	div#container-MemList table.table th.css-none2,
	div#container-MemList table.table td.css-none2 {
		display: none;
	}
}


/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
/*

	table.table.divTable {
	    font-size: 20px;
	}
	.container {
	       width: 550px;
	    }
	    
	.divTable thead {
	    border: none;
	    clip: rect(0 0 0 0);
	    height: 1px;
	    margin: -1px;
	    overflow: hidden;
	    padding: 0;
	    position: absolute;
	    width: 1px;
	}
	
	.divTable th {
	    display: block;
	}
	
	.divTable tr {
		border-top: 2px solid black;
	    border-bottom: 0px solid black;
		display: block;
		margin-bottom: 50px;
	}
	
	.divTable td {
	    display: block;
	    text-align: right;
	}
	
	.divTable td::before {
	    content: attr(data-label);
	    float: left;
	    font-weight: bold;
	    text-transform: uppercase;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	    line-height: 2;
	}
*/
	div#container-MemList table.table th.css-none,
	div#container-MemList table.table td.css-none {
		display: none;
	}
}


/* large */
@media screen and (min-width:961px) and (max-width:1150px) {
	table.table.divTable {
	    font-size: 14px;
	}
	.container {
	        width: auto;
	}
	
	table .memEmail{
		width:
	}

}


/* 관리자 회원관리페이지 id말줄임 */
#user-id, #userid-td {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<script>
$(function(){
	$("#selecState").change(function(){
		stateValue = document.getElementById("selecState").value;
		console.log("stateValue : " + stateValue);
    	location.href = "getUserList.ko?selectedStateValue=" + stateValue;
	});
	
});
</script>
</head>
<body>
<div class="container" id="container-MemList">
    <h2 style="margin-bottom:20px; font-weight:bold; font-size: 24px;">회원 전체 목록</h2>
    <div class="divTable" >
	<table class="table">
        <thead>
            <tr> 
                <th>회원번호</th>
                <th class="css-none">아이디</th>
                <th>회원명</th>
                <th class="css-none">전화번호</th>
                <th class="css-none">등급</th>
                <th class="css-none2">
               	<select name="slecState"  id="selecState">
                	<option selected>회원상태</option>
                	<option value="1">활동</option>
                	<option value="0">비활성</option>
                </select> 
                </th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="user">
                <c:if test="${user.u_id ne 'admin'}">
                    <tr>
                        <td>${user.u_no}</td>
                        <td class="css-none" id="userid-td">${user.u_id}</td>
                        <td>${user.u_name}</td>
                        <td class="css-none">${user.u_tel}</td>
                        <td class="css-none">${user.u_lev}</td>
						<td id="userState" class="css-none2">
							<c:choose>
								<c:when test="${user.u_state == '3'}">이메일</c:when>
								<c:when test="${user.u_state == '2'}">카카오</c:when>
								<c:when test="${user.u_state == '1'}">네이버</c:when>
								<c:when test="${user.u_state == '0'}">비활성</c:when>
							</c:choose>
						</td>
                        <td class="deBtn"><button type="button" class="btn btn-info btn-lg" id="detailMemBtn" data-toggle="modal" data-target="#myModal" onclick="detailMem('${user.u_id}')">상세 보기</button>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
    </div>
	<!-- 검색 -->
    <div class="searchDiv">
    <form action="getUserList.ko" class="searchForm" id="searchForm" method="post">
    <select id="selOp" name="searchVoca">
    	<c:choose>
			<c:when test="${searchVoca == ''}">
    			<option value="${conditionMapMem['ID']}">ID</option>
    			<option value="${conditionMapMem['휴대전화']}">휴대전화</option>
    			<option value="${conditionMapMem['이메일']}">이메일</option>
    			<option value="${conditionMapMem['회원번호']}">회원번호</option>
    			<option value="${conditionMapMem['회원명']}">회원명</option>
    		</c:when>
    		<c:when test="${searchVoca == 'u_tel'}">
    			<option value="${conditionMapMem['휴대전화']}">휴대전화</option>
    			<option value="${conditionMapMem['ID']}">ID</option>
    			<option value="${conditionMapMem['이메일']}">이메일</option>
    			<option value="${conditionMapMem['회원번호']}">회원번호</option>
    			<option value="${conditionMapMem['회원명']}">회원명</option>
    		</c:when>
    		<c:when test="${searchVoca == 'u_email'}">
    			<option value="${conditionMapMem['이메일']}">이메일</option>
    			<option value="${conditionMapMem['ID']}">ID</option>
    			<option value="${conditionMapMem['휴대전화']}">휴대전화</option>
    			<option value="${conditionMapMem['회원번호']}">회원번호</option>
    			<option value="${conditionMapMem['회원명']}">회원명</option>
    		</c:when>
    		<c:when test="${searchVoca == 'u_no'}">
    			<option value="${conditionMapMem['회원번호']}">회원번호</option>
    			<option value="${conditionMapMem['ID']}">ID</option>
    			<option value="${conditionMapMem['휴대전화']}">휴대전화</option>
    			<option value="${conditionMapMem['이메일']}">이메일</option>
    			<option value="${conditionMapMem['회원명']}">회원명</option>
    		</c:when>
    		<c:when test="${searchVoca == 'u_name'}">
    			<option value="${conditionMapMem['회원명']}">회원명</option>
    			<option value="${conditionMapMem['ID']}">ID</option>
    			<option value="${conditionMapMem['휴대전화']}">휴대전화</option>
    			<option value="${conditionMapMem['이메일']}">이메일</option>
    			<option value="${conditionMapMem['회원번호']}">회원번호</option>
    		</c:when>
    		<c:otherwise>
    			<option value="${conditionMapMem['ID']}">ID</option>
    			<option value="${conditionMapMem['휴대전화']}">휴대전화</option>
    			<option value="${conditionMapMem['이메일']}">이메일</option>
    			<option value="${conditionMapMem['회원번호']}">회원번호</option>
    			<option value="${conditionMapMem['회원명']}">회원명</option>
    		</c:otherwise>
    		</c:choose>
    </select>
    <c:choose>
    	<c:when test="${searchWord == ''}">
    		<input type="text" name="searchWord" placeholder="검색어를 입력해주세요">
    	</c:when>
    	<c:otherwise>
    		<input type="text" name="searchWord" value="${searchWord}">
    	</c:otherwise>
    </c:choose>
    		<button type="submit" id="memSearch" onclick="searchMem()">검색</button>
    </form>
    </div>
    
    
    <!-- 페이징 처리 -->
    <ul class="pagination list-pagination">
		<c:choose>
			<c:when test="${pagination.currPageNo == 1}">
				<!-- 현재 페이지가 첫 번째 페이지인 경우 -->
				<li class="page-item"><a class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
           			 <a class="page-link" href="getUserList.ko?currPageNo=${pagination.currPageNo - 1}&selectedStateValue=${state}&searchVoca=${voca}&searchWord=${word}">이전</a>
         		</li>
			</c:otherwise>
		</c:choose>
		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
			<c:choose>
				<c:when test="${page eq pagination.currPageNo}">
					<li class="page-item active"><a class="page-link">${page}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
           			 	<a class="page-link" href="getUserList.ko?currPageNo=${page}&selectedStateValue=${state}&searchVoca=${voca}&searchWord=${word}">${page}</a>
         			</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pagination.currPageNo == pagination.pageCnt or pagination.pageCnt <= 1}">
				<!-- 현재 페이지가 마지막 페이지인 경우 -->
				<li class="page-item"><a class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
				<!-- 다음 페이지로 이동하는 링크 -->
					<li class="page-item">
           			 	<a class="page-link" href="getUserList.ko?currPageNo=${pagination.currPageNo + 1}&selectedStateValue=${state}&searchVoca=${voca}&searchWord=${word}">다음</a>
         			</li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	
    <script>
    function searchMem(){
        if(searchForm.searchWord.value == ""){
           alert("검색어를 입력해 주세요.");
           searchForm.searchWord.focus();
        } else{
           searchForm.submit();          
        }
     }
    
	function detailMem(u_id){
		console.log("u_id:"+u_id);
		let objParams = {"u_id":u_id};
		$.ajax({
			type : "post",
			url : "userDetail.ko",
			data : objParams,
			cache : false,
			success : function(val) {
				console.log("val:"+val);
				$("#user-no").text("");
				$("#user-name").text("");
				$("#user-id").text("");
				$("#user-nick").text("");
				$("#user-lev").text("");
				$("#user-gen").text("");
				$("#user-phone").text("");
				$("#user-email").text("");
				$("#user-addr").text("");
				$("#user-state").text("");
				
				$("#user-no").append(val.u_no);
				$("#user-name").append(val.u_name);
				$("#user-id").append(val.u_id);
				$("#user-nick").append(val.u_nick);
				$("#user-lev").append(val.u_lev);
				$("#user-gen").append(val.u_gen);
				$("#user-phone").append(val.u_tel);
				$("#user-email").append(val.u_email);
				$("#user-addr").append(val.addr1 + " " + val.addr2 + " " + val.addr3);
				$("#user-state").append();
				if(val.u_state == 1){
					$("#user-state").append("활동 중(네이버)");
				} else if(val.u_state == 0){
					$("#user-state").append("계정 비활성");
				} else if(val.u_state == 2){
					$("#user-state").append("활동 중(카카오)");
				} else if(val.u_state == 3){
					$("#user-state").append("활동 중(이메일)");
				}
			}
		});	
	}
</script>

  <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title">회원 상세 정보</h3>
            </div>
                
            <div class="modal-body">
            	<table class="table table-bordered">
                    <tr>
                        <th class="tr detail-th">회원번호</th>
                        <td id="user-no"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">회원명</th>
                        <td id="user-name"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">아이디</th>
                        <td id="user-id"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">닉네임</th>
                        <td id="user-nick"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">등급</th>
                        <td id="user-lev"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">성별</th>
                        <td id="user-gen"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">휴대전화</th>
                        <td id="user-phone"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">이메일</th>
                        <td id="user-email"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">주소</th>
                        <td id="user-addr"></td>
                    </tr>
                    <tr>
                        <th class="tr detail-th">회원상태</th>
                        <td id="user-state"></td>
					</tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
  
</div>
</body>
</html>
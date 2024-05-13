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
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
table.table>tbody>tr>td, table.table>tbody>tr>th, table th {
    text-align: center;
    vertical-align: middle;
}
table {
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain2.jsp" %>
<div class="container">
    <h3>회원 전체 목록</h3>
	<table class="table">
        <thead>
            <tr> 
                <th>회원번호</th>
                <th>아이디</th>
                <th>회원명</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>등급</th>
                <th>회원상태</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userList}" var="user">
                <c:if test="${user.u_id ne 'admin'}">
                    <tr>
                        <td>${user.u_no}</td>
                        <td>${user.u_id}</td>
                        <td>${user.u_name}</td>
                        <td>${user.u_tel}</td>
                        <td>${user.u_email}</td>
                        <td>${user.u_lev}</td>
                        <td>${user.u_state}</td>
                        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="detailMem('${user.u_id}')">회원 상세 보기</button>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
	<!-- 검색 -->
    <div style="text-align: center;">
    <form action="getUserList.ko" class="searchUser" id="searchUser" method="post">
    <select id="selOp" name="searchVoca">
    	<c:forEach items="${conditionMapMem}" var="option">
    		<option value="${option.value}">${option.key}</option>
		</c:forEach>
    </select>
    	<input type="text" name="searchWord" placeholder="검색어를 입력해주세요">
    	<button type="submit" onclick="searchMem()" class="btn btn-primary btn-sm">검색</button>
    </form>
    </div>
    
    <script>
    
    function searchMem(){
    	if(searchUser.searchWord.value == ""){
    		alert("검색어를 입력해 주세요.");
    		searchUser.searchWord.focus();
    	} else{
    		searchUser.submit();    		
    	}
    }

    
	function detailMem(u_id){
		console.log("u_id:" + u_id);
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
				
				$("#user-no").append("회원번호 : " + val.u_no);
				$("#user-name").append("회원명 : " + val.u_name);
				$("#user-id").append("아이디 : " + val.u_id);
				$("#user-nick").append("닉네임 : " + val.u_nick);
				$("#user-lev").append("등급 : " + val.u_lev);
				$("#user-gen").append("성별 : " + val.u_gen);
				$("#user-phone").append("휴대전화 : " + val.u_tel);
				$("#user-email").append("이메일 : " + val.u_email);
				$("#user-addr").append("주소 : " + val.addr1 + " " + val.addr2 + " " + val.addr3);
				$("#user-state").append("회원상태 : " + val.u_state);
			}
		});	
	}
</script>




  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title">회원 상세 정보</h3>
            </div>
                
            <div class="modal-body">
                <h4 class="modal-title" id="user-no"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-name"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-id"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-nick"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-lev"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-gen"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-phone"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-email"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-addr"></h4>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="user-state"></h4>
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
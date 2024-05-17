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
<style>
table.table>tbody>tr>td, table.table>tbody>tr>th, table th {
    text-align: center;
    vertical-align: middle;
}
table {
	text-align: center;
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
<div class="container">
<!--     <h3>회원 전체 목록</h3> -->
	<table class="table">
        <thead>
            <tr> 
                <th>회원번호</th>
                <th>아이디</th>
                <th>회원명</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>등급</th>
                <th>회원상태
               	<select name="selecState"  id="selecState">
                	<option selected>==</option>
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
                        <td>${user.u_id}</td>
                        <td>${user.u_name}</td>
                        <td>${user.u_tel}</td>
                        <td>${user.u_email}</td>
                        <td>${user.u_lev}</td>
						<td id="userState">
							<c:choose>
								<c:when test="${user.u_state == '1'}">이메일</c:when>
								<c:when test="${user.u_state == '2'}">카카오</c:when>
								<c:when test="${user.u_state == '3'}">네이버</c:when>
								<c:when test="${user.u_state == '0'}">비활성</c:when>
							</c:choose>
						</td>
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
    	<c:choose>
			<c:when test="${option.key == 'ID'}">
    			<option value="${option.value}" selected>${option.key}</option>
    		</c:when>
    		<c:otherwise>
    			<option value="${option.value}">${option.key}</option>
    		</c:otherwise>
    		</c:choose>
		</c:forEach>
    </select>
    	<input type="text" name="searchWord" placeholder="검색어를 입력해주세요">
    	<button type="submit" onclick="searchMem()" class="btn btn-primary btn-sm">검색</button>
    </form>
    </div>
    
    
    <!-- 페이징 처리 -->
		<c:choose>
	    	<c:when test="${pagination.currPageNo == 1}">
		        <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
		        <span>이전</span>
	    	</c:when>
	    	<c:otherwise>
		        <!-- 이전 페이지로 이동하는 링크 -->
		        <a href="getUserList.ko?currPageNo=${pagination.currPageNo - 1}&selectedStateValue=${state}&searchVoca=${voca}&searchWord=${word}" class="btn btn-primary btn-xs">이전</a>
	    	</c:otherwise>
		</c:choose>
		
        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
            <c:choose>
                <c:when test="${page eq pagination.currPageNo}">
                    <span>${page}</span>
                </c:when>
                <c:otherwise>
                    <a href="getUserList.ko?currPageNo=${page}&selectedStateValue=${state}&searchVoca=${voca}&searchWord=${word}" class="">${page}</a>
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
		        <a href="getUserList.ko?currPageNo=${pagination.currPageNo + 1}&selectedStateValue=${state}&searchVoca=${voca}&searchWord=${word}" class="btn btn-primary btn-xs">다음</a>
		    </c:otherwise>
		</c:choose>
    
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
				
				$("#user-no").append("회원번호 : " + val.u_no);
				$("#user-name").append("회원명 : " + val.u_name);
				$("#user-id").append("아이디 : " + val.u_id);
				$("#user-nick").append("닉네임 : " + val.u_nick);
				$("#user-lev").append("등급 : " + val.u_lev);
				$("#user-gen").append("성별 : " + val.u_gen);
				$("#user-phone").append("휴대전화 : " + val.u_tel);
				$("#user-email").append("이메일 : " + val.u_email);
				$("#user-addr").append("주소 : " + val.addr1 + " " + val.addr2 + " " + val.addr3);
				$("#user-state").append("회원상태 : ");
				if(val.u_state == 1){
					$("#user-state").append("활동 중");
				} else if(val.u_state == 0){
					$("#user-state").append("비활성화");
				}
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
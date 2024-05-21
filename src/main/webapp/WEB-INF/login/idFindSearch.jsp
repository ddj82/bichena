<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.drink.ko.vo.UsersVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
if (request.getParameter("u_name") == null || request.getParameter("u_name").equals("")) {%>
	<script>location.href="idf.ko";</script>
<!-- 	response.sendRedirect("idf.ko"); -->
<%}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비채나</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>

.idFindSearchMainBox {
    margin-top: 70px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

div#box1 {
	text-align: center;
	margin-top: 80px;
	font-size: 20px;
    color: #2d4739;
    font-weight: bolder
}

div#box2 {
	text-align: center;
	margin-top: 50px;
	font-size: 20px;
    color: #2d4739;
    font-weight: bolder
}

.kakaoBox {
	width: 300px;
	display: flex;
	margin-bottom: 15px;
	font-weight: bold;
}

.naverBox {
	width: 300px;
	display: flex;
	margin-bottom: 15px;
	font-weight: bold;
}

.bichenaBox {
	width: 300px;
	display: flex;
	margin-bottom: 15px;
	font-weight: bold;
}

img {
	margin-right: 20px;
}

a.loginbutton {
    width: 150px;
    height: 40px;
    justify-content: center;
    align-items: center;
    color: #fff;
    background-color: #005930;
    outline: none;
    box-sizing: border-box;
    border: 1px solid transparent;
    line-height: 40px;
    border-radius: 6px;
    margin-bottom: 30px;
    display: inline-block;
    text-align: center;
    text-decoration: none;
    margin-right: 30px;
}

a.pwFindbutton {
    width: 150px;
    height: 40px;
    justify-content: center;
    align-items: center;
    color: #fff;
    background-color: #005930;
    outline: none;
    box-sizing: border-box;
    border: 1px solid transparent;
    line-height: 40px;
    border-radius: 6px;
    margin-bottom: 30px;
    display: inline-block;
    text-align: center;
    text-decoration: none;
}

a.joinInsertButton{
	width: 150px;
    height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
	background-color: #005930;
	outline: none;
    box-sizing: border-box;
    border: 1px solid transparent;
    padding: 10px 16px;
    line-height: 40px;
    border-radius: 6px;
    margin-bottom: 30px;
    text-decoration: none;
    
}

#buttonInsert {
	margin-top: 40px;
    display: flex;
    margin-top: 30px;
    justify-content: center;
}

div#idKakao {
	display: flex;
	align-items: center;
}

div#idNaver {
	display: flex;
	align-items: center;
}

div#idUser {
	display: flex;
	align-items: center;
}

.idFindSearchSubBox {
    border: 3px solid #2d4739;
    width: 700px;
    height: 350px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
}

.noneList {
    font-size: 20px;
    color: #2d4739;
    font-weight: bolder;
}

a.pwFindbutton:hover,a.joinInsertButton:hover,a.loginbutton:hover { 
 	color: #fff; 
 	background-color: #2d4739;
    border-color: #2d4739;
 	outline: none; 
 }



@media (max-width: 575px) {

       .idFindSearchSubBox {
		width: 324.91px;
	}
	
	div#box2 {
    text-align: center;
    margin-top: 50px;
    font-size: 18px;
    color: #2d4739;
    font-weight: bolder;
}

.bichenaBox,.kakaoBox,.naverBox {
    width: 300px;
    display: flex;
    margin-bottom: 15px;
    font-weight: bold;
    justify-content: center;
}

.bichenaBox,.kakaoBox,.naverBox {
    width: 300px;
    display: flex;
    margin-bottom: 15px;
    font-weight: bold;
    justify-content: center;
}

a.loginbutton{
    margin-right: 13px;
}

a.loginbutton,a.pwFindbutton {
    width: 120px;
}

.noneList,div#box1 {
    font-size: 18px;
    text-align: center;	
}

div#idUser,div#idNaver,div#idKakao {
    font-size: 15px;
}

img {
    width: 30px;
}

      }

</style>
<script>

$(window).ready(function(){
	if($(window).width() <= 575){
		$('.noneList').html("입력하신 정보와 일치하는<br>아이디가 없습니다.");
	}
});

$(window).resize(function(){
	if($(window).width() <= 575){
		$('.noneList').html("입력하신 정보와 일치하는<br>아이디가 없습니다.");
	}
});

$(window).resize(function(){
	if($(window).width() > 575){
		$('.noneList').html("입력하신 정보와 일치하는 아이디가 없습니다.");
	}
});
</script>
</head>
<body>
	<div class="idFindSearchMainBox">
		<div class="idFindSearchSubBox">
			
			
			<c:choose>
			<c:when test="${userList == null or fn:length(userList) == 0}">
			<div id="box1">회원님의 아이디를 확인해 주세요</div>
			<div id="idFindList">
			<div class="noneList">입력하신 정보와 일치하는 아이디가 없습니다.</div>
			</div>
			<div id="buttonInsert">
				<a href="insertPage.ko" class="joinInsertButton">회원가입</a> 
			</div>
			</c:when>
			<c:otherwise>
			<div id="box2">회원님의 아이디를 확인해 주세요</div>
			<div id="idFindList">
				<c:forEach items="${userList}" var="list">
					<c:choose>
						<c:when test="${list.u_state eq 2 }">
							<div class="kakaoBox">
								<img src="img/login/k_Icon.png" alt="카카오 아이콘" />
								<div id="idKakao"></div>
								<script>
									var str = "${list.u_id}";
									var kakao = str.search('@');
									//@전까지 가져오기
									let k_id1 = str.substring(0, kakao);

									let k_id2 = k_id1.substring(0, 3);
									let k_id3 = k_id1.substring(3);
									let k_id4 = str.substring(kakao);
									let k_star = "";
									for (let i = 0; i < k_id3.length; i++) {
										k_star += "*";
									 // k_id2 += "*";
									}

									// k_id4 = k_id2 + k_id4;

// 									$("#idKakao").html(k_id2+'<div id="idKakaoStar" style="color:#e5c687">'+k_star+'</div>'+k_id4);
									$("#idKakao").html(k_id2+k_star+k_id4);
								</script>
							</div>
						</c:when>
						<c:when test="${list.u_state eq 1 }">
							<div class="naverBox">
								<img src="img/login/n_Icon.png" alt="네이버 아이콘" />
								<div id="idNaver"></div>
								<script>
									var str = "${list.u_id}";
									console.log("str :",str)
									var naver = str.search('@');
									//@전까지 가져오기
									let n_id1 = str.substring(0, naver);
								// 05-12 변수명 n_id1로 변경
									let n_id2 = n_id1.substring(0, 3);
									let n_id3 = n_id1.substring(3);
									let n_id4 = str.substring(naver);
									let n_star = "";

									for (let i = 0; i < n_id3.length; i++) {
										n_star += "*";
// 										n_id2 += "*";
									}

// 									n_id4 = n_id2 + n_id4;

// 									$("#idNaver").html(n_id2+'<div id="idNaverStar" style="color:#e5c687">'+n_star+'</div>'+n_id4);
									$("#idNaver").html(n_id2+n_star+n_id4);
								</script>
							</div>
						</c:when>
						<c:otherwise>
							<div class="bichenaBox">
<!-- 							05-12 alt변경 -->
								<img src="img/login/bichena.png" alt="bichena 아이콘" />
								<div id="idUser"></div>
								<script>
									let idUser = "${list.u_id}";
									let id1 = idUser.substring(0, 3);
									let id2 = idUser.substring(3, 6);
									let id3 = idUser.substring(6);
									let idStar ="";
									for (let i = 0; i < id2.length; i++) {
// 										id1 += "*";
										idStar += "*";
									}

// 									$("#idUser").html(id1+'<div id="idStar" style="color:#e5c687;">'+idStar+'</div>'+id3);
									$("#idUser").html(id1+idStar+id3);
								</script>
							</div>
								
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div id="button">
				<a href="loginPage.ko" class="loginbutton">로그인 하기</a> 
				<a href="pwf.ko" class="pwFindbutton">비밀번호 찾기</a>
			</div>
			</c:otherwise>
			</c:choose>
			</div>

		</div>

	<script>
	
		history.replaceState({}, null, location.pathname);
	</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>
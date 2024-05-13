<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.drink.ko.vo.UsersVO"%>
<%
if (request.getParameter("u_name") == null || request.getParameter("u_name").equals("")) {
	response.sendRedirect("idf.ko");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
.idFindSearchSubBox {
	border: 1px solid black;
	width: 700px;
	height: 350px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.idFindSearchMainBox {
	display: flex;
	flex-direction: column;
	align-items: center;
}

div#box1 {
	text-align: center;
	margin: 25px 0px 50px 0px;
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
	background-color: #d5d5d5;
	color: white;
	text-decoration: none;
	width: 150px;
	heigth: 100px;
	display: inline-block;
	height: 40px;
	border-radius: 5px;
	text-align: center;
	line-height: 40px;
	margin-right: 20px;
}

a.pwFindbutton {
	background-color: #0096f3;
	color: white;
	text-decoration: none;
	width: 150px;
	heigth: 100px;
	display: inline-block;
	height: 40px;
	border-radius: 5px;
	text-align: center;
	line-height: 40px;
}

div#button {
	margin-top: 40px;
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

@media ( max-width : 768px) {
	.idFindSearchSubBox {
		width: 324.91px;
	}
	div#idFindList {
		width: 200px;
	}
	div#button {
		display: flex;
	}
	a.loginbutton, a.pwFindbutton {
		width: 100;
		font-size: 13px;
	}
}
</style>
</head>
<body>
	<div class="idFindSearchMainBox">
		<div class="idFindSearchSubBox">
			<div id="box1">회원님의 아이디를 확인해 주세요</div>
			<div id="idFindList">
				<c:forEach items="${userList}" var="list">
					<c:choose>
						<c:when test="${list.u_state eq 2 }">
							<!-- 			경로변경 -->
							<div class="kakaoBox">
								<img src="img/login/kakaoIcon.png" alt="카카오 아이콘" />
								<div id="idKakao"></div>
								<script>
									var str = "${list.u_id}";
									var kakao = str.search('@');
									//@전까지 가져오기
									let k_id1 = str.substring(0, kakao);

									let k_id2 = k_id1.substring(0, 3);
									let k_id3 = k_id1.substring(3);
									let k_id4 = str.substring(kakao);

									for (let i = 0; i < k_id3.length; i++) {
										k_id2 += "*";
									}

									k_id4 = k_id2 + k_id4;

									$("#idKakao").html(k_id4);
								</script>
							</div>
						</c:when>
						<c:when test="${list.u_state eq 3 }">
							<div class="naverBox">
								<!-- 			경로변경 -->
								<img src="img/login/naverIcon.png" alt="네이버 아이콘" />
								<div id="idNaver"></div>
								<script>
									var str = "${list.u_id}";
									var naver = str.search('@');
									//@전까지 가져오기
									let n_id1 = str.substring(0, naver);

									let n_id2 = id1.substring(0, 3);
									let n_id3 = id1.substring(3);
									let n_id4 = str.substring(naver);

									for (let i = 0; i < n_id3.length; i++) {
										n_id2 += "*";
									}

									n_id4 = n_id2 + n_id4;

									$("#idNaver").html(n_id4);
								</script>
							</div>
						</c:when>
						<c:otherwise>
							<div class="bichenaBox">
								<!-- 			경로변경 -->
								<img src="img/login/bichena.png" alt="카카오 아이콘" />
								<div id="idUser"></div>
								<script>
									let idUser = "${list.u_id}";
									let id1 = idUser.substring(0, 3);
									let id2 = idUser.substring(3, 6);
									for (let i = 0; i < id2.length; i++) {
										id1 += "*";
									}

									$("#idUser").html(id1);
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
		</div>
	</div>

	<script>
		history.replaceState({}, null, location.pathname);
	</script>
</body>
</html>
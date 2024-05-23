<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div#boxFlex {
	display: flex;
	justify-content: center;
	width: 1000px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
}
div#appFlex {
	display: none;
	width: 1000px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
}
div.all {
	box-sizing: initial;
	display: flex;
	justify-content: center;
}
.LevelImgNavMypage {
    width: 40px;
    height: 40px;
    margin-top: 10px;
}
div#name {
	padding: 0 200px 0 0;
	border-right: 0.5px solid rgb(178, 178, 178);
}
div#box {
	margin-left: 80px;
}
div#boxP1 {
	margin-left: 30px;
}

div#boxP2 {
	margin-left: 50px;
}

div#boxP3 {
	margin-left: 50px;
}

div#boxP4 {
	margin-left: 40px;
}
img.borrowImg.b {
	position: relative;
	height: 30px;
	width: 30px;
	margin-left: 50px;
}
img#recall {
	margin-left: 85px;
}
a.a_class {
	text-decoration-line: none;
	color: black;
}
a.a_class:visited {
	color: black;
}
.clickList {
	display: none;
	width: 90%;
	margin: 0 auto;
	padding: 15px;
	border: 1px solid rgb(224, 224, 224);
	border-radius: 10px;
}
/* extra small */
@media screen and (max-width:540px) {
   .clickList {
      display: block;
   }
   div#boxFlex {
      display: none;
   }
   div#appFlex {
      display: block;
      width: 90%;
      padding: 0px;
   }
   div.all-app {
      display: flex;
      justify-content: space-around;
      height: 50px;
      align-items: center;
        font-weight: bold;
        font-size: 13px;
   }
   div.list {
      flex-wrap: wrap;
   }
   a.app_class {
      padding-top: 5px;
      padding-bottom: 5px;
      text-decoration-line: none;
      color: black;
      display: flex;
   }
   a.app_class:visited {
      color: black;
   }
   img.borrowImg c {
      width: 25px;
   }
   .img-div {
      margin-right: 5px;
   }
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
   .clickList {
      display: block;
   }
   div#boxFlex {
      display: none;
   }
   div#appFlex {
      display: block;
      width: 90%;
      padding: 0px;
   }
   div.all-app {
      display: flex;
      justify-content: space-around;
      height: 50px;
      align-items: center;
        font-weight: bold;
      font-size: 13px;
   }
   div.list {
      flex-wrap: wrap;
   }
   a.app_class {
      padding-top: 5px;
      padding-bottom: 5px;
      text-decoration-line: none;
      color: black;
      display: flex;
   }
   a.app_class:visited {
      color: black;
   }
   .img-div {
      margin-right: 10px;
   }
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
   .clickList {
      display: block;
   }
   div#boxFlex {
      display: none;
   }
   div#appFlex {
      display: block;
      width: 90%;
      padding: 0px;
   }
   div.all-app {
      display: flex;
      justify-content: space-around;
      height: 50px;
      align-items: center;
        font-weight: bold;
      font-size: 14px;
   }
   div.list {
      flex-wrap: wrap;
   }
   a.app_class {
      padding-top: 5px;
      padding-bottom: 5px;
      text-decoration-line: none;
      color: black;
      display: flex;
   }
   a.app_class:visited {
      color: black;
   }
   .img-div {
      margin-right: 10px;
   }
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
   div#boxFlex {
      width: 90%;
      margin-top: 30px;
   }
}
</style>
<body>
	<div id='boxFlex' class="all">
			<!-- img 추가(양예진) -->
            <c:choose>
	            <c:when test="${uLev eq '실버'}">
	            	<img class="LevelImgNavMypage" src="img/login/S_Level.png" alt="실버 레벨 아이콘"/>
	            </c:when>
	            <c:when test="${uLev eq '골드'}">
	            	<img class="LevelImgNavMypage" src="img/login/G_Level.png" alt="골드 레벨 아이콘"/>
	            </c:when>
	            <c:when test="${uLev eq '다이아'}">
	            	<img class="LevelImgNavMypage" src="img/login/D_Level.png" alt="다이아 레벨 아이콘"/>
	            </c:when>
            </c:choose>
<!--             양예진 수정 -->
		<div id='name' class="all">
			<c:choose>
				<c:when test="${howLogin eq 3}">
					<p style="font-weight: bold; vertical-align: middle; margin:1rem 0;">${userID }</p>
					<p style="vertical-align: middle; margin:1rem 0.5rem;">님</p>
				</c:when>
				<c:when test="${howLogin eq 2}">
					<p style="font-weight: bold; vertical-align: middle; margin:1rem 0;">${uNick }</p>
				    <p style="vertical-align: middle; margin:1rem 0.5rem;">님</p>
				</c:when>
				<c:when test="${howLogin eq 1}">
					<p style="font-weight: bold; vertical-align: middle; margin:1rem 0;">${uNick }</p>
				    <p style="vertical-align: middle; margin:1rem 0.5rem;">님</p>
				</c:when>
			</c:choose>
		</div>
<!--             양예진 수정 끝 -->
		<div id='box' class="all">
			<a href='myPage.ko' class="a_class">
				<div id="boxP1" class="all">주문 내역</div> 
				<!-- myPageMain,myOrderDetail -->
				<img class="borrowImg b" id="order" src='img/imgUser/order.png'>
			</a>
			<a href='orderCancleList.ko' class="a_class">
				<div id="boxP2" class="all">취소/환불내역</div> 
				<!-- 아직 -->
				<img class="borrowImg b" id="recall" src='img/imgUser/recall.png'>
			</a>
			<a href='myRevList.ko' class="a_class">
				<div id="boxP3" class="all">리뷰</div> 
				<!-- RevInsert.jsp -->
				<img class="borrowImg b" id="review" src='img/imgUser/review.png'>
			</a>
			<a href='confirm.ko' class="a_class">
				<div id="boxP4" class="all">회원정보</div> 
				<!-- userMyPassConfirm.jsp 비번확인, userMyInfo.jsp 회원정보 -->
				<!-- myInfoModi.jsp 포함인데 아롬 수정중 -->
				<img class="borrowImg b" id="card" src='img/imgUser/card.png'>
			</a>
		</div>
	</div>
	<div id="appFlex" class="appli">
		<div id='drop' class="all-app">
			<a href='myPage.ko' class="app_class">
				<div class="img-div"><img class="borrowImg c" id="app-order" src='img/imgUser/order.png' style="width:20px;"></div>
				<div id="dropP1" class="list">주문 내역</div> 
			</a>
			<a href='orderCancleList.ko' class="app_class">
				<div class="img-div"><img class="borrowImg c" id="app-recall" src='img/imgUser/recall.png' style="width:20px;"></div>
				<div id="dropP2" class="list">취소/환불내역</div> 
			</a>
			<a href='myRevList.ko' class="app_class">
				<div class="img-div"><img class="borrowImg c" id="app-review" src='img/imgUser/review.png' style="width:20px;"></div>
				<div id="dropP3" class="list">리뷰</div> 
			</a>
			<a href='confirm.ko' class="app_class">
				<div class="img-div"><img class="borrowImg c" id="app-card" src='img/imgUser/card.png' style="width:20px;"></div>
				<div id="dropP4" class="list">회원정보</div> 
			</a>
		</div>
	</div>
</body>
</html>
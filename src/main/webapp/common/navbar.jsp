<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>bichena</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css" />
    <style>

   body {
        background-color: white;
      }
      
	.side-cart .CartLogo{
      	display:block;
    }

	  .navbar_logo img{
	  width:100px;
	  height:100px;
	  padding:10px;
	  }
	  
      .logo_search {
        display: flex;
        align-items: center;
        justify-content: start;
      }
	  .form-inline{
	  margin: 0;
	  }
      .search-container {
        display: flex;
        background-color: #f7f7f7;
        margin-left: 20px;
        align-items: center;
        padding: 10px;
        /* 아이콘과 입력 필드 사이의 간격 조정 */
        border: 2px solid F7F7F7;
        border-radius: 10px;
        width: 230px;
        height: 40px;
      }

      .search-container input {
        border: none;
        display: flex;
        align-items: center;
        background-color: #f7f7f7;
        flex: 1;
        /* 입력 필드가 가능한 한 많은 공간을 차지하도록 설정 */
      }

      input:focus {
        outline: none;
      }

      a {
        color: black;
      }

      .login_signup {
        display: flex;
        justify-content: end;
        align-items: center;
        font-size: 14px;
      }

      .nav-top {
        margin: 0px auto;
        width: 100%;
      }

      .login_signup,
      .navbar-nav-main {
        font-family: "Noto Sans KR", sans-serif;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
      }

      .login:hover {
        text-decoration: none;
        color: black;
      }

      .custom-navbar {
        display: block!important;
        background-color: white;
      }

      .bottom-line {
        display: block;
        width: 100%;
        border-bottom: 1px solid #e0e0e0;
      }

      .section1 {
        display: flex;
        margin: 0px auto;
        max-width: 1144px;
        width: 100%;
        justify-content: space-between;
        border-bottom: 2px solid #f7f7f7;
      }

      .navbar-nav-main {
        margin: 0px auto;
        padding-top: 10px;
        max-width: 1144px;
        width: 100%;
        font-size: 18px;
      }

      .custom-navlink {
        margin: 0 20px;
      }

      .navbar-nav-main a {
        color: black;
        cursor:pointer;
      }
      .navbar-nav-main a:hover,
      .login_signup a:hover, .CartLogo:hover,
      a#footer-a:hover  {
      color:#d4a035;
      }
      
      .login_signup a {
      text-decoration:none;
      }
      .logout {
      padding-left:10px;
      padding-right:15px;
      }

      .navbar-nav-main .dropdown-toggle::after {
        display: none;
        /* 화살표를 숨김 */
      }

      .custom-dropdown-menu {
        background-color: #ffffff;
        /* 배경색을 원하는 색상으로 변경 */
        border: 1px solid #ced4da;
        /* 테두리를 원하는 스타일과 색상으로 변경 */
        padding: 10px;
        /* 패딩을 추가하여 내부 여백을 조정 */
        margin-top: 5px;
        /* 드롭다운 메뉴와 다른 요소 사이의 위쪽 여백을 조정 */
        margin-bottom: 5px;
        /* 드롭다운 메뉴와 다른 요소 사이의 아래쪽 여백을 조정 */
        opacity: 0;
        /* 초기에는 투명하게 설정하여 드롭다운 메뉴를 숨깁니다. */
        visibility: hidden;
        /* 초기에는 화면에 표시되지 않도록 설정합니다. */
        transition: all 0.2s ease-in-out;
        overflow: hidden;
        display: block;
        max-height: 0;
      }

      .custom-dropdown-item {
        align-items: center;
        display: flex;
      }

      .custom-dropdown-item img {
        margin-right: 10px;
        width: 32px;
        height: 32px;
      }

      .show > .custom-dropdown-menu {
        max-height: 800px;
        visibility: visible;
      }

      .custom-dropdown-menu.show {
        opacity: 1;
        /* 드롭다운 메뉴가 표시될 때 투명도를 1로 변경하여 보이도록 설정합니다. */
        visibility: visible;
        /* 드롭다운 메뉴가 표시될 때 화면에 표시되도록 설정합니다. */
      }

      .custom-dropdown-menu a {
        color: #343a40;
        /* 드롭다운 메뉴 내 링크의 글자 색상 변경 */
        padding: 20px 20px;
        /* 링크의 패딩을 추가하여 내부 여백을 조정 */
      }

      .custom-dropdown-menu a:hover {
        background-color: #f8f9fa;
        /* 드롭다운 메뉴 내 링크에 호버 시 배경색 변경 */
      }
.CartLogo {
	position: relative;
}

#cartCount,#side-cartCount {
    position: absolute;
    top: -7px;
    right: -5px;
    background-color: red; 
    color: white; 
    border-radius: 50%;
    padding: 1px 6px;
    font-size: 12px;
    border-radius : 15px;
}

      /* 부트스트랩 btn-primary */
      .btn-primary {
	    color: #fff;
	    background-color: #005930;
	    border-color: #005930;
	  }
	  .btn-primary:hover,
	  .btn-primary:focus,
	  .btn-primary:active,
	  .btn-primary.active.focus,
	  .btn-primary.active:focus,
	  .btn-primary.active:hover,
	  .btn-primary:active.focus,
	  .btn-primary:active:focus,
	  .btn-primary:active:hover,
	  .open>.dropdown-toggle.btn-primary.focus,
	  .open>.dropdown-toggle.btn-primary:focus,
	  .open>.dropdown-toggle.btn-primary:hover,
	  .btn-primary:not(:disabled):not(.disabled):active  {
	    color: #fff;
	    background-color:  #005930;
	    border-color:  #005930;
	  }
	  .btn-primary:not(:disabled):not(.disabled):active:focus,
	  .btn-primary:focus {
	  	box-shadow: 0 0 0 .2rem #01710080;
	  }
	  
      .btn-outline-primary {
	    color: #005930;
/* 	    background-color: #005930; */
	    border-color: #005930;
	  }
	  .btn-outline-primary:hover,
	  .btn-outline-primary:focus,
	  .btn-outline-primary:active,
	  .btn-outline-primary.active.focus,
	  .btn-outline-primary.active:focus,
	  .btn-outline-primary.active:hover,
	  .btn-outline-primary:active.focus,
	  .btn-outline-primary:active:focus,
	  .btn-outline-primary:active:hover,
	  .open>.dropdown-toggle.btn-primary.focus,
	  .open>.dropdown-toggle.btn-primary:focus,
	  .open>.dropdown-toggle.btn-primary:hover,
	  .btn-outline-primary:not(:disabled):not(.disabled):active  {
	    color: #fff;
	    background-color:  #005930;
	    border-color:  #005930;
	  }
	  .btn-outline-primary:not(:disabled):not(.disabled):active:focus,
	  .btn-outline-primary:focus {
	  	box-shadow: 0 0 0 .2rem #01710080;
	  }

	  
	  
	  @media (max-width:720px) {
	  .form-inline{
	  display:none}
	  }


      @media (max-width: 575px) {
        .side-menu {
          position: fixed;
          top: 0;
          right: -300px;
          /* 초기에는 화면 밖에 위치하도록 설정 */
          width: 300px;
          /* 사이드 메뉴의 너비 */
          height: 100%;
          /* 화면의 높이 */
          background-color: white;
          /* 사이드 메뉴의 배경색 */
          transition: right 0.3s ease;
          /* 변화를 부드럽게 만들기 위한 transition 속성 추가 */
          z-index: 9999;
          /* 다른 요소 위에 표시되도록 z-index 설정 */
          overflow-y: auto;
          /* 필요한 경우 세로 스크롤을 추가 */
          display: flex;
          /* 내용을 수직으로 배치하기 위해 flex로 변경 */
          flex-direction: column;
          /* 내용을 수직으로 배치 */
          padding-top: 50px;
          /* 내용이 화면에 가려지지 않도록 padding 추가 */
          
        }
        a:hover{
        color:black;
        }
        
        .logo_search {
    display: flex;
    width: 100%;
    align-items: center;
    justify-content: center;
    }
    .login_signup {
    position:absolute;
    right:2;
    top: 42;
    
    }
    .section1 {
    position: relative;
    }
        .show-side-menu .side-menu {
          right: 0 !important;
          /* 화면에 나타나도록 위치 조정 */
        }
        .show-side-menu {
          display: block !important;
        }
        .custom-navbar-toggler {
          display: block;
        }
        .navbar-nav-main {
          display: none!important;
        }
 
        
        .LevelImgNav , .nickname{
        	display:none;
        }
   

        .side-menu .navbar-nav-side {
          list-style: none;
          /* 리스트 스타일 제거 */
          padding: 0;
          /* 내부 패딩 제거 */
        }
        .side-menu .side-nav-item {
          margin-bottom: 10px;
          /* 각 항목 사이의 간격 조절 */
        }
        .side-menu .side-nav-link {
          color: #333;
          /* 링크 색상 설정 */
          text-decoration: none;
          /* 밑줄 제거 */
          display: block;
          /* 링크를 블록 요소로 설정하여 전체 너비를 차지하도록 함 */
        }
        .side-menu .side-nav-link:hover {
          color: #000;
          /* 호버 시 색상 변경 */
        }
        .side-menu-overlay {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.5);
          /* 검은색 반투명 배경 */
          z-index: 9998;
          /* 다른 요소 위에 표시되도록 설정 */
          display: none;
          /* 초기에는 보이지 않도록 설정 */
        }
        .show-side-menu .side-menu-overlay {
          display: block;
          /* 사이드 메뉴가 열렸을 때만 보이도록 함 */
        }
        .mini-menu {
          display: flex;
          justify-content: space-around;
          padding: 0 10px;
          margin: 0 auto;
        }
        .quick-group-in {
          display: flex;
          flex-direction: column;
          align-items: center;
        }
        .side-bottom-line {
          margin: 30px 0;
          border-bottom: 1px solid #e0e0e0;
        }
        .side-card-header {
          padding: 0.75rem 1.25rem;
          margin-bottom: 0;
          background-color: white;
          border-bottom: none;
          display:flex;
          align-items:center;
        }
        .profile-header {
          padding: 0.75rem 1.25rem;
          margin-bottom: 0;
          background-color: white;
          border-bottom: none;
          display:flex;
          align-items:center;
          justify-content:space-around;
        }
        .side-card {
          background-color: #fff;
          border: none;
        }
        .side-card-body {
          padding: 1.25rem;
          padding-left: 3rem;
          font-size: 15px;
          display: flex;
          align-items: center;
        }
        .side-card-body img {
          width: 32px;
          height: 32px;
          margin-right: 10px;
        }
        .quick-group:hover {
          cursor: pointer;
        }
        .quick-group img {
          width: 32px;
          height: 32px;
          margin: 20px 0;
          flex: 1;
        }
        .quick-group {
          flex: 1;
        }
        .quick-group p , .card-link {
          color: #707070;
          font-family: "Noto Sans KR", sans-serif;
          font-optical-sizing: auto;
          font-weight: 600;
          font-style: normal;
        }
		.main-cart , .logout , .nologin , .CartLogo  {
			display:none;
		}
		img.mainrogo {
			width: 75px !important;
			height: 85px !important;
		}
	  	
      }
   
      

      @media (min-width: 575px) {
        .side-menu  {
          display: none;
        }
        
        
      }

      /* footer */
      nav.navbar.navbar-expand-sm#nav-footer {
        background-color: #ffffff;
        border-top: 1px solid #e0e0e0;
      }
      p#ptag,
      #ptag {
        font-family: "Noto Sans KR", sans-serif;
        font-optical-sizing: auto;
        font-style: normal;
      }
      #div-container {
        display: block;
        flex-direction: column;
        align-items: start !important;
        line-height: 1.2;
        margin-top: 20px;
    margin-bottom: 20px;
      }
      div.prjtnm#div-prjtnm {
        font-size: 20px;
        font-weight: 600;
        color: #3e3e3e;
        margin-bottom: 10px;
      }
      
      
      /*       img 추가(양예진) */
      .LevelImgNav{
      	width: 40px;
      	margin-top: 5px;
      }
      
        .LevelImgNav1{
      	width: 40px;
    	display: block;
    	margin-left: -6px;
      }
      
      .LevelImgNavSpan1 {
    display: flex;
    align-items: center;
}
   
    </style>
  <script>
$(document).ready(function () {
    // 사이드 메뉴 토글 버튼 클릭 이벤트 처리
    $(".navbar-toggler").click(function () {
        $(".side-menu").toggleClass("show-side-menu");
        $("body").toggleClass("show-side-menu"); // body에도 클래스를 추가하여 함께 동작하도록 함
    });

    // 각 card의 collapse 요소가 표시될 때 애니메이션 효과를 추가합니다.
    $(".side-card").on("show.bs.collapse", function () {
        $(this).find(".collapse").slideDown(400); // 400ms의 애니메이션 속도로 슬라이드 다운합니다.
    });

    // 각 card의 collapse 요소가 숨겨질 때 애니메이션 효과를 추가합니다.
    $(".side-card").on("hide.bs.collapse", function () {
        $(this).find(".collapse").slideUp(400); // 400ms의 애니메이션 속도로 슬라이드 업합니다.
    });

    // 문서 클릭 이벤트 처리
    $(document).mouseup(function (e) {
        var sideMenu = $(".side-menu");
        // 만약 사이드 메뉴가 열려있고 클릭한 부분이 사이드 메뉴 바깥이면 사이드 메뉴를 닫음
        if (
            sideMenu.hasClass("show-side-menu") &&
            !sideMenu.is(e.target) &&
            sideMenu.has(e.target).length === 0
        ) {
            sideMenu.removeClass("show-side-menu");
            $("body").removeClass("show-side-menu");
        }
    });
});

// 양예진 추가 3시

function kakaoLogout(){
      location.href="logoutProceeding.ko?logout=2";
}

let popup;	
function naverLogout(){
  	popup = window.open("https://nid.naver.com/nidlogin.logout?returl=https://www.naver.com/", "naverLogout","_blank");	
  	$.ajax({
  		url : 'logoutNaver.ko',
  		type: 'POST',
  		async : false,
  		success : function(res){
  			console.log('성공 ; ', res);
  		},
  		error : function(err){
  			console.log('에러: ',err);
  		}
  	});
  	closeFcn();
}

function closeFcn(){
	popup.close();
	location.href="main.ko";
}

window.onpageshow = function(event){
   if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
      console.log("뒤로가기");
      location.reload();
    }
}

//양예진 추가 3시 끝

</script>

  </head>

  <body>
    <nav class="navbar navbar-expand-sm sticky-top custom-navbar">
      <div class="nav-top">
        <div class="section1">
          <!-- 로고와 검색창이 있는곳-->
          <div class="logo_search">
            <div class="navbar_logo" onclick="location.href='main.ko';">
              <img
                src="${pageContext.request.contextPath}/img/imgProdlist/비채나 로고 검은색 배경투명 resize.png"
                style="width: 94px; margin: 15px 0" class="mainrogo"
              />
            </div>
			<form class="form-inline" action="prodList.ko" method="GET">
			    <div class="search-container">
			        <svg
			            clip-rule="evenodd"
			            fill-rule="evenodd"
			            stroke-linejoin="round"
			            stroke-miterlimit="2"
			            viewBox="0 0 24 24"
			            xmlns="http://www.w3.org/2000/svg"
			        >
			            <path
			                d="m15.97 17.031c-1.479 1.238-3.384 1.985-5.461 1.985-4.697 0-8.509-3.812-8.509-8.508s3.812-8.508 8.509-8.508c4.695 0 8.508 3.812 8.508 8.508 0 2.078-.747 3.984-1.985 5.461l4.749 4.75c.146.146.219.338.219.531 0 .587-.537.75-.75.75-.192 0-.384-.073-.531-.22zm-5.461-13.53c-3.868 0-7.007 3.14-7.007 7.007s3.139 7.007 7.007 7.007c3.866 0 7.007-3.14 7.007-7.007s-3.141-7.007-7.007-7.007z"
			                fill-rule="nonzero"
			            />
			        </svg>
			        <input
			            type="search"
			            name="searchKeyword"
			            aria-label="Search"
			            placeholder="무엇을 찾고 계신가요?"
			        />
			    </div>
			</form>
          </div>
          <div class="login_signup">
            <c:choose>
              <c:when test="${userID eq null }">
              	<div class="nologin">
                	<a class="login" href="loginPage.ko">로그인 / 회원가입 > </a>
                </div>
              </c:when>
              <c:otherwise>
              
              <!--              img 추가(양예진) -->
              <div class="rank">
				<c:choose>
						<c:when test="${uLev eq '실버'}">
							<img class="LevelImgNav" src="img/login/S_Level.png" alt="실버 레벨 아이콘"/>
						</c:when>
						<c:when test="${uLev eq '골드'}">
							<img class="LevelImgNav" src="img/login/G_Level.png" alt="골드 레벨 아이콘"/>
						</c:when>
						<c:when test="${uLev eq '다이아'}">
							<img class="LevelImgNav" src="img/login/D_Level.png" alt="다이아 레벨 아이콘"/>
						</c:when>
				</c:choose>
				</div>
				
				<c:choose>
					<c:when test="${howLogin eq 3}">
						<div class="nickname">
							<a class="login" href="myPage.ko">${userID }님 </a>&nbsp;환영합니다.&nbsp;
						</div>
						 <div class="logout">	
							<a id="howLogin" href="logout.ko">로그아웃</a>
						</div>
					</c:when>
					<c:when test="${howLogin eq 2}">
						<div class="nickname">
							<a class="login" href="myPage.ko">${uNick }님 </a>&nbsp;환영합니다.&nbsp;
						</div>
						 <div class="logout">	
							<a id="howLogin" href="javascript:kakaoLogout()">로그아웃</a>
						</div>
					</c:when>
					<c:when test="${howLogin eq 1}">
						<div class="nickname">
							<a class="login" href="myPage.ko">${uNick }님 </a>&nbsp;환영합니다.&nbsp;
						</div>
						 <div class="logout">	
							<a id="howLogin" href="javascript:naverLogout()">로그아웃</a>
						</div>
					</c:when>
				</c:choose>
				<div class="main-cart">
	                <span class="CartLogo" onclick="CartList()" style="cursor : pointer">
		                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="30" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
			              <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
			            </svg>
			            <span id="cartCount"></span>
			            <c:if test="${userID ne null}">
			            <script>
			            (function (){
			            	selectCount();
			            })();
			            
			            function selectCount(){
			            	var u_id = '${userID}';
			            	$.ajax({
			            		url : "cartSelectCount.ko",
			            		type : "post",
			            		contentType: "application/json",
			            		data : JSON.stringify({u_id : u_id }),
			            		success : function(data){
			            			$("#cartCount").html(data);
			            			console.log(data);
			            		},
			            		error : function(error) {
			            			alert("에러발생");
			            		}
			            	});
			            }
			            function CartList() {
			            	location.href="myCartList.ko";
			            }
			            </script>
			            </c:if>
	                </span>
                </div>
              </c:otherwise>
            </c:choose>
            
            <button
              class="navbar-toggler custom-navbar-toggler"
              type="button"
              aria-label="Toggle side menu"
            >
              <i class="fas fa-bars"></i>
            </button>
          </div>
        </div>
      </div>

      <div class="bottom-line"></div>

      <div>
        <!-- Links -->
        <div>
          <ul class="navbar-nav navbar-nav-main">
            <li class="nav-item side-nav-item">
              <a class="nav-link custom-navlink" href="main.ko">홈</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle custom-navlink "
                id="navbardrop"
                data-toggle="dropdown"
                >상품</a
              >
              <div class="dropdown-menu custom-dropdown-menu">
                <a class="dropdown-item custom-dropdown-item" href="prodList.ko"
                  ><img
                    src="${pageContext.request.contextPath}/img/navbar/all_product.png"
                  />전체상품</a
                >
                <a class="dropdown-item custom-dropdown-item" href="prodList.ko?type=탁주"
                  ><img
                    src="${pageContext.request.contextPath}/img/navbar/icon_takju.png"
                  />탁주</a
                >
                <a class="dropdown-item custom-dropdown-item" href="prodList.ko?type=과실주"
                  ><img
                    src="${pageContext.request.contextPath}/img/navbar/icon_gwashilju.png"
                  />과실주</a
                >
                <a class="dropdown-item custom-dropdown-item" href="prodList.ko?type=약·청주"
                  ><img
                    src="${pageContext.request.contextPath}/img/navbar/icon_cheongju.png"
                  />약·청주</a
                >
                <a class="dropdown-item custom-dropdown-item" href="prodList.ko?type=증류주"
                  ><img
                    src="${pageContext.request.contextPath}/img/navbar/icon_jeungryuju.png"
                  />증류주</a
                >
                <a class="dropdown-item custom-dropdown-item" href="prodList.ko?type=기타주류"
                  ><img
                    src="${pageContext.request.contextPath}/img/navbar/icon_merchandise_listing.png"
                  />기타</a
                >
              </div>
            </li>
            <li class="nav-item dropdown custom-dropdown-item">
              <a
                class="nav-link dropdown-toggle custom-navlink"
                id="navbardrop"
                data-toggle="dropdown"
                >고객센터</a
              >
              <div class="dropdown-menu custom-dropdown-menu">
                <a
                  class="dropdown-item custom-dropdown-item"
                  href="getNoticeList.ko"
                  >공지사항</a
                >
                <a class="dropdown-item custom-dropdown-item" href="qnaList.ko"
                  >Q&A</a
                >
                <a
                  class="dropdown-item custom-dropdown-item"
                  href="getFaqList.ko"
                  >FAQ</a
                >
              </div>
            </li>
             <li class="nav-item dropdown custom-dropdown-item">
              <a
                class="nav-link dropdown-toggle custom-navlink"
                id="navbardrop"
                data-toggle="dropdown"
                >About Us</a
              >
              <div class="dropdown-menu custom-dropdown-menu">
                <a class="dropdown-item custom-dropdown-item" href="introduce.jsp">회사 소개</a>
                <a class="dropdown-item custom-dropdown-item" href="map.jsp">오시는 길</a>
              </div>

            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="side-menu" id="sideMenu">
      <c:choose>
        <c:when test="${userID eq null }">
          <div class="profile">
            <div class="card side-card">
              <div class="card-header side-card-header">
                <a class="collapsed card-link" href="loginPage.ko"
                  >로그인 / 회원가입 ></a
                >
              </div>
            </div>
            <div class="side-bottom-line"></div>
          </div>
        </c:when>
        <c:otherwise>
          <div class="profile">
            <div class="card side-card">
              <div class="card-header profile-header">
               <!--              img 추가(양예진) -->
               <div>
					<c:choose>
						<c:when test="${uLev eq '실버'}">
							<div class="LevelImgNavSpan1"><img class="LevelImgNav1" src="img/login/S_Level.png" alt="실버 레벨 아이콘"/>
								<c:choose>
									<c:when test="${howLogin eq 3}">
										<a class="collapsed card-link" href="myPage.ko">${userID }님</a>
									</c:when>
									<c:when test="${howLogin eq 2}">
										<a class="collapsed card-link" href="myPage.ko">${uNick }님</a>
									</c:when>
									<c:when test="${howLogin eq 1}">
										<a class="collapsed card-link" href="myPage.ko">${uNick }님</a>
									</c:when>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${uLev eq '골드'}">
							<div class="LevelImgNavSpan1"><img class="LevelImgNav1" src="img/login/G_Level.png" alt="골드 레벨 아이콘"/>
								<c:choose>
									<c:when test="${howLogin eq 3}">
										<a class="collapsed card-link" href="myPage.ko">${userID }님</a>
									</c:when>
									<c:when test="${howLogin eq 2}">
										<a class="collapsed card-link" href="myPage.ko">${uNick }님</a>
									</c:when>
									<c:when test="${howLogin eq 1}">
										<a class="collapsed card-link" href="myPage.ko">${uNick }님</a>
									</c:when>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${uLev eq '다이아'}">
							<div class="LevelImgNavSpan1"><img class="LevelImgNav1" src="img/login/D_Level.png" alt="다이아 레벨 아이콘"/>
								<c:choose>
									<c:when test="${howLogin eq 3}">
										<a class="collapsed card-link" href="myPage.ko">${userID }님</a>
									</c:when>
									<c:when test="${howLogin eq 2}">
										<a class="collapsed card-link" href="myPage.ko">${uNick }님</a>
									</c:when>
									<c:when test="${howLogin eq 1}">
										<a class="collapsed card-link" href="myPage.ko">${uNick }님</a>
									</c:when>
								</c:choose>
							</div>
						</c:when>
					</c:choose>
					
              	</div> 
              	<div class="side-cart">
              	 <span class="CartLogo" onclick="CartList()" style="cursor : pointer">
	                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="30" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
		              <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
		            </svg>
		            <span id="side-cartCount"></span>
		            <c:if test="${userID ne null}">
		            <script>
		            (function (){
		            	selectCount();
		            })();
		            
		            function selectCount(){
		            	var u_id = '${userID}';
		            	$.ajax({
		            		url : "cartSelectCount.ko",
		            		type : "post",
		            		contentType: "application/json",
		            		data : JSON.stringify({u_id : u_id }),
		            		success : function(data){
		            			$("#side-cartCount").html(data);
		            			console.log(data);
		            		},
		            		error : function(error) {
		            			alert("에러발생");
		            		}
		            	});
		            }
		            function CartList() {
		            	location.href="myCartList.ko";
		            }
		            </script>
		            </c:if>
                </span>
              	</div>
              </div>
            </div>
            <div class="mini-menu">
              <div class="quick-group">
            <!--               양예진 수정 3시 -->
                  <c:choose>
					<c:when test="${howLogin eq 3}">
						 <div class="quick-group-in"
			                  onclick="location.href='logout.ko';"
			                >
				              <img
				                   src="${pageContext.request.contextPath}/img/navbar/logout.png"
				                   width="100"
				                   height="100"
				              />
			              	  <p id="howLogin">로그아웃</p>
			              </div>
					</c:when>
					<c:when test="${howLogin eq 2}">
						 <div class="quick-group-in"
			                  onclick="javascript:kakaoLogout();"
			                >
				              <img
				                   src="${pageContext.request.contextPath}/img/navbar/logout.png"
				                   width="100"
				                   height="100"
				              />
				              <p id="howLogin">로그아웃</p>
			              </div>
					</c:when>
					<c:when test="${howLogin eq 1}">
						 <div class="quick-group-in"
			                  onclick="javascript:naverLogout();"
			                >
				              <img
				                   src="${pageContext.request.contextPath}/img/navbar/logout.png"
				                   width="100"
				                   height="100"
				              />
				              <p id="howLogin">로그아웃</p>
			              </div>
					</c:when>
				  </c:choose>
<!--               양예진 수정 끝-->
              </div>
              <div class="quick-group">
                <div
                  class="quick-group-in"
                  onclick="location.href='myPage.ko';"
                >
                  <img
                    src="${pageContext.request.contextPath}/img/navbar/checklist.png"
                    width="100"
                    height="100"
                  />
                  <p>주문내역</p>
                </div>
              </div>

              <div class="quick-group">
                <div
                  class="quick-group-in"
                  onclick="location.href='myRevList.ko';"
                >
                  <img
                    src="${pageContext.request.contextPath}/img/navbar/rating.png"
                    width="100"
                    height="100"
                  />
                  <p>리 뷰</p>
                </div>
              </div>
            </div>
            <div class="side-bottom-line"></div>
          </div>
        </c:otherwise>
      </c:choose>
      <ul class="navbar-nav navbar-nav-side">
        <div id="accordion">
          <!-- 0511 -->
          <div class="card side-card">
            <div class="card-header side-card-header">
              <a class="collapsed card-link" href="main.ko"> 홈 </a>
            </div>
          </div>
          
          <div class="card side-card">
            <div class="card-header side-card-header">
              <a
                class="card-link collapsed"
                data-toggle="collapse"
                href="#collapseOne"
              >
                상품
              </a>
            </div>
       
       
       
            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='prodList.ko';"
            >
              <div class="card-body side-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/all_product.png"
                />
                전체상품
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='prodList.ko?type=탁주';"
            >
              <div class="card-body side-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_takju.png"
                />
                탁주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='prodList.ko?type=과실주';">
              <div class="card-body side-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_gwashilju.png"
                />
                과실주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='prodList.ko?type=약·청주';"
            >
              <div class="card-body side-card-body">
                <img src="${pageContext.request.contextPath}/img/navbar/icon_cheongju.png"/>
                약·청주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='prodList.ko?type=증류주';"
            >
              <div class="card-body side-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_jeungryuju.png"
                />
                증류주
              </div>
            </div>

            <div
              id="collapseOne"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='prodList.ko?type=기타주류';"
            >
              <div class="card-body side-card-body">
                <img
                  src="${pageContext.request.contextPath}/img/navbar/icon_merchandise_listing.png"
                />
                기타
              </div>
            </div>
          </div>

          <div class="card side-card">
            <div class="card-header side-card-header">
              <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
                고객 센터
              </a>
            </div>
            
            <div
              id="collapseTwo"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='getNoticeList.ko';"
            >
              <div class="card-body side-card-body">공지사항</div>
            </div>
            
            <div
              id="collapseTwo"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='qnaList.ko';"
            >
              <div class="card-body side-card-body">Q&A</div>
            </div>
            
            <div
              id="collapseTwo"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='getFaqList.ko';"
            >
              <div class="card-body side-card-body">FAQ</div>
            </div>
            
          </div>
          
          <div class="card side-card">
            <div class="card-header side-card-header">
              <a
                class="collapsed card-link"
                data-toggle="collapse"
                href="#collapseThree"
              >
                About Us
              </a>
            </div>
            <div
              id="collapseThree"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='introduce.jsp';">
              <div class="card-body side-card-body">회사 소개</div>
            </div>
            <div
              id="collapseThree"
              class="collapse"
              data-parent="#accordion"
              onclick="location.href='map.jsp';"
            >
              <div class="card-body side-card-body">오시는 길</div>
        	 </div>
          </div>
          
          
      	</div>
      </ul>
    </div>

    <!-- 기타 메뉴 항목 추가 -->

    <div class="side-menu-overlay"></div>
    
  </body>
</html>
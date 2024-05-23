<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userID") == null) {%>
<script>
location.href="main.ko";
</script>
<%} else if (session.getAttribute("userID") != null && !(session.getAttribute("userID").equals("admin"))) {%>
<script>
location.href="main.ko";
</script>
<%
}
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
      body {
        background-color: white;
      }

      li {
        list-style: none;
      }

      input:focus {
        outline: none;
      }
      a {
        color: black;
      }
      a:hover {
        color: black;
      }

      button#side-btn {
        background-color: white;
        border: none;
        display: none;
      }
      .nav-top {
        margin: 0px auto;
        width: 100%;
      }
      .navbar-title {
        margin-left: 30px;
      }
      .navbar-nav,
      .navbar-title {
        font-family: "Noto Sans KR", sans-serif;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
      }
      .navbar {
        max-width: 1140px;
        height: 50px;
        display: flex;
        justify-content: space-between;
        margin: 10px auto;
      }
      .bottom-line {
        display: block;
        width: 100%;
        border-bottom: 1px solid #e0e0e0;
      }
      .navbar-nav,
      .navbar-title {
        padding-top: 10px;
        font-size: 18px;
        align-items: center;
      }
      .nav-link {
        margin: 0 10px;
      }

      .navbar-nav a,
      .navbar-title {
        color: black;
      }
      .navbar-nav a:hover, p.main-p:hover, a.to-main:hover {
      	color:#d4a035;
      }
      .navbar-nav .dropdown-toggle::after {
        display: none; /* 화살표를 숨김 */
      }
      .to-main {
        color: #707070;
        margin-left: 50px;
        margin-right: 20px;
      }
      .profile {
        display: flex;
        justify-content: center;
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
	  .open>.dropdown-toggle.btn-primary:hover  {
	    color: #fff;
	    background-color:  #2d4739;
	    border-color:  #2d4739;
	  }

      @media (min-width: 768px) {
        .navbar-nav {
          float: none;
        }
      }

      @media (max-width: 980px) {
        button#side-btn {
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .side-menu {
          position: fixed;
          top: 0;
          right: -300px; /* 초기에는 화면 밖에 위치하도록 설정 */
          width: 300px; /* 사이드 메뉴의 너비 */
          height: 100%; /* 화면의 높이 */
          background-color: white; /* 사이드 메뉴의 배경색 */
          transition: right 0.3s ease; /* 변화를 부드럽게 만들기 위한 transition 속성 추가 */
          z-index: 9999; /* 다른 요소 위에 표시되도록 z-index 설정 */
          overflow-y: auto; /* 필요한 경우 세로 스크롤을 추가 */
          display: flex; /* 내용을 수직으로 배치하기 위해 flex로 변경 */
          flex-direction: column; /* 내용을 수직으로 배치 */
          padding-top: 50px; /* 내용이 화면에 가려지지 않도록 padding 추가 */
        }
        .show-side-menu .side-menu {
          right: 0 !important; /* 화면에 나타나도록 위치 조정 */
        }
        .show-side-menu {
          display: block !important;
        }

        .navbar-nav-main {
          display: none;
        }
        a.login {
          display: none;
        }
        .side-menu .navbar-nav {
          flex-direction: column;
          list-style: none;
          display: flex;
          align-items: center;
        }
        .navbar-nav-side .nav-item {
          margin: 15px 0;
        }

        .side-menu .nav-item {
          margin-bottom: 10px; /* 각 항목 사이의 간격 조절 */
        }

        .side-menu .nav-link {
          color: #333; /* 링크 색상 설정 */
          text-decoration: none; /* 밑줄 제거 */
          display: block; /* 링크를 블록 요소로 설정하여 전체 너비를 차지하도록 함 */
        }

        .side-menu .nav-link:hover {
          color: #000; /* 호버 시 색상 변경 */
        }
        .side-menu-overlay {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.5); /* 검은색 반투명 배경 */
          z-index: 9998; /* 다른 요소 위에 표시되도록 설정 */
          display: none; /* 초기에는 보이지 않도록 설정 */
        }

        .navbar-nav {
          margin: 0;
          padding: 0;
        }
        .show-side-menu .side-menu-overlay {
          display: block; /* 사이드 메뉴가 열렸을 때만 보이도록 함 */
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
          margin-top: 30px;
          border-bottom: 1px solid #e0e0e0;
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
        .quick-group p {
          color: #707070;
          font-family: "Noto Sans KR", sans-serif;
          font-optical-sizing: auto;
          font-weight: 600;
          font-style: normal;
        }
      }

      @media (min-width: 575px) {
        .side-menu {
          display: none;
        }
      }
      div#main-title:hover {
      	cursor: pointer;
      }
    </style>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
		var navbarToggler = document.querySelector(".navbar-toggler");
		var sideMenu = document.querySelector(".side-menu");
		
		navbarToggler.addEventListener("click", function() {
		    sideMenu.classList.toggle("show-side-menu");
		    document.body.classList.toggle("show-side-menu");
		});
		
	document.addEventListener("mouseup", function(e) {
	    // 사이드 메뉴가 열려있고 클릭한 부분이 사이드 메뉴 바깥이면 사이드 메뉴를 닫음
	    if (sideMenu.classList.contains("show-side-menu") && !sideMenu.contains(e.target)) {
			    sideMenu.classList.remove("show-side-menu");
			    document.body.classList.remove("show-side-menu");
		    }
		});
	});
    
    window.onpageshow = function(event){
    	if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
    		console.log("뒤로가기");
    		location.reload();
    	}
    }
	
    function adminLogout() {
    	let res = confirm("관리자 모드를 종료합니다.");
    	if (res) {
    		location.href="logout.ko";
    	}
    }
    </script>
  </head>
  <body>
    <nav class="navbar navbar-expand-sm sticky-top">
      <div class="navbar-title" id="main-title">
        <p onclick="location.href='adminOrderList.ko';" class="main-p">관리자 페이지</p>
      </div>
      <div>
 		<ul class="navbar-nav navbar-nav-main">
      	  <li class="nav-item">
            <a class="nav-link" href="adminChart.ko">판매현황</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminOrderList.ko">주문목록</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminProdList.ko">상품관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getUserList.ko">회원관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getNoticeList.ko">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminRevList.ko">상품후기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="getFaqList.ko">FAQ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminQnaList.ko">QNA</a>
          </li>
          <li>
            <a class="to-main" onclick="adminLogout();">
              <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" >
                <path d="M11 21h8v-2l1-1v4h-9v2l-10-3v-18l10-3v2h9v5l-1-1v-3h-8v18zm10.053-9l-3.293-3.293.707-.707 4.5 4.5-4.5 4.5-.707-.707 3.293-3.293h-9.053v-1h9.053z" />
              </svg>
<!--               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="28" fill="currentColor" class="bi bi-door-closed-fill" viewBox="0 0 16 16"> -->
<!-- 			    <path d="M12 1a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2a1 1 0 0 1 1-1zm-2 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/> -->
<!-- 			  </svg> -->
            </a>
          </li>
        </ul>
      </div>
      <button class="navbar-toggler" type="button" id="side-btn">
        <svg xmlns="http://www.w3.org/2000/svg" width="24"  height="24" viewBox="0 0 24 24" >
          <path d="M24 6h-24v-4h24v4zm0 4h-24v4h24v-4zm0 8h-24v4h24v-4z" />
        </svg>
      </button>
    </nav>
    <div class="bottom-line"></div>

    <div class="side-menu" id="sideMenu">
      <div class="profile">
        <a href="logout.ko">
          <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" >
            <path d="M11 21h8v-2l1-1v4h-9v2l-10-3v-18l10-3v2h9v5l-1-1v-3h-8v18zm10.053-9l-3.293-3.293.707-.707 4.5 4.5-4.5 4.5-.707-.707 3.293-3.293h-9.053v-1h9.053z" />
          </svg>
        </a>
      </div>
      <div class="side-bottom-line"></div>
      <div class="navbar-nav navbar-nav-side">
          <div class="nav-item">
          <a class="nav-link" href="adminChart.ko">판매현황</a>
        </div>
        <div class="nav-item">
          <a class="nav-link" href="adminOrderList.ko">주문목록</a>
        </div>
        <div class="bottom-line"></div>
        <div class="nav-item">
          <a class="nav-link" href="adminProdList.ko">상품관리</a>
        </div>
        <div class="bottom-line"></div>
        <div class="nav-item">
          <a class="nav-link" href="getUserList.ko">회원관리</a>
        </div>
        <div class="bottom-line"></div>
        <div class="nav-item">
          <a class="nav-link" href="getNoticeList.ko">공지사항</a>
        </div>
        <div class="bottom-line"></div>
        <div class="nav-item">
          <a class="nav-link" href="adminRevList.ko">상품후기</a>
        </div>
        <div class="bottom-line"></div>
        <div class="nav-item">
          <a class="nav-link" href="getFaqList.ko">FAQ</a>
        </div>
        <div class="bottom-line"></div>
        <div class="nav-item">
          <a class="nav-link" href="adminQnaList.ko">QNA</a>
        </div>
        <div class="bottom-line"></div>
      </div>
    </div>
    <div class="side-menu-overlay"></div>
  </body>
</html>
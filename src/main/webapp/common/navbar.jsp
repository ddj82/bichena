<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>bichena</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css">
<style>
body {
	background-color: white;
}

.logo_search {
	display: flex;
	align-items: center;
	justify-content: start;
}

.search-container {
	display: flex;
	background-color: #F7F7F7;
	margin-left: 20px;
	align-items: center;
	padding: 0 5px;
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
	background-color: #F7F7F7;
	flex: 1;
	/* 입력 필드가 가능한 한 많은 공간을 차지하도록 설정 */
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

.login_signup, .navbar-nav {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: 600;
	font-style: normal;
}

.login:hover {
	text-decoration: none;
	color: black;
}

.navbar {
	display: block;
/* 	max-height: 8vh; */
}

.bottom-line {
	display: block;
	width: 100%;
	border-bottom: 1px solid #E0E0E0;
}

.section1 {
	display: flex;
	margin: 0px auto;
	max-width: 1144px;
	width: 100%;
	justify-content: space-between;
	border-bottom: 2px solid #F7F7F7;
}

.navbar-nav {
	margin: 0px auto;
	padding-top: 10px;
	max-width: 1144px;
	width: 100%;
	font-size: 18px;
}

.nav-link {
	margin: 0 20px;
}

.navbar-nav a {
	color: #707070;
}

.navbar-nav .dropdown-toggle::after {
	display: none;
	/* 화살표를 숨김 */
}

.dropdown-menu {
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

.dropdown-item {
	align-items: center;
	display: flex;
}

.dropdown-item img {
	margin-right: 10px;
	width: 32px;
	height: 32px;
}

.show>.dropdown-menu {
	max-height: 800px;
	visibility: visible;
}

.dropdown-menu.show {
	opacity: 1;
	/* 드롭다운 메뉴가 표시될 때 투명도를 1로 변경하여 보이도록 설정합니다. */
	visibility: visible;
	/* 드롭다운 메뉴가 표시될 때 화면에 표시되도록 설정합니다. */
}

.dropdown-menu a {
	color: #343a40;
	/* 드롭다운 메뉴 내 링크의 글자 색상 변경 */
	padding: 20px 20px;
	/* 링크의 패딩을 추가하여 내부 여백을 조정 */
}

.dropdown-menu a:hover {
	background-color: #f8f9fa;
	/* 드롭다운 메뉴 내 링크에 호버 시 배경색 변경 */
}

@media ( max-width : 575px) {
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
	.show-side-menu .side-menu {
		right: 0 !important;
		/* 화면에 나타나도록 위치 조정 */
	}
	.show-side-menu {
		display: block !important;
	}
	.navbar-toggler {
		display: block;
	}
	.navbar-nav-main {
		display: none;
	}
	a.login {
		display: none;
	}
	.side-menu .navbar-nav {
		list-style: none;
		/* 리스트 스타일 제거 */
		padding: 0;
		/* 내부 패딩 제거 */
	}
	.side-menu .nav-item {
		margin-bottom: 10px;
		/* 각 항목 사이의 간격 조절 */
	}
	.side-menu .nav-link {
		color: #333;
		/* 링크 색상 설정 */
		text-decoration: none;
		/* 밑줄 제거 */
		display: block;
		/* 링크를 블록 요소로 설정하여 전체 너비를 차지하도록 함 */
	}
	.side-menu .nav-link:hover {
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
		border-bottom: 1px solid #E0E0E0;
	}
	.card-header {
		padding: .75rem 1.25rem;
		margin-bottom: 0;
		background-color: white;
		border-bottom: none;
	}
	.card {
		background-color: #fff;
		border: none;
	}
	.card-body {
		padding: 1.25rem;
		padding-left: 3rem;
		font-size: 15px;
		display: flex;
		align-items: center;
	}
	.card-body img {
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
	.quick-group p {
		color: #707070;
		font-family: "Noto Sans KR", sans-serif;
		font-optical-sizing: auto;
		font-weight: 600;
		font-style: normal;
	}
}

@media ( min-width : 575px) {
	.side-menu {
		display: none;
	}
}

/* footer */
nav.navbar.navbar-expand-sm#nav-footer {
/* nav.navbar#nav-footer { */
	height: 30vh;
	background-color: #FFFFFF;
	border-top: 1px solid #E0E0E0;
}
p#ptag {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
}
div.container#div-container {
	display: block;
	flex-direction: column;
	align-items: start!important;
	line-height: 1.2;
}
div.prjtnm#div-prjtnm {
	font-size: 20px;
	font-weight: 600;
	color: #3E3E3E;
	margin-bottom: 10px;
}
</style>
<script>
$(document).ready(function() {
	$(".navbar-toggler").click(function() {
		$(".side-menu").toggleClass("show-side-menu");
		$("body").toggleClass("show-side-menu"); // body에도 클래스를 추가하여 함께 동작하도록 함
	});
});

$(document).mouseup(
	function(e) {
		var sideMenu = $(".side-menu");
		// 만약 사이드 메뉴가 열려있고 클릭한 부분이 사이드 메뉴 바깥이면 사이드 메뉴를 닫음
		if (sideMenu.hasClass("show-side-menu")
				&& !sideMenu.is(e.target)
				&& sideMenu.has(e.target).length === 0) {
			sideMenu.removeClass("show-side-menu");
			$("body").removeClass("show-side-menu");
		}
	});

$(document).ready(function() {
	// 각 card의 collapse 요소가 표시될 때 애니메이션 효과를 추가합니다.
	$('.card').on('show.bs.collapse', function() {
		$(this).find('.collapse').slideDown(400); // 400ms의 애니메이션 속도로 슬라이드 다운합니다.
	});

	// 각 card의 collapse 요소가 숨겨질 때 애니메이션 효과를 추가합니다.
	$('.card').on('hide.bs.collapse', function() {
		$(this).find('.collapse').slideUp(400); // 400ms의 애니메이션 속도로 슬라이드 업합니다.
	});
});
</script>
</head>

<body>
	<nav class="navbar navbar-expand-sm sticky-top">
		<div class="nav-top">
			<div class="section1">
				<!-- 로고와 검색창이 있는곳-->
				<div class="logo_search">
					<div class="navbar_logo" onclick="location.href='main.ko';">
						<img src="${pageContext.request.contextPath}/img/navbar/bichena.png" style="width: 100px; margin: 15px 0;" />
					</div>
					<form class="form-inline">
						<div class="search-container">
							<svg clip-rule="evenodd" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
				                <path d="m15.97 17.031c-1.479 1.238-3.384 1.985-5.461 1.985-4.697 0-8.509-3.812-8.509-8.508s3.812-8.508 8.509-8.508c4.695 0 8.508 3.812 8.508 8.508 0 2.078-.747 3.984-1.985 5.461l4.749 4.75c.146.146.219.338.219.531 0 .587-.537.75-.75.75-.192 0-.384-.073-.531-.22zm-5.461-13.53c-3.868 0-7.007 3.14-7.007 7.007s3.139 7.007 7.007 7.007c3.866 0 7.007-3.14 7.007-7.007s-3.141-7.007-7.007-7.007z" fill-rule="nonzero" />
							</svg>
							<input type="search" aria-label="Search" placeholder="무엇을 찾고 계신가요?">
						</div>
					</form>
				</div>
				<div class="login_signup">
					<a class="login" href="loginPage.ko">로그인 / 회원가입 > </a>
					<button class="navbar-toggler" type="button" aria-label="Toggle side menu">
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
					<li class="nav-item"><a class="nav-link" href="main.ko">홈</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">상품</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="prodList.ko"><img src="${pageContext.request.contextPath}/img/navbar/all_product.png">전체상품</a>
							<a class="dropdown-item" href="#"><img src="${pageContext.request.contextPath}/img/navbar/icon_takju.png">탁주</a> 
							<a class="dropdown-item" href="#"><img src="${pageContext.request.contextPath}/img/navbar/icon_gwashilju.png">과실주</a> 
							<a class="dropdown-item" href="#"><img src="${pageContext.request.contextPath}/img/navbar/icon_cheongju.png">약·청주</a> 
							<a class="dropdown-item" href="#"><img src="${pageContext.request.contextPath}/img/navbar/icon_jeungryuju.png">증류주</a> 
							<a class="dropdown-item" href="#"><img src="${pageContext.request.contextPath}/img/navbar/icon_merchandise_listing.png">기타</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">고객센터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="getNoticeList.ko">공지사항</a>
							<a class="dropdown-item" href="qnaList.ko">Q&A</a>
							<a class="dropdown-item" href="getFaqList.ko">FAQ</a>
							<a class="dropdown-item" href="#">오시는길</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">About Us</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="side-menu" id="sideMenu">
		<div class="profile">
			<a href="">사용자님 ></a>
			<div class="mini-menu">

				<div class="quick-group">
					<div class="quick-group-in" onclick="location.href='logout.ko';">
						<img src="${pageContext.request.contextPath}/img/navbar/logout.png" width="100" height="100" />
						<p>로그아웃</p>
					</div>
				</div>

				<div class="quick-group">
					<div class="quick-group-in" onclick="">
						<img src="${pageContext.request.contextPath}/img/navbar/checklist.png" width="100" height="100" />
						<p>주문내역</p>
					</div>
				</div>

				<div class="quick-group">
					<div class="quick-group-in" onclick="">
						<img src="${pageContext.request.contextPath}/img/navbar/rating.png" width="100" height="100" />
						<p>리 뷰</p>
					</div>
				</div>
			</div>
			<div class="side-bottom-line"></div>
		</div>
		<ul class="navbar-nav navbar-nav-side">
			<div id="accordion">
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link" data-toggle="collapse" href="main.ko"> 홈 </a>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="card-link collapsed" data-toggle="collapse" href="#collapseOne"> 상품 </a>
					</div>

					<div id="collapseOne" class="collapse" data-parent="#accordion" onclick="location.href='prodList.ko';">
						<div class="card-body">
							<img src="${pageContext.request.contextPath}/img/navbar/all_product.png" /> 전체상품
						</div>
					</div>

					<div id="collapseOne" class="collapse" data-parent="#accordion" onclick="">
						<div class="card-body">
							<img src="${pageContext.request.contextPath}/img/navbar/icon_takju.png" /> 탁주
						</div>
					</div>

					<div id="collapseOne" class="collapse" data-parent="#accordion" onclick="">
						<div class="card-body">
							<img src="${pageContext.request.contextPath}/img/navbar/icon_gwashilju.png" /> 과실주
						</div>
					</div>

					<div id="collapseOne" class="collapse" data-parent="#accordion" onclick="">
						<div class="card-body">
							<img src="${pageContext.request.contextPath}/img/navbar/icon_cheongju.png" /> 약·청주
						</div>
					</div>

					<div id="collapseOne" class="collapse" data-parent="#accordion" onclick="">
						<div class="card-body">
							<img src="${pageContext.request.contextPath}/img/navbar/icon_jeungryuju.png" /> 증류주
						</div>
					</div>

					<div id="collapseOne" class="collapse" data-parent="#accordion" onclick="">
						<div class="card-body">
							<img src="${pageContext.request.contextPath}/img/navbar/icon_merchandise_listing.png" /> 기타
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo"> 고객 센터 </a>
					</div>
					<div id="collapseTwo" class="collapse" data-parent="#accordion" onclick="location.href='getNoticeList.ko';">
						<div class="card-body">공지사항</div>
					</div>
					<div id="collapseTwo" class="collapse" data-parent="#accordion" onclick="location.href='qnaList.ko';">
						<div class="card-body">Q&A</div>
					</div>
					<div id="collapseTwo" class="collapse" data-parent="#accordion" onclick="location.href='getFaqList.ko';">
						<div class="card-body">FAQ</div>
					</div>
				</div>
			</div>
		</ul>


		<div class="card">
			<div class="card-header">
				<a class="collapsed card-link" data-toggle="collapse" href=""> About Us </a>
			</div>
		</div>
	</div>
			
	<!-- 기타 메뉴 항목 추가 -->
	
	<div class="side-menu-overlay"></div>
</body>
</html>
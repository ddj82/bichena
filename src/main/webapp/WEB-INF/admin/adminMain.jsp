<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="${pageContext.request.contextPath}/resources/css/adminpage.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<script>
window.onload = function() {
    document.getElementById('contentFrame').src='adminOrderList.ko';
    // contentFrame이라는 ID를 가진 iframe의 내부 document에 접근
    var iframeDocument = document.getElementById('contentFrame').contentDocument;
};
</script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="admin.ko">관리자 페이지</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item">
			<a class="nav-link" id="navbar" href="main.ko" target="" role="button" aria-expanded="false">
				<i class="fa fa-sign-out"></i>
			</a>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="adminOrderList.ko" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 주문목록
						</a> 
						<a class="nav-link collapsed" href="adminProdList.ko" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 상품관리
						</a> 
						<a class="nav-link collapsed" href="prodInsertEditer.ko" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 상품추가
						</a> 
						<a class="nav-link collapsed" href="getUserList.ko" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 회원관리
						</a> 
						<a class="nav-link" href="getNoticeList.ko" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 공지사항
						</a> 
						<a class="nav-link" href="" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 상품후기 게시판
						</a>
						<a class="nav-link" href="getFaqList.ko" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> FAQ 게시판
						</a> 
						<a class="nav-link" href="adminQnaList.ko" target="contentFrame">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> QNA 게시판
						</a>
						
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content" style="width: 100%">
			<div class="content" style="width: 100%; height: 100%">
				<div class="iframe-container" style="width: 100%; height: 100%">
					<iframe id="contentFrame" name="contentFrame" frameborder="0" style="width: 100%; height: 100%"></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
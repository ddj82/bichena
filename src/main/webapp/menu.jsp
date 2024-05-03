<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="menuBox1">
	<c:choose>
		<c:when test='${userID ne NULL}'>
			<ul class="navbar-nav nav-right">
				<li class="nav-item">${userID}님</li>

				<c:choose>
					<c:when test="${userID eq 'admin'}">
						<li class="nav-item">
							<a class="nav-link" href="admin.ko">관리자페이지</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<a class="nav-link" href="myPage.ko">나의정보</a>
						</li>
					</c:otherwise>
				</c:choose>
				<a href="logout.ko">로그아웃</a>
			</ul>
			<br><br>
			<a href="prodList.ko">주류목록</a>
			<br><br>
			<a href="qnaList.ko">문의사항</a>
		</c:when>
		<c:otherwise>
			<a href="loginPage.ko">로그인하기</a>
			<a href="idf.ko">아이디 찾기</a>
			<a href="pwf.ko">비밀번호 찾기</a>
			<a href="terms.ko">회원가입</a>
		</c:otherwise>
	</c:choose>
</div>
<script>
window.onpageshow = function (event) {
	if (event.persisted || (window.performance && (window.performance.navigation.type == 1 || window.performance.navigation.type == 2))) {
		// 현재 브라우저에서 WebStorage를 지원할 때
		if ((‘sessionStorage’ in window) && window[‘sessionStorage’] !== null) {
			// sessionStorage로 데이터 다시 불러오기
			if (sessionStorage.getItem(‘DATA’)) {
				input_text.value = sessionStorage.getItem(‘DATA’);
			}
		}
	}
}
</script>
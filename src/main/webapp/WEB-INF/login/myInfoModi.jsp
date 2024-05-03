<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보(+수정)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="js/check.js"></script>
<style>
#nc {
	border: none;
}

.container-sel {
	width: 500px;
	margin: 0 auto;
	border: black solid 1px;
	padding: 50px;
}

td {
	padding: 5px;
}
</style>

<script>
	var cnt = 0;
	$(function() {
		// 닉네임 중복체크
		$("#vnick").click(function() {
			let unick = document.uMyPage.nick.value; // 닉네임 입력값 가져오기
			let nickval= {
				"u_nick" : unick
			}; // 닉네임 요청할 데이터
			console.log(unick);
			if (unick == '') {
				alert('닉네임을 입력해주세요');
			} else {
				$.ajax({
					url : "checkNick.ko", 
					type : "POST",
					data : nickval,
					dataType : "json",
					cache : false,
					async : false,
					success : function(data) {
						console.log('닉네임 중복체크 success');
						if (data > 0) {
							alert('닉네임이 이미 존재합니다.');
						} else {
							alert('사용 가능한 닉네임입니다.');
							cnt++;
						}
					},
					error : function(err) {
						console.log('error객체 : ', err);
					}
				});
			}
		});
	});
	

</script>
</head>
<body>

	<div class="container-sel">
		<h3>${user.u_name}님회원정보</h3>
		<form action="upInfo.ko" class="uMyPage" name="uMyPage" method="post"
			onSubmit="return pwchk()">
			<table>
				<tr>
					<td><span style="color: red">*</span> 아이디</td>
					<td><input type="text" id="id" name="u_id"
						value="${user.u_id}" readonly></td>
				</tr>

				<tr>
					<td><span style="color: red">*</span> 닉네임</td>
					<td><input type="text" id="nick" name="u_nick"
						value="${user.u_nick}" minlength="1"></td>
					<td><input type="button" id="vnick" value="닉네임 중복체크"></td>
				</tr>
				<tr>
					<td><span style="color: red">*</span> 비밀번호</td>
					<td><input type="password" onclick="pwInput()" id="pw"
						name="u_pw" value="${user.u_pw}" minlength="8" maxlength="16"
						pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+" required></td>
					<td><div id="pwErrorMessage"
							style="display: none; color: red;">8~16자의 영어 대/소문자, 숫자,
							특수문자를 사용해 주세요.</div></td>
				</tr>
				<tr>
					<td><span style="color: red">*</span> 비밀번호 재확인</td>
					<td><input type="password" onclick="pw1Input()" id="pw1"
						name="pw1" minlength="8" maxlength="16"
						pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+" required></td>
					<td><div id="pwErrorMessage"
							style="display: none; color: red;">위 비밀번호와 일치시켜주세요!</div></td>
				</tr>
				<tr>
					<td>등급</td>
					<td><input type="text" name="u_lev" value="${user.u_lev}"
						readonly></td>
				</tr>
				<tr>
					<td><span style="color: red">*</span> 이름</td>
					<td><input type="text" onclick="nameInput()" id="name"
						name="u_name" value="${user.u_name}" minlength="1" required></td>
					<td><div id="nameErrorMessage"
							style="display: none; color: red;">이름을 입력해주세요.</div></td>
				</tr>
				<tr>
					<td>성별</td>
					<%-- 					<td><input type="text" id="gender" name="u_gen" value="${user.u_gen}" readonly></td> --%>
					<td><input type="text" id="gender" name="u_gen"
						value="${user.u_gen}" readonly></td>
					<!-- 					<td> -->
					<!-- 					<input type="radio" onclick="genderInput()" id="gender" ame="u_gen" value="남자"> -->
					<!-- 					<label for="male">남자</label> -->
					<!-- 					<input type="radio" id="gender" name="u_gen" value="여자"> -->
					<!-- 					<label for="female">여자</label></div> -->
					<!-- 					<div id="genderErrorMessage" style="display: none; color: red;">성별을 선택해주세요.</div> -->
					<!-- 					</td> -->
				</tr>
				<tr>
					<td><span style="color: red">*</span> 생년월일</td>
					<td><input type="text" onclick="birthInput()" id="birth"
						name="u_birth" value="${user.u_birth}" minlength="8" maxlength="8"
						pattern="[0-9]{8}" required></td>
					<td><div id="birthErrorMessage"
							style="display: none; color: red;">올바른 생년월일을 입력해주세요.</div></td>
					<!-- 					<td><label for="datepicker">생년월일: </label></td> -->
					<!--    					<td><input id="datepicker" type="text" name="u_birth"></td> -->
				</tr>
				<tr>
					<td><span style="color: red">*</span> 휴대전화</td>
					<td><input type="text" onclick="telInput()" name="u_tel"
						value="${user.u_tel}" minlength="11" maxlength="11"
						pattern="[0-9]{11}" required></td>
					<td><button type="button">인증하기</button></td>
					<td><div id="telErrorMessage"
							style="display: none; color: red;">전화번호를 입력해주세요.</div></td>
				</tr>
				<tr>
					<td><span style="color: red">*</span> 이메일</td>
					<td><input type="email" onclick="emailInput()" id="email"
						name="u_email" value="${user.u_email}" minlength="5"
						maxlength="40" pattern="[a-zA-Z0-9_\-~!@#$%^&*()]+[@]" required></td>
					<td><button type="button">인증하기</button></td>
					<td><div id="emailErrorMessage"
							style="display: none; color: red;">이메일을 입력해주세요.</div>
				<tr>
					<td><span style="color: red">*</span> 주소</td>
					<td><input type="text" onclick="postcodeInput()" name="addr1"
						id="postcode" value="${user.addr1}">
					<td><input type="button" class="menu_h"
						onclick="execDaumPostcode()" value="우편번호 찾기"></td>
					<td><div id="postcodeErrorMessage"
							style="display: none; color: red;">우편번호를 입력해주세요.</div>
				</tr>
				<tr>
					<td><input type="text" onclick="addressInput()" id="address"
						name="addr2" value="${user.addr2}" readonly></td>
					<td><div id="addressErrorMessage"
							style="display: none; color: red;">주소를 입력해주세요.</div></td>
				</tr>
				<tr>
					<td><span style="color: red">*</span> 상세주소</td>
					<td><input type="text" onclick="detailInput()"
						id="detailAddress" name="addr3" value="${user.addr3}" required></td>
					<td><div id="detailErrorMessage"
							style="display: none; color: red;">상세주소를 입력해주세요.</div></td>
				</tr>
			</table>
			<div>
				<button type="submit">정보 수정하기</button>
			</div>
		</form>
	</div>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//                 document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
	
</script>
</html>
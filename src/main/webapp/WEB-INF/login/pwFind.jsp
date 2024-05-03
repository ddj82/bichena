<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" class="form-control" placeholder="ID" name="u_id" id="id" required>
	<button type="button" onclick="pwFind(event)">버튼</button>
	<div id="pwFindBox"></div>
	<script>
		function pwFind(event) {
			console.log("event : ", $("#id").val());

			var formData = {
				u_id : $("#id").val()
			};

			$.ajax({
				type : "POST",
				url : "pwFind.ko",
				data : formData,
				cache : false,
				success : function(res) {
					console.log("res : ", res)
					if (res !== undefined) {
						let str = "임시로 비밀번호를 변경했습니다.<br> 해당 비밀번호로 로그인 하신후 비밀번호를 변경해 주세요.<br> 변경된 비밀번호 :"
								+ res;
						$("#pwFindBox").html(str);

					} else {
						console.log("이야");
						$("#pwFindBox").html("일치하는 아이디가 존재하지 않습니다.");
					}
				}
			});
		}
	</script>
</body>
</html>
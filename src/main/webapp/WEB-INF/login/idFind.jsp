<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>

label.control-label.col-sm-2 {
    width: 200px;
    text-align: left;
    margin: 10px 0px; 
}


.idFindContainerBox {
    margin-top: 100px;
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
}

h4 {
    text-align: center;
    margin-bottom: 20px;
}

form#form-signin {
	width: 100%;
}

form#form-signin-id {
    width: 324.91px;
}

.col-sm-10 {
    width: 100%;
}

input#u_name{
	height: 55px;
}

input#u_tel{
	height: 55px;
}

#btn-success{
	height: 55px;
	width : 100%;
}

.alert {
    margin-top: 37px;
    margin-bottom: 0px;
}

@media (min-width: 768px) {
    .col-sm-offset-2 {
    margin: 10px 0px;
    }
}

.mybutton {
    color: white;
    background-color: #d5d5d5;
    font-size: 18px;
    display: flex;
    margin-top: 30px;
    line-height: 50px;
    justify-content: center;
    outline : none !importent;
    border: none;
    outline:none;
}

</style>
</head>
<body>

		<div class="container">
			<div class="idFindContainerBox">
			<h4>아이디 찾기</h4>
			<form action="idFind.ko" method="get" class="form-horizontal"
				id="form-signin-id">
				<div class="form-group">
					<label class="control-label col-sm-2" for="u_name">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="u_name" placeholder="이름을 입력해주세요." name="u_name">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="u_tel">휴대폰 번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="u_tel" placeholder="휴대폰 번호를 입력해 주세요." name="u_tel">
					</div>
				</div>
				
				<div class='alert alert-danger' id="pattern" style="display:none;"></div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="mybutton" id="btn-success">아이디 찾기</button>
					</div>
				</div>
			</form>
			
			<%
			if (request.getParameter("error") != null && request.getParameter("error").equals("1")) {%>
				<script>
					$(".alert-danger").css("display","block");
					$(".alert-danger").html("해당하는 이름이나 전화번호가 존재하지 않습니다.");
				myExec = setTimeout(function(){ 
					$(".alert-danger").css("display","none");
					}, 2000);
				</script>
			<% }%>
		</div>
	</div>
</body>
<script>

	var trimPhon;

	$('#btn-success').click(function() {
		test();
	});

	//엔터 키가 눌렸을 때 기본 이벤트(폼 제출)막고 대신 test()함수 호출
	document.addEventListener('DOMContentLoaded', function() {
		// 특정 입력 필드 가져오기
		var inputField = document.getElementById("form-signin-id");
		console.log("inputField : ", inputField);

		// 입력 필드에 포커스될 때 엔터 키 이벤트 처리
		inputField.addEventListener("keydown", function(event) {
			// 엔터 키가 눌렸을 때 기본 이벤트(폼 제출) 막기
			if (event.key === "Enter") {
				event.preventDefault();
				alert("enter이벤트");
				test();
			}
		});
	});

	// 전화번호 & 이메일 패턴이 올바른지 확인한 후, 맞으면 데이터 전송하는 search()함수 호출, 안 맞으면 전송하지 않음. 
	function test() {
		const phonPattern = /^(?:(010)|(01[1|6|7|8|9]))\d{3,4}(\d{4})$/;
		let phon = $("#u_tel").val();
		let name =$("#u_name").val();
		trimPhon = phon.replace(/\s/g, "");
		if (phonPattern.test(trimPhon) && name != "") {
			console.log("name : ", name);
			search();
		} else if(name == ""){
			$(".alert-danger").css("display","block");
			$(".alert-danger").html("이름을 입력해 주세요.");
			myExec = setTimeout(function(){
			$(".alert-danger").css("display","none");
			}, 2000);
		}else {
			$(".alert-danger").css("display","block");
			$(".alert-danger").html("전화번호가 올바르지 않습니다.");
			myExec = setTimeout(function(){
			$(".alert-danger").css("display","none");
			}, 2000);
		}
	}

	//사용자가 전송한 데이터를 받아 실행
	function search() {
		alert("search()를 탔습니다.");
		// 		location.href = "idFind.ko?u_name=" + $("#u_name").val() + "&u_tel=" + trimPhon;
		document.getElementById("form-signin-id").submit();
	}
	
	window.onpageshow = function(event){
		if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
			console.log("뒤로가기");
			location.reload();
		}
	}
	</script>
</html>

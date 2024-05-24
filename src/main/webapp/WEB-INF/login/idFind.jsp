<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비채나</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>

.form-group.idFind {
    margin-bottom: 15px;
}

formControl.idFind {
    width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    display: inline;
	height: 52px;
	margin-bottom: 10px;
}


label.control-label.idFind {
	font-weight: bold;
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

.sm-10.idFind {
    width: 100%;
}

input#idFind_name{
	height: 55px;
	margin-top: 10px;
}

input#idFind_tel{
	height: 55px;
	margin-top: 10px;
}

#btn-success{
	height: 55px;
	width : 100%;
}

.alert {
	margin-top:20px;
    padding: 15px;
    border: 1px solid transparent;
    border-radius: 4px;
}
    
.alert-danger {
	font-size:13px;
	margin-bottom: 10px;
	color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
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
    border-radius: 5px;
}


h4 {
    text-align: center;
    margin-bottom: 20px;
    font-weight: bolder;
    color: #2d4739;
}

label.control-label.idFind {
    width: 100px;
    font-weight: bold;
    display: flex;
    padding: 0px;
    margin-bottom: 15px;
    margin-top: 10px;
    color: #2d4739;
}

input#idFind_tel,input#idFind_name {
    width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #2d4739;
    border-radius: 4px;
    display: inline;
    height: 52px;
    margin-bottom: 10px;
}

button#btn-success {
    width: 100%;
    height: 52px;
    font-size: 18px;
    margin-top: 30px;
    display: flex;
    margin-bottom: 10px;
    justify-content: center;
    align-items: center;
    color: #fff;
    background-color: #005930;
    outline: none;
    box-sizing: border-box;
    border: 1px solid transparent;
    padding: 10px 16px;
    line-height: 1.3333333;
    border-radius: 6px;
}

#idFind_tel:hover,#idFind_name:focus{
    border: 2px solid #2d4739;
}

#btn-success:active,#btn-success:hover { 
 	color: #fff; 
 	background-color: #2d4739;
    border-color: #2d4739;
 	outline: none; 
 } 


@media (max-width: 575px) {
    .col-sm-10.idFind {
        max-width: 100%;
    }
    
input#idFind_name,input#idFind_tel {
    margin: 0px;
}

label.control-label.idFind {
    margin: 0px;
}

h4 {
    font-size: 22px;
}

.idFindContainerBox {
    margin-top: 50px;
}

form#form-signin-id {
    width: 280px;
}

}


</style>
</head>
<body>

		<div class="container">
			<div class="idFindContainerBox">
			<h4>아이디 찾기</h4>
			<form action="idFind.ko" method="get" class="form-horizontal"
				id="form-signin-id">
				<div class="form-group idFind">
					<label class="control-label idFind" for="u_name">이름</label>
					<div class="sm-10 idFind">
						<input type="text" class="formControl idFind" id="idFind_name" placeholder="이름을 입력해주세요." name="u_name">
					</div>
				</div>
				<div class="form-group idFind">
					<label class="control-label idFind" for="u_tel">휴대폰 번호</label>
					<div class="sm-10 idFind">
						<input type="text" class="formControl idFind" id="idFind_tel" placeholder="휴대폰 번호를 입력해 주세요." name="u_tel">
					</div>
				</div>
				
				<div class='alert alert-danger' id="pattern" style="display:none;"></div>
				
				<div class="form-group idFind">
					<div class="col-sm-offset-2 idFind">
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
				test();
			}
		});
	});

	// 전화번호 & 이메일 패턴이 올바른지 확인한 후, 맞으면 데이터 전송하는 search()함수 호출, 안 맞으면 전송하지 않음. 
	function test() {
		const phonPattern = /^(?:(010)|(01[1|6|7|8|9]))\d{3,4}(\d{4})$/;
		let phon = $("#idFind_tel").val();
		let name =$("#idFind_name").val();
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
		document.getElementById("form-signin-id").submit();
	}
	
	window.onpageshow = function(event){
		if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
			console.log("뒤로가기");
			location.reload();
		}
	}
	</script>
<%@ include file="../../common/footer.jsp"%>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>비채나</title>
<style>
.wrapSign {
	width: 310px;
	margin: 0 auto;
	margin-top: 30px;
}
.form1 {
	margin-top: 30px;
}
.div1 {
	width: 600px;
	padding: 0px 0px 0px 3px;
}

.submit {
	margin-top: 10px;
	width: 300px;
	padding: 5px;
	background-color: #005930;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
	height: 40px;
	-webkit-transition: transform 0.2s ease-out, color 0.2s ease;
	-moz-transition: transform 0.2s ease-out, color 0.2s ease;
	-ms-transition : transform 0.2s ease-out, color 0.2s ease;
	-o-transition : transform 0.2s ease-out, color 0.2s ease; transition :
	transform 0.2s ease-out, color 0.2s ease;
	-webkit-transform: scale3d(1, 1, 1);
	-moz-transform: scale3d(1, 1, 1);
	-ms-transform: scale3d(1, 1, 1);
	-o-transform: scale3d(1, 1, 1);
	transform: scale3d(1, 1, 1);
	-o-transform: scale3d(1, 1, 1);
	-moz-transition: transform 0.2s ease-out, color 0.2s ease;
	-ms-transition: transform 0.2s ease-out, color 0.2s ease;
	-o-transition: transform 0.2s ease-out, color 0.2s ease;
	transition: transform 0.2s ease-out, color 0.2s ease;
	-ms-transition: transform 0.2s ease-out, color 0.2s ease;
	-o-transition: transform 0.2s ease-out, color 0.2s ease;
	transition: transform 0.2s ease-out, color 0.2s ease;
}

.submit:disabled {
	cursor: default;
	background-color: rgb(195, 195, 195) !important;
	color: rgba(61, 61, 61, 0.3) !important;
	-webkit-transform: scale3d(0.8, 0.8, 1);
	-moz-transform: scale3d(0.8, 0.8, 1);
	-ms-transform: scale3d(0.8, 0.8, 1);
	-o-transform: scale3d(0.8, 0.8, 1);
	transform: scale3d(0.8, 0.8, 1);
}

.terms {
	margin-bottom: 3px;
}

input[type="checkbox"] {
	border: none;
	zoom: 2.0;
	position: relative;
	top: 3.5px;
	margin-right: 8px;
	cursor: pointer;
	-webkit-transition: transform 0.2s ease-out, color 0.2s ease;
	-moz-transition: transform 0.2s ease-out, color 0.2s ease;
	-ms-transition: transform 0.2s ease-out, color 0.2s ease;
	-o-transition: transform 0.2s ease-out, color 0.2s ease;
	transition: transform 0.2s ease-out, color 0.2s ease;
	-webkit-transform: scale3d(0.8, 0.8, 1);
	-moz-transform: scale3d(0.8, 0.8, 1);
	-ms-transform: scale3d(0.8, 0.8, 1);
	-o-transform: scale3d(0.8, 0.8, 1);
	transform: scale3d(0.8, 0.8, 1);
}

input[type="checkbox"]:hover {
	-webkit-transform: scale3d(1, 1, 1);
	-moz-transform: scale3d(1, 1, 1);
	-ms-transform: scale3d(1, 1, 1);
	-o-transform: scale3d(1, 1, 1);
	transform: scale3d(1, 1, 1);
	-o-transform: scale3d(1, 1, 1);
}

input[type="checkbox"]:active {
	-webkit-transform: scale3d(1.5, 1.5, 1);
	-moz-transform: scale3d(1.5, 1.5, 1);
	-ms-transform: scale3d(1.5, 1.5, 1);
	-o-transform: scale3d(1.5, 1.5, 1);
	transform: scale3d(1.5, 1.5, 1);
}

input[type="checkbox"]:checked {
	-webkit-transform: scale3d(1, 1, 1);
	-moz-transform: scale3d(1, 1, 1);
	-ms-transform: scale3d(1, 1, 1);
	-o-transform: scale3d(1, 1, 1);
	transform: scale3d(1, 1, 1);
}

span.must {
	text-decoration-line: none;
}

a {
	text-decoration-line: none;
}

a:visited {
	text-decoration-line: none;
}

span.all {
	font-weight: bold;
}
#clauseAll {
	accent-color: #005930;
	margin-right: 10px;
}
#clause1 {
	accent-color: #005930;
}
#clause2 {
	accent-color: #005930;
}
.arrow {
	margin-bottom: 5px;
}
/* extra small */
@media screen and (max-width:540px) {
	.wrapSign {
		width: 300px;
	}
	.div1 {
		width: 300px;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	.wrapSign {
		width: 305px;
	}
	.div1 {
		width: 300px;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	.wrapSign {
		width: 300px;
	}
	.div1 {
		width: 300px;
	}
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
	.wrapSign {
		width: 300px;
	}
	.div1 {
		width: 300px;
	}
}
</style>
</head>
<body>
<%@include file="/common/navbar.jsp" %>


	<div class="wrapSign">
		<h2 class="welcome" style="font-weight: bold;">환영해요!</h2>
		<div class="a">
			<form class="form1" name="form1">
				<span class="all">
					<input type="checkbox" name="clause" id="clauseAll" value="clauseAll"><label>전체 동의하기</label>
				</span>
				<br><br> 
				<span class="must">
					<input type="checkbox" name="clause" id="clause1" value="agree">
					<label>
						<a href="serviceTerms.ko">
							[필수]서비스 이용약관 
							<img src="img/imgUser/arrow-right.png" class="arrow" alt="약관 페이지" width="10px" height="10px">
						</a>
					</label>
				</span><br><br> 
				
				<span class="must">
					<input type="checkbox" name="clause" id="clause2" value="agree">
					<label>
						<a href="personalTerms.ko">
							[필수]개인정보 수집 및 이용 
							<img src="img/imgUser/arrow-right.png" class="arrow" alt="약관 페이지" width="10px" height="10px">
						</a>
					</label>
				</span><br><br>
				
				<div id="div1" class="div1">
					<input type="button" value="성인 인증하기" id="submit" class="submit" onclick="requestCert()" disabled>
				</div>
			</form>
		</div>
	</div>
	<script>
		document.form1.clauseAll.onclick = function() {
			let clauseAll = document.form1.clauseAll.checked;
			if (clauseAll) {
				document.form1.clause1.checked = true;
				document.form1.clause2.checked = true;
				document.form1.submit.disabled = false;
			} else {
				document.form1.clause1.checked = false;
				document.form1.clause2.checked = false;
				document.form1.submit.disabled = true;
			}
		}
		document.form1.clause1.onclick = function() {
			let clause1 = document.form1.clause1.checked;
			let clause2 = document.form1.clause2.checked;
			if (!clause1) {
				document.form1.clauseAll.checked = false;
				document.form1.submit.disabled = true;
			} else if (clause1 && clause2) {
				document.form1.clauseAll.checked = true;
				document.form1.submit.disabled = false;
			}
		}
		document.form1.clause2.onclick = function() {
			let clause1 = document.form1.clause1.checked;
			let clause2 = document.form1.clause2.checked;
			if (!clause2) {
				document.form1.clauseAll.checked = false;
				document.form1.submit.disabled = true;
			} else if (clause1 && clause2) {
				document.form1.clauseAll.checked = true;
				document.form1.submit.disabled = false;
			}
		}
		
		
		IMP.init("imp70405420");
		var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
		
		function requestCert(){
			if(!isMobile) {
				IMP.certification(
				  {
				    pg: "inicis_unified.MIIiasTest"
				  },
				  function (rsp) {
				    if (rsp.success) {
				    	jQuery.ajax({
				            url: "cer.ko",
				            method: "POST",
				            async : false,
				            data: { "imp_uid" : rsp.imp_uid }
				          }).done(function(res){
				        	  console.log(res);
				        	  if(res == '') {
				        		  location.href = "success.ko?result=1";
				        	  } else if(new Date(res.birth).getFullYear() > 2005) {
				        		  location.href = "main.ko?result=2";
				        	  } else if(new Date(res.birth).getFullYear() <= 2005){
				        		  location.href = "insertPage.ko?name="+res.name+"&tel="+res.phone+"&birth="+res.birth;
				        	  } else {
				        		  alert('인증에 실패하였습니다. 에러 내용 : ' + res.msg);
				        	  }
				          });
				        
				    } else {
				    	
				    }
				  },
				  
				);
			} else {
				IMP.certification(
				  {
				    pg: "inicis_unified.MIIiasTest",
				    m_redirect_url: "http://bichena.kro.kr/mobileCer.ko"
				  },
				  function (rsp) {
				    if (rsp.success) {
				    	jQuery.ajax({
				            url: "cer.ko",
				            method: "POST",
				            async : false,
				            data: { "imp_uid" : rsp.imp_uid }
				          }).done(function(res){
				        	  console.log(res);
				        	  if(res == '') {
				        		  location.href = "success.ko?result=1";
				        	  } else if(new Date(res.birth).getFullYear() > 2005) {
				        		  location.href = "main.ko?result=2";
				        	  } else if(new Date(res.birth).getFullYear() <= 2005){
				        		  location.href = "insertPage.ko?name="+res.name+"&tel="+res.phone+"&birth="+res.birth;
				        	  } else {
				        		  alert('인증에 실패하였습니다. 에러 내용 : ' + res.msg);
				        	  }
				          });
				    } else {
				    	
				    }
				  },
				  
				);
			}
		}
	</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>
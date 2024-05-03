<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input type="button" onclick="requestCert()" value="인증하기">
	</form>

</body>
<script>
IMP.init("imp70405420");

function requestCert(){
	
	IMP.certification(
			  {
			    pg: "inicis_unified.MIIiasTest",
			    m_redirect_url: "http://localhost:8090"
			  },
			  function (rsp) {
				  console.log(rsp);
			    if (rsp.success) {
			    	jQuery.ajax({
			            url: "cer.ko",
			            method: "POST",
			            async : false,
			            data: { "imp_uid" : rsp.imp_uid }
			          }).done(function(res){
			        	  if(new Date(res.birth).getFullYear() <= 2005) {
			        		  alert('인증이 완료 되었습니다!');
			        		  location.href = "insertPage.ko?name="+res.name+"&tel="+res.phone+"&birth="+res.birth;
			        	  } else if(new Date(res.birth).getFullYear() > 2005) {
			        		  alert('미성년자는 가입이 불가합니다.');
			        	  } else {
			        		  alert('인증에 실패하였습니다. 에러 내용 : ' + res.msg);
			        	  }
			          });
			        
			    } else {
			    	alert("인증에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			    }
			  },
			  
			);
	
	
}
</script>
</html>
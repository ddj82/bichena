<%@ include file="/common/navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <style>
        p {

            font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	font-optical-sizing: auto;
		
        }


        body{
            margin: 0;
            padding: 0;
        }
		.banner-img {
		width:100%;
		max-width: 100%;
		padding:0!important;
		margin:0!important;
		}
        .banner-img img{
            max-width:100%;
            position: relative;

        }
        .text-secter1{
            padding: 40px 80px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: absolute;
            background-color: rgba(0,0,0,0.8);
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .text-secter1 p {
            color: aliceblue;
            font-size: 26px;
            line-height: 0.6;
            font-weight: bold;
        }
        .text-secter2{
            margin-top:200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 1140px;
            /* max-width: 1440px; */
        }

        .text-secter2 > p{
            font-size: 26px;
            font-weight: bold;
        }

        .text-secter2-desc {
            text-align: center;
            line-height: 2.3;
            padding: 0 30px;
        }

        .text-secter2-desc p {
            font-size: 18PX
        }


       

        .text-secter3{
            margin:60px 0px 200px 0px;
            display: flex;
            flex-direction: column;
            align-items: center;
            /* max-width: 1440px; */
        }
        .value-circle{
            width: 300px;
            height: 300px;
            border-radius: 50%;
            border: 16px solid #2d4739;
            background-color: #2d4739;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 20px;
        }

        /* .value-circle:first-child{
            border: 16px solid rgb(250, 246, 31);
        }
        .value-circle:nth-child(2){
            border: 16px solid rgb(0, 143, 95);
        }
        .value-circle:nth-child(3){
            border: 16px solid rgb(80, 135, 255);
        } */

        .value-circle p {
            color: aliceblue;
            font-size: 30px;
            font-weight: 600;
        }

        .circle-group{
            display: flex;
            justify-content:space-around;
        }
        .brand-value{
            text-align: center;
        }
        .brand-value p{
            font-size: 36px;
            font-weight: 600;
            margin-bottom: 100px;
            
        }
        .introduce-container{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            /* max-width: 1440px; */
            margin: 0 auto;
        }
		.wrapper{
			margin:0 auto;
		}
		
		@media (max-width:1200px){
		.value-circle{
			height:250px
		}
		}
		
		@media (max-width:991px){
			.text-secter1 {
			    padding: 36px 80px;
			}
			.text-secter1 p {
					font-size:18px
					}
					
			.value-circle{
				height:170px
				
			}
	        .value-circle p {
	            font-size: 24px;
	        }
	        .text-secter2 p {
	        	font-size:20px
	        }
	        .text-secter2-desc p {
	        	font-size:16px
	        }
		}
		
		@media (max-width:768px){
					.text-secter1 {
			    padding: 30px 60px;
			}
			
			.text-secter1 p {
					font-size:14px
			}
			.value-circle{
				height:110px
			}
			.text-secter2 {
			margin-top:100px;
			}
		     .text-secter2 p {
	        	font-size:16px
	        }
		        .text-secter2-desc p {
	        	font-size:14px
	        }
		}
		
		
		@media (max-width:576px){
			.text-secter1 {
			    padding: 28px 20px;
			}
			.text-secter1 p {
					font-size:12px
			}
						.value-circle{
				height:110px
				
			}
			.text-secter2 {
			margin-top:80px;
			}
	       .text-secter2 p {
	        	font-size:14px
	        }
	        .text-secter2-desc p {
	        	font-size:12px
	        }
      		.value-circle{
      			width:80px;
				height:80px
			}
	  		.value-circle p{
	  			font-size:16px;
	  			white-space: pre;
	  			margin: 0;
			}
		}
		
		@media (max-width:413px){
	      
	         .text-secter3 {
	             margin: 30px 0px 80px 0px;
	         }
	
	              .text-secter2 p {
	              font-size:10px
	           }
	           .value-circle p{
	            font-size:14px;
	              margin: 0;
	                white-space: pre;
	         }
	         .value-circle {
	             margin: 0;
	         }
	         
	         .brand-value p {
	          margin-bottom: 30px!important;
	         }
	      }

    </style>
</head>
<body>
    <div class="container banner-img">
        <img src="img/imgIntroduce/introducebanner3.png">
        <div class="text-secter1">
            <p>비채나는 우리 전통주와</p>
            <p>함께 나아갑니다.</p>
        </div>
    </div>
<div class="wrapper">


    <div class="container introduce-container">
        <div class="container text-secter2">
            <p>전통주의 진수, 우리 문화의 향기</p>
            <p>저희는 한국의 전통주를 사랑하고 전파하는 비채나 입니다.</p>
            <div class="container text-secter2-desc">
                <p>
                    한국의 전통주는 오랜 역사와 문화 속에서 발전해온 고유의 술입니다. 자연의 풍미를 가득 담은 쌀, 보리, 과일 등의 천연 재료와 전통적인 제조 방법을 통해 빚어내는 전통주는, 그 자체로 우리 민족의 정서와 혼을 담고 있습니다.

                    저희 비채나는 이런 전통주를 현대에 맞게 재해석하고, 더 많은 사람들에게 전통주의 아름다움을 알리고자 노력하고 있습니다. 엄선된 재료와 정성을 다한 제조 과정을 통해 최고의 품질을 자랑하는 전통주를 생산하며, 그 맛과 향, 그리고 이야기를 소비자들에게 전달하고 있습니다.
                    
                    전통주의 깊은 맛과 향, 그리고 그 속에 담긴 역사를 경험해보세요. 저희 비채나와 함께라면, 전통주의 새로운 세계를 만날 수 있습니다.
                    
                </p>
            </div>
        </div>



        <div class="container text-secter3">
            <div class="container brand-value"><p>브랜드 가치</p></div>
             <div class="container circle-group"> 
                <div class="container value-circle">
                    <p>전통</p>
                </div>
                <div class="container value-circle">
                    <p>상생</p>
                </div>
                <div class="container value-circle">
                    <p>문화</p>
                </div>
             </div>   
            </div>
        </div>
     </div>
    <%@ include file="/common/footer.jsp"%>
    
</body>
</html>
<%@ include file="/common/navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        box-sizing: border-box;
    }
   
    .map {
        width: 100%;
        margin: 0 auto;
        background-color: white;
        text-align: center;
    }

    .map_cont {
        margin: 50px auto;
        width: 700px; /* 수정된 너비 */
        height: 450px; /* 수정된 높이 */
        max-width: 100%;
    }

    table.map-table {
        text-align: left;
        padding: 50px;
        border: 1px 0 solid black;
        box-sizing: border-box;
        text-indent: initial;
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        margin: 20px auto;
        background-color: #ffffff; /* 테이블 배경색 */
    }
    
    tr.map-tr {
       border-bottom: 2px solid #dee2e6;
    }


    th.map-th {
       text-align: center;
        vertical-align: middle;
        margin: 0;
        padding: 0;
        font-family: 'Nanum Gothic', dotum, sans-serif;
        unicode-bidi: isolate;
        font-weight: 600;
        color: #222222;
        padding: 8px 0;
        width: 30%;
    }

    td.map-td {
        font-weight: 100;
        color: #666666;
        padding: 8px 0;
    }

    .sub_container .sub_cont div.sub_map div.map_cont table tr:first-child td {
        border-top: 1px solid #d3d3d3;
    }
    
    
    section.title2 {
       border-bottom: 1 solid gray;
       margin: 20px auto;
       width: 30%;
       font-size: 18px;
       padding-bottom: 8px;
       padding-left: 10px;
       text-align: center;
    }
    
    .title {
       font-size: 25px;
       text-align: left;
       padding: 20px;
       width: 60%;
       margin: 0 auto;
       text-align: center;
       padding: 35px 0;
       color: #222;
    }

  @media screen and (max-width: 1150px) {
    .map {
        width: 90%;
        padding: 20px auto;
    }

    #daumRoughmapContainer1711698072462 {
        width: 100% !important;
        height: 400px !important;
    }
    div.wrap_map {
       height: 365px !important;
    }
    
    .map-table {
        max-width: 90%;
        margin: 20px auto;
    }
    section.title2 {
       padding-bottom: 8px;
       padding-left: 0;
    }
    th.map-th {
       font-size: 14px;
       padding: 0 2px;
    }
    td.map-td {
       font-size: 14px;
    }
}

.content-box {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    margin: 0 auto;
    border: 3px solid rgba(184, 134, 11, 0.4);
    margin-top: 40px;
	margin-bottom: 100px;
}
.content{
    padding: 10px;
    width: 100%;
    display: flex;
    margin: 30px 0;
    border-top: 3px solid rgba(180, 180, 180,0.7);
    border-bottom: 3px solid rgba(180, 180, 180,0.7);

}
.content img {
    margin:0 40px;
    width: 200px;
    height: 200px;
}
.text{
    display: flex;
    flex-direction: column;
    justify-content: center;
    line-height: 2.4;
    padding-left: 30px;

}
.sector {
    font-size: 20px;
    color:darkgoldenrod

}
.tel{
    font-size: 16px;

}
.addr{
    font-size: 18px;

}
.text,.tel-title,.tel-desc{
   font-family: 'Spoqa Han Sans Neo', 'sans-serif';
   font-optical-sizing: auto;
   font-weight: 700;

}
.title{
    font-size: 26px;
    font-weight: 800;

}
.tel-title{
    display: flex;
    flex-direction: column;
    margin: 0 auto;
    align-items: center;
    justify-content: center ;
    padding: 30px 0;
    line-height: 2.8;
    font-size: 20px;
    font-weight: 600;
    color: dimgray;
}

.tel-title div:first-child {
    font-size: 36;
    font-weight: 800;
}
.tel-desc{
    width: 100%;
    display: flex;
    justify-content: space-around;
    font-weight: 600;
    color: dimgray;
}
.body-wrapper{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.tel-box{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    font-size: 18px;
    line-height: 2;
}
svg{

    margin: 30px 0;
    opacity: 0.6;
}

@media (max-width:768px){
		
.tel-title div:first-child  {
	font-size:26px;
	}
.tel-box{
	font-size:14px
}

.content img {
    margin: 10px 20px;
    width: 150px;
    height: 150px;
}

.sector {

	font-size:16px
}

.tel , .addr{
	font-size:14px
}


}

@media (max-width:500px) {
.tel-title div:first-child  {
   font-size:22px;
   }
.tel-title div:nth-child(2){
   font-size:18px;
}
.tel-box{
   font-size:14px
}
.tel-desc{
	flex-direction:column
}

}

</style>



</head>
<body>
<div class="container body-wrapper">
    <div class="map">
        <section class="title">
            오시는길
        </section>
        <div id="daumRoughmapContainer1711698072462" class="root_daum_roughmap root_daum_roughmap_landing" style="display: inline-block;"></div>
    </div>
    <!--
        2. 설치 스크립트
        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
    -->
    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

    <!-- 3. 실행 스크립트 -->
    <script charset="UTF-8">
        new daum.roughmap.Lander({
            "timestamp" : "1711698072462",
            "key" : "2iqdo",
            "mapWidth" : "900",
            "mapHeight" : "700"
        }).render();
    </script>

    <div class="tel-title">
            <div>연락처</div>
            <div>궁금하신 사항이 있으시면 아래로 연락주세요</div>
    </div>

    <div class="tel-desc">
        <div class="tel-box">
            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24"><path d="M17.492 15.432c-.433 0-.855-.087-1.253-.259l.467-1.082c.25.107.514.162.786.162.222 0 .441-.037.651-.11l.388 1.112c-.334.118-.683.177-1.039.177zm-10.922-.022c-.373 0-.741-.066-1.093-.195l.407-1.105c.221.081.451.122.686.122.26 0 .514-.05.754-.148l.447 1.09c-.382.157-.786.236-1.201.236zm8.67-.783l-1.659-.945.583-1.024 1.66.945-.584 1.024zm-6.455-.02l-.605-1.011 1.639-.981.605 1.011-1.639.981zm3.918-1.408c-.243-.101-.5-.153-.764-.153-.23 0-.457.04-.674.119l-.401-1.108c.346-.125.708-.188 1.075-.188.42 0 .83.082 1.217.244l-.453 1.086zm7.327-.163c-.534 0-.968.433-.968.968 0 .535.434.968.968.968.535 0 .969-.434.969-.968 0-.535-.434-.968-.969-.968zm-16.061 0c-.535 0-.969.433-.969.968 0 .535.434.968.969.968s.969-.434.969-.968c0-.535-.434-.968-.969-.968zm18.031-.832v6.683l-4 2.479v-4.366h-1v4.141l-4-2.885v-3.256h-2v3.255l-4 2.885v-4.14h-1v4.365l-4-2.479v-13.294l4 2.479v3.929h1v-3.927l4-2.886v4.813h2v-4.813l1.577 1.138c-.339-.701-.577-1.518-.577-2.524l.019-.345-2.019-1.456-5.545 4-6.455-4v18l6.455 4 5.545-4 5.545 4 6.455-4v-11.618l-.039.047c-.831.982-1.614 1.918-1.961 3.775zm2-8.403c0-2.099-1.9-3.801-4-3.801s-4 1.702-4 3.801c0 3.121 3.188 3.451 4 8.199.812-4.748 4-5.078 4-8.199zm-5.5.199c0-.829.672-1.5 1.5-1.5s1.5.671 1.5 1.5-.672 1.5-1.5 1.5-1.5-.671-1.5-1.5zm-.548 8c-.212-.992-.547-1.724-.952-2.334v2.334h.952z"/></svg>
            <div>경기도 안양시 동안구 시민대로 235</div>
            <div>경기도 안양시 만안구 만안로223번길 7</div>
        </div>
        <div class="tel-box">
            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24"><path d="M6.176 1.322l2.844-1.322 4.041 7.89-2.724 1.341c-.538 1.259 2.159 6.289 3.297 6.372.09-.058 2.671-1.328 2.671-1.328l4.11 7.932s-2.764 1.354-2.854 1.396c-7.862 3.591-19.103-18.258-11.385-22.281zm1.929 1.274l-1.023.504c-5.294 2.762 4.177 21.185 9.648 18.686l.971-.474-2.271-4.383-1.026.5c-3.163 1.547-8.262-8.219-5.055-9.938l1.007-.497-2.251-4.398z"/></svg>
            <div>TEL : 010-7877-4541</div>
            <div>E-MAIL : bichena@gmail.com</div>
        </div>
    </div>


    <div class="container content-box">

        <div class="container content">
            <div>
                <img src="img/imgMap/map1.jpg">
            </div>
            <div class="text">
                <div class="sector">군포점</div>
                <div class="tel">032-457-5788</div>
                <div class="addr">경기도 안양시 동안구 시민대로 235</div>
            </div>
        </div>

        <div class="container content">
            <div>
                <img src="img/imgMap/map2.png">
            </div>
            <div class="text">
                <div class="sector">범계점</div>
                <div class="tel">032-467-7318</div>
                <div class="addr">경기도 안양시 동안구 시민대로 180</div>
            </div>
        </div>

        <div class="container content">
            <div>
                <img src="img/imgMap/map3.jpg">
            </div>
            <div class="text">
                <div class="sector">산본점</div>
                <div class="tel">032-455-5932</div>
                <div class="addr">경기도 산본동 1118-7</div>
            </div>
        </div>

        <div class="container content">
            <div>
                <img src="img/imgMap/map4.jpg">
            </div>
            <div class="text">
                <div class="sector">강남점</div>
                <div class="tel">032-254-3462</div>
                <div class="addr">서울특별시 강남구 강남대로 438 스타플렉스 4층</div>
            </div>
        </div>

        <div class="container content">
            <div>
                <img src="img/imgMap/map5.jpg">
            </div>
            <div class="text">
                <div class="sector">부평점</div>
                <div class="tel">032-255-3178</div>
                <div class="addr">인천광역시 부평구 마장로 489</div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/footer.jsp"%>
</body>
</html>


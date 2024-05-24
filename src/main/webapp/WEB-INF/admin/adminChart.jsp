


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userID") == null) {%>
<script>
location.href="main.ko";
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            google.charts.load("current", {packages:['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                $.ajax({
                    url: "adminChartData.ko",
                    method: "GET",
                    success: function(chartResult) {
                        console.log(chartResult);
                        if (chartResult.length == 0) {
                        	$("#columnchart_values").append("<div style='margin:100px 0;font-size:25px;'>판매내역이 없습니다.<div>");
                        	return;
                        }
                        var chartData = [
                            ["상품 이름", "판매 개수", { role: "style" }, { role: 'annotation' }]// 색상을 추가할 열을 선언
                        ];

                        var colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd']; // 막대에 적용할 색상 배열

                        for (var i = 0; i < chartResult.length; i++) {
                            var p_name = chartResult[i].p_name;
                            var salesCount = chartResult[i].salesCount;
                            var cancelCount = chartResult[i].cancelCount;
                            console.log("p_name:", chartResult[i].p_name);
                            console.log("salesCount:", chartResult[i].salesCount);
                            console.log("cancelCount:", chartResult[i].cancelCount);
                            var finalCount = salesCount - (cancelCount || 0);
                            chartData.push([p_name, finalCount, colors[i % colors.length], finalCount.toString()]); // 주석 추가
                        }

                        var data = google.visualization.arrayToDataTable(chartData);

                        var options = {
                            title: "상품별 판매 개수",
                            animation: {
                                startup: true, // 그래프 로드 시 애니메이션 효과를 적용
                                duration: 1000, // 애니메이션 지속 시간 (밀리초)
                                easing: 'out', // 애니메이션 이징 (linear, in, out 등)
                            },
                            width: 1440,
                            height: 800,
                            backgroundColor: "#fff",
                            legend: { position: "top", alignment: "center" },
                            bar: { groupWidth: "50%" },
                            annotations: {
                                textStyle: {
                                    fontSize: 12,
                                    bold: true,
                                    color: "#333"
                                }
                            },
                            hAxis: {
                                title: "상품 이름",
                                titleTextStyle: { color: "#333" },
                                textStyle: { fontSize: 12 }
                            },
                            vAxis: {
                                title: "판매 개수",
                                titleTextStyle: { color: "#333" },
                                maxValue: 500,
                                minValue: 0,
                                textStyle: { fontSize: 12 }
                            }
                        };

                        var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                        
                            chart.draw(data, options);
                       
                    },
                    error: function(xhr, status, error) {
                        console.error("데이터를 가져오는 중 오류 발생:", error);
                    }
                });
            }
        });
    </script>
    <style>
    #columnchart_values{
    display:flex;
    justify-content: center;
    }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
    <div class="container graph-box">
        <div id="columnchart_values" style="width: 100%; height: 100%; margin:0 auto"></div>
    </div>
</body>
</html>

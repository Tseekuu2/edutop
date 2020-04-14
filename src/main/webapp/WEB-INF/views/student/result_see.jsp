<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>Result see</title>
        <script type="text/javascript" src="${ASSETS}/script/jquery.datetimepicker.full.min.js"></script>
        <script type="text/javascript" src="${ASSETS}/script/chart-plugin.min.js"></script>
        <script type="text/javascript" src="${ASSETS}/script/chartjs-plugin-datalabels.min.js"></script>
    </head>
<body>
<div id="container">
    <div id="solving">
        <section class="solving-wrap" id="resultseestudent">
            <h1 class="title" style="margin: 0px">
                <span class="col-orange02">[초등 4 수학]</span>
                여러 가지 삼각형–이등변 삼각형의 성질 탐구하기
            </h1><!--// 타이틀 영역 -->
            <div class="solving-layout">
                <div class="connect-area blar">
                    <div class="blar-user">
                        <span class="name">김상우</span>
                        <span class="img"><img src="${ASSETS}/img/common/img-user-picture.jpg" alt="" /></span>
                    </div><!--// 유저 -->
                    <div class="solving-blar">
                        <p class="txt-blar">모든 문제풀기를 완료하였습니다.</p>
                        <p class="txt-date">2019-10-07 11:08</p>
                        <div class="graph-wrap">
                            <div class="graph"><canvas id="percentCorrect" height="235"></canvas></div>
                            <span class="percent">{{items}}/{{total}}</span>
                        </div>
                        <button class="btn-blar" @click="close()">나의 평가 목록으로</button>
                    </div><!--// 문제영역 -->
                </div>
            </div>
        </section>
        <!--// 시작하기 -->
    </div>
</div>
<script>
    let router = new VueRouter({
        mode: 'history',
        routes: []
    });
    let app =new Vue({
        el: '#resultseestudent',
        router,
       component:{
       
       } ,
        data:{
            examId: 0,
            userId: 0,
            score: '',
            items: 0,
            total: 0,
            isReEval: false,
        },
        mounted(){
            let parameters = this.$route.query
            console.log("here is  parameter :")
            console.log(parameters)
    
            if (typeof this.$route.query.examId != 'undefined') {
        
                let id = this.$route.query.examId;
                console.log("exam Id")
                console.log(id)
                this.totalScore(id)
            }
            else{
                alert("exam id undefined")
            }
        },
        created(){
        
        },
        methods:{
            close(){
                window.close()
            },
            async totalScore(examId) {
                try {
                    
                    var _this = this
    
                    // const userData = JSON.parse(localStorage.getItem('userData'));
                    // console.log("token::::")
                    // console.log(userData)
    
                    var loginId = '${sessionScope.loginId}';
                    
                    const headers = {
                        'Content-Type': 'application/json',
                    }
     
                    axios.get('${BASEURL}/exam/showresult', {
                        params: {
                            examId: examId,
    
                            loginId : loginId
                        },
                        headers: headers
                    }).then (function (response) {
                        // const response = await services.totalScore({examId: this.examId, userId: this.userId});
                        console.log("response is here");
                        console.log(response.data);
    
                        _this.items = response.data.result.userData.totalscore
                        _this.total = response.data.result.mainData,
                        _this.isReEval = response.data.result.isReEval
                        // this.score = (this.items/this.total)*100
                    },function (error){
                        console.log("axios error found")
                        console.log(error);
                    });
            
                    // this.planetChartData.data.datasets[0].data = [this.total-this.items,  this.items]
                    // this.createChart('planet-chart', this.planetChartData);
                } catch (error) {
                    console.log("hheeell");
            
                    console.log(error);
                }
            },
            // createChart(chartId, chartData) {
            //     const ctx = document.getElementById(chartId);
            //     const myChart = new Chart(ctx, {
            //         type: chartData.type,
            //         data: chartData.data,
            //         options: chartData.options,
            //     });
            // }
        }
    });
</script>
<%--<script type="text/javascript">--%>
<%--    var correctgraph = document.getElementById("percentCorrect");--%>
<%--    var corrsetplugin = {--%>
<%--        beforeDraw: function (chart) {--%>
<%--            var meta = chart.getDatasetMeta(0).data[1]._model;--%>
<%--            meta.outerRadius = 110;--%>
<%--        },--%>
<%--    };--%>
<%--    var setPercentCorrect = new Chart(correctgraph, {--%>
<%--        type: 'doughnut',--%>
<%--        plugins: corrsetplugin,--%>
<%--        data: {--%>
<%--            labels: ['오답', '정답'],--%>
<%--            datasets: [{--%>
<%--                data: [44, 66],--%>
<%--                borderWidth: 0,--%>
<%--                backgroundColor: ["#e3e3e3", "#fcae40"],--%>
<%--                hoverBackgroundColor: ["#e3e3e3", "#fca03e"]--%>
<%--            }]--%>
<%--        },--%>
<%--        options: {--%>
<%--            layout: {--%>
<%--                padding: 20--%>
<%--            },--%>
<%--            legend: false,--%>
<%--            tooltips: false,--%>
<%--            responsive: true,--%>
<%--            maintainAspectRatio: false,--%>
<%--            cutoutPercentage: 57,--%>
<%--            rotation: Math.PI + 0.3,--%>
<%--            plugins: {--%>
<%--                datalabels: {--%>
<%--                    color: ['transparent', "transparent"],--%>
<%--                    font: {--%>
<%--                        weight: 'bold',--%>
<%--                        size: 20,--%>
<%--                        family: 'Noto Sans'--%>
<%--                    },--%>
<%--                    formatter: function(value, context) {--%>
<%--                        return value + '%';--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
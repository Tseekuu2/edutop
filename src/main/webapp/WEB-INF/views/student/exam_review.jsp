<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title >Exam question check</title>
<%--    <link rel="stylesheet" type="text/css" href="${ASSETS}/css/examCheck.css">--%>
    <link rel="stylesheet" type="text/css" href="${ASSETS}/css/exam_review.css">
</head>
<body>
<div id="solving">
    <section class="solving-wrap" id="examreviewsee">
        <h1 class="title" style="margin: 0px">
            <span class="col-orange02">[초등 4 수학]</span>
            여러 가지 삼각형–이등변 삼각형의 성질 탐구하기
        </h1><!--// 타이틀 영역 -->
        <div class="solving-layout" v-if="isPopup == false">
            <div class="explain-wrap">
                <div class="explain-area left w358">
                    <div class="top-area">
                    </div>
                    <div class="class-area">
                        <div class="">
                            <p class="txt-type01 mgt20">
                                1. 각도를 구하시오.
                                <span class="right-wrong"><img src="${ASSETS}/img/viewer/icon-o-big.png" alt=""></span>
                            </p>
                            <div class="question-area mgb0">
                                <div><img src="${ASSETS}/img/viewer/img-sample.jpg" /><p class="tal col-darkgray mgt10 mgl25">각도의 단위는 10도씩 표기되어 있다. 이러 저러한 부분을 계산하여 파란색으로 표기하였다.</p></div><!--// 예시 -->
                            </div>
                        </div>
                        <div class="answers-exp small">
                            <h2 class="title none mgb0">90도</h2>
                        </div>
                        <div class="answers-exp">
                            <h2 class="title none">
                                <span class="col-orange02">[정답]</span>90도
                            </h2>
                            <p class="txt-exp">[해설]</p>
                            <p class="txt-subject">0부터 10도씩 90도까지 파란색선으로 표기하였고 직각은 90도 입니다.</p>
                        </div>
                    </div>
                </div><!--// 문제 -->
                <div class="explain-area right w350 mobile-blind"><!-- 2020-03-02 -->
                    <a href="#" class="ex-listTab nth-4 on">전체문제</a><!-- 2020-03-02 -->
                    <div class="list-area on">
                        <div class="popup-scroll height-type01 mgt15">
                            <ul class="list-basic">
                                <li class="like">
                                    <span class="num-default">1</span>
                                    <span class="num-default">90º</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-x.png" alt="" /></span>
                                </li>
                                <li class="like none">
                                    <span class="num-default">3</span>
                                    <span class="number-txt">4</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-o.png" alt="" /></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a href="#" class="ex-listTab nth-1">틀린문제</a><!-- 2020-03-02 -->
                    <div class="list-area">
                        <div class="popup-scroll height-type01 mgt15">
                            <ul class="list-basic">
                                <li class="like">
                                    <span class="num-default">1</span>
                                    <span class="num-default">90º</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-x.png" alt="" /></span>
                                </li>
                                <li class="like this">
                                    <span class="num-default">2</span>
                                    <span class="number-txt">2</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-x.png" alt="" /></span>
                                </li>
                                <li class="like none">
                                    <span class="num-default">3</span>
                                    <span class="number-txt">4</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-o.png" alt="" /></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a href="#" class="ex-listTab nth-2">맞은문제</a>
                    <div class="list-area">
                        <div class="popup-scroll height-type03 mgt15">
                            <ul class="list-basic">
                                <li>
                                    <span class="num-default">1</span>
                                    <span class="num-default">90º</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-x.png" alt="" /></span>
                                </li>
                                <li>
                                    <span class="num-default">2</span>
                                    <span class="number-txt">1</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-x.png" alt="" /></span>
                                </li>
                                <li>
                                    <span class="num-default">3</span>
                                    <span class="number-txt">1</span>
                                    <span class="ftr"><img src="${ASSETS}/img/viewer/icon-x.png" alt="" /></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a href="#" class="ex-listTab nth-3">찜한문제</a>
                    <div class="list-area">
                        <!-- 2020-03-02 -->
                        <div class="popup-scroll height-type01 mgt15">
                            <ul class="list-basic">
                                <li class="like">
                                    <span class="num-default">1</span>
                                    <span class="num-default">90º</span>
                                </li>
                                <li class="like this">
                                    <span class="num-default">2</span>
                                    <span class="number-txt">2</span>
                                </li>
                                <li class="like none">
                                    <span class="num-default">3</span>
                                    <span class="number-txt">4</span>
                                </li>
                            </ul>
                        </div>
                        <!-- //2020-03-02 -->
                    </div>
                </div><!--// 목록 -->
            </div>
            
            <div class="next-area of-hd mgt15">
                <div class="solving-nav tac">
                    <button class="prev mobile-view">이전문제</button>
                    <button class="qs-list n_ty02" >문항목록</button>
                    <button class="clip mobile-view none">찜하기</button>
                    <button class="pen_n mobile-blind">펜쓰기</button>
                    <button class="memo popup-open mobile-view">메모</button>
                    <button class="next mobile-view">다음문제</button>
                </div>
            </div>
        </div>
        <div id="mobileSolving" v-else>
            <section class="solving-wrap">
                <h1 class="title" style="margin:0px">
                    <span class="col-orange02">[초등 4 수학]</span>
                    여러 가지 삼각형–이등변 삼각형의 성질 탐구하기
                </h1>
                <div class="solving-layout">
                    <div class="explain-wrap">
                        <div class="explain-area left">
                            <div class="top-area" style="overflow:visible;">
                                <p class="take ftl">
                                    전체문제 : <em>10</em>
                                </p>
                            </div>
                        </div>
                        <div class="explain-area right">
                            <a href="#" class="ex-listTab nth-4 on">전체문제</a>
                            <div class="list-area on">
                                <div class="popup-scroll height-type01 mgt15">
                                    <ul class="list-basic mob">
                                        <li class="solved_n">
                                            <a href="#" class="num-default">4</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <a href="#" class="ex-listTab nth-1">틀린문제</a> 
                            <div class="list-area">
                                <div class="popup-scroll height-type01 mgt15">
                                    <ul class="list-basic mob">
                                        <li class="solved_n">
                                            <a href="#" class="num-default">4</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <a href="#" class="ex-listTab nth-2">맞은문제</a>
                            <div class="list-area">
                                <div class="popup-scroll height-type03 mgt15">
                                    <ul class="list-basic mob">
                                        <li class="solved_n">
                                            <a href="#" class="num-default">4</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <a href="#" class="ex-listTab nth-3">찜한문제</a>
                            <div class="list-area">
                                <div class="popup-scroll height-type01 mgt15">
                                    <ul class="list-basic mob">
                                        <li class="solved_n">
                                            <a href="#" class="num-default">4</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                
                   
                    <div class="next-area mgt15">
                        <div class="solving-nav tac mobile-view" style="overflow:visible;">
                            <button class="mobile-view btn_view_end">학습 종료</button>
                        </div>
                    </div>
                </div>
            </section> 
        </div>
<%--        <script>--%>
<%--            $(".clip").click(function(){--%>
<%--                $(this).toggleClass('none');--%>
<%--            });--%>
<%--        </script>--%>
        
    </section>
    <script type="module">
        import MathLive from '${ASSETS}/script/mathlive/dist/src/mathlive.js';
        import Mathfield from '${ASSETS}/script/mathlive/dist/vue-mathlive.js';
        
        Vue.use(Mathfield, MathLive);
        
        let router = new VueRouter({
            mode: 'history',
            routes: []
        });
        let app = new Vue({
            el: "#examreviewsee",
            router,
            components:{
            },
            data:{
                formula: 'x=-b\\pm \\frac {\\sqrt{b^2-4ac}}{2a}',
                keystroke: '',
                currentQuestion: 0,
                questions: [],
                isPopup : false,
                empty: '',
                imgPath: '',
                userId: 0,
            },
            mounted(){
                // let parameters = this.$route.query
                // console.log("here is  parameter :")
                // console.log(parameters)
                //
                // if (typeof this.$route.query.examId != 'undefined') {
                //     let userId = this.$route.query.userId;
                //     this.userId = userId
                //     console.log("userId Id")
                //     console.log(userId)
                //
                //     let id = this.$route.query.examId;
                //     console.log("exam Id")
                //     console.log(id)
                //     this.getQuestions(id)
                // }
                // else{
                //     alert("exam id undefined")
                // }
            },
            created(){
                // this.imgPath = window.location.protocol +'//'+ window.location.hostname+':80'+'/webapps/uploadingDir/'
                this.imgPath = 'http://103.41.247.45:80/webapps/uploadingDir'
                // console.log("here is Userid : " +this.userId);
            },
            methods:{
                webIndex(item){
                    this.currentQuestion = item
                },
                chooseQuestion(index){
                    this.isPopup = false
                    this.currentQuestion = index
                },
                closeWindow(){
                    window.close()
                },
                nextQuestion(){
                    this.currentQuestion++
                    this.empty= ''
                    if (this.currentQuestion > this.questions.length-1) {
                        window.close()
                    }
                },
                prevQuestion(){
                    if (this.currentQuestion > 0) {
                        this.currentQuestion--
                        this.empty= ''
                    }
                    else{
                        alert("1번 문제입니다. 이전 문제가 없습니다.")
                    }
                },
                async getQuestions(examId){
                    try {
                        var loginId = '${sessionScope.loginId}';
                        
                        const headers = {
                            'Content-Type': 'application/json'
                        }
                        
                        // $.blockUI({message: '<span> Loading...</span>'});
                        
                        // var _$ = $
                        // var _this = this
                        
                        axios.get('${BASEURL}/exam/result/student/',{
                            params: {
                                examId: examId,
                                loginId: loginId
                            },
                            headers: headers
                        }).then ((response)=> {
                            console.log("questions heelel")
                            
                            console.log(response.data.result.data);
                            
                            if (response.data.success) {
                                for (let q = 0; q < response.data.result.data.length; q++) {
                                    let question = response.data.result.data[q];
                                    question.like = 0
                                    question.memo = ''
                                    question.paint = ''
                                    question.answerFlag = false
                                    question.answerInputedData = ''
                                    for (let a = 0; a < question.answers.length; a++) {
                                        let answer = question.answers[a];
                                        answer.selectedAnswer = false
                                        question.like = question.resultData.like
                                        question.memo = question.resultData.memo
                                        question.paint =  question.resultData.paint
                                        for (let d = 0; d < question.resultData.details.length; d++) {
                                            let j = question.resultData.details[d];
                                            if (question.questionType == '1' || question.questionType == '3') {
                                                if (answer.id == j.answerId) {
                                                    answer.selectedAnswer = true
                                                    if (answer.answerFlag == 'true' && answer.selectedAnswer == true) {
                                                        question.answerFlag = true
                                                    }
                                                }
                                            }
                                            if (question.questionType == '2') {
                                                question.answerInputedData = j.answerInputedData
                                                if (answer.trueData == question.answerInputedData) {
                                                    question.answerFlag = true
                                                }
                                            }
                                            // if (question.questionType == '4') {
                                            //     question.answerInputedData = j.answerInputedData
                                            //     if (question.resultData.score == '1') {
                                            //         question.answers[0].selectedAnswer = true
                                            //         question.answerFlag = true
                                            //     }
                                            //     else{
                                            //         question.answers[0].selectedAnswer = false
                                            //     }
                                            // }
                                        }
                                        
                                        // if (question.questionType == '4') {
                                        //     for (let a = 0; a < 1; a++) {
                                        //         let item = question.answers[a];
                                        //             if (question.questionType == '4') {
                                        //                 item.width = '100%'
                                        //                 item.height = '100%'
                                        
                                        //                 let img = new Image();
                                        
                                        //                 img.src = question.answers[0].drawingData
                                        
                                        //                 img.onload = () => {
                                        //                     item.width = img.width + ""
                                        //                     item.height = img.height + ""
                                        //                 }
                                        //             }
                                        //         }
                                        // }
                                    }
                                }
                            }
                            
                            this.questions = response.data.result.data
                            if (response.data.success == true) {
                                console.log("nice")
                                <%--if (this.questions[this.currentQuestion].questionType === '4') {--%>
                                <%--    console.log("heeeloo qdata");--%>
                                
                                <%--    for (let i = 0; i < this.questions.length; i++) {--%>
                                <%--        const question = this.questions[i];--%>
                                <%--        this.$nextTick(() => {--%>
                                <%--            let img = new Image();--%>
                                <%--            img.src = question.answers[0].drawingData--%>
                                <%--            img.onload = () => {--%>
                                <%--                // this.$refs.canvas.width = img.width+""--%>
                                <%--                // this.$refs.canvas.height = img.height+""--%>
                                <%--                &lt;%&ndash;// console.log(`the image dimensions are ${img.width}x${img.height} ${question.id}`);&ndash;%&gt;--%>
                                
                                <%--            }--%>
                                <%--            // canvas.fromDataURL(this.questions[i].Answers[0].drawingData)--%>
                                <%--        });--%>
                                <%--    }--%>
                                
                                <%--    //    this.$refs.qcanvas[0].lockSignaturePad()--%>
                                <%--    // this.$nextTick(() => {--%>
                                <%--    //     this.$refs.qcanvas[0].fromDataURL(this.questions[this.currentQuestion].answerInputedData)--%>
                                <%--    // });--%>
                                
                                <%--    console.log("canvas");--%>
                                <%--    // console.log(this.questions[this.currentQuestion].answerInputedData);--%>
                                
                                <%--    console.log(this.$refs);--%>
                                <%--    console.log("endcanvas");--%>
                                
                                <%--}--%>
                            }
                            this.currentQuestion++;
                            
                            setTimeout(() => {
                                this.prevQuestion()
                            }, 50)
                            // if (response.data.success) {
                            //     for (let i = 0; i < response.data.result.ResultDetails.length; i++) {
                            //         let answers = response.data.result.ResultDetails[i];
                            //         for (let ans = 0; ans < this.questions[this.currentQuestion].Answers.length; ans++) {
                            //             let qAns = this.questions[this.currentQuestion].Answers[ans];
                            //             if (answers.AnswerId == qAns.id) {
                            //                 qAns.selectedAnswer = true
                            //             }
                            //         }
                            //     }
                            
                            //     for (let i = 0; i < this.questions.length; i++) {
                            //         let qq = this.questions[i];
                            //         for (let aa = 0; aa < qq.Answers.length; aa++) {
                            //             let an = qq.Answers[aa];
                            //             if(an.answerFlag == true && an.selectedAnswer == true){
                            //                 qq.answerFlag = true
                            //             }
                            //         }
                            //         for (let aa = 0; aa < qq.Results.length; aa++) {
                            //             let an = qq.Results[aa];
                            //             qq.memo = an.memo
                            //             qq.like = an.like
                            //         }
                            // }
                            // }
                        },function (error){
                            console.log("axios error found")
                            console.log(error);
                            _$.unblockUI
                        });
                        
                        
                    } catch (error) {
                        console.log(error)
                    }
                },
                sayIt: function (event) {
                    this.$refs['mathfield'].$el.mathfield.$perform([
                        'speak',
                        'all',
                    ]);
                },
                setIt: function (event) {
                    this.formula = 'x=-b\\pm \\frac {\\sqrt{b^2-4ac}}{2a}';
                },
                ping: function () {
                    console.log('ping');
                },
                displayKeystroke: function (keystroke, _ev) {
                    this.keystroke = keystroke;
                    return true;
                },
                asSpokenText: function () {
                    return (
                            (this.$refs['mathfield'] &&
                                    this.$refs['mathfield'].$el.mathfield &&
                                    this.$refs['mathfield'].$el.mathfield.$text(
                                            'spoken'
                                    )) ||
                            ''
                    );
                },
            }
        })
    </script>
</div>

</body>

</html>
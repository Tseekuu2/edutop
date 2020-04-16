<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>에듀포탈</title>
</head>

    <body>
<%--     id="totalresult"--%>
        <div id="container">
            <section class="popup-dim url-popup" >
                <div class="popup-layout">
                    <a href="#" class="popup-close"><img src="${IMG}/img/common/icon-popup-close.jpg" alt="닫기" /></a>
                    <p class="pop-title">평가 URL 복사</p>
                    <div class="url-popup-wrap">
                        <input type="text" class="url-input" id="clipInput" value="https://www.url.co.kr/test/test.jsp?cont_id=21335334244" />
                        <button class="btn-black" onclick="copy_to_clipboard()">복사</button>
                    </div>
                </div>
            </section><!--// URL 복사 팝업 -->
            
            <section class="popup-dim appraisal-popup" style="display:block; overflow: auto;">
                <div class="popup-layout" style="top:0; left:0; margin-left:0px; width:100%; border-radius:0;">
                    <div class="appraisal-popup-wrap">
                        <span class="app-open app-open01 on">전체 평가 보기</span>
                        <span class="app-open app-open02">문항별 평가 보기</span>
                        <div class="menu-tab">
                            <p class="title line mgb20">
        <%--                        <b class="col-orange02">[초등4 수학]</b> 여러 가지 삼각형–이등변 삼각형의 성질 탐구하기--%>
                                {{examInfo.createdAt}} {{examInfo.kurs}}
                                {{examInfo.examType}} {{examInfo.examName}}
                            </p>
                            <p class="title mgb5">
        <%--                        전체 <b class="col-orange02">1,234</b> 문제--%>
                            </p>
                                <table class="table-style2 mgb20">
                                <colgroup>
                                    <col width="33.3333%" />
                                    <col width="33.3333%" />
                                    <col width="33.3333%" />
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>대상</th>
                                    <th>응시</th>
                                    <th>결시</th>
                                    <th>응답율</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>{{examineeCount}}명</td>
                                    <td>{{totalGivin}}명</td>
                                    <td>{{totalRemain}}명</td>
                                    <td>{{totalPercent.toFixed(1)}}%</td>
                                </tr>
                                </tbody>
                            </table>
                                <table class="table-style mgb20">
                                    <colgroup>
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>최고점수</th>
                                        <th>최저점수</th>
                                        <th>평균점수</th>
                                        <th>평균 풀이시간(분/초) </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>{{averageScore}}</td>
                                        <td>{{scoreMax}}</td>
                                        <td>{{scoreMin}}</td>
                                        <td>{{averageTime}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            <%--                    <div class="tab-wrap tab-dep01 on">--%>
                                <table class="table-style2 last boNone">
                                    <colgroup>
                                        <col width="33.3333%" />
                                        <col width="33.3333%" />
                                        <col width="33.3333%" />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th><button class="btn-sort">번호</button></th>
                                        <th><button class="btn-sort">이름</button></th>
                                        <th><button class="btn-sort">점수</button></th>
                                    </tr>
                                    </thead>
                                </table>
        <%--                        <div class="popup-scroll">--%>
        <%--                            <table class="table-style2 last">--%>
        <%--                                <colgroup>--%>
        <%--                                    <col width="33.3333%" />--%>
        <%--                                    <col width="33.3333%" />--%>
        <%--                                    <col width="33.3333%" />--%>
        <%--                                </colgroup>--%>
        <%--                                <tbody>--%>
        <%--                                <tr>--%>
        <%--                                    <td>12</td>--%>
        <%--                                    <td><a href="#" class="student-popOpen">홍길동</a></td>--%>
        <%--                                    <td>-</td>--%>
        <%--                                </tr>--%>
        <%--                                <tr>--%>
        <%--                                    <td>11</td>--%>
        <%--                                    <td><a href="#" class="student-popOpen">홍길동</a></td>--%>
        <%--                                    <td>50</td>--%>
        <%--                                </tr>--%>
        <%--                                <tr>--%>
        <%--                                    <td>10</td>--%>
        <%--                                    <td><a href="#" class="student-popOpen">홍길동</a></td>--%>
        <%--                                    <td>-</td>--%>
        <%--                                </tr>--%>
        <%--                                <tr>--%>
        <%--                                    <td>9</td>--%>
        <%--                                    <td><a href="#" class="student-popOpen">홍길동</a></td>--%>
        <%--                                    <td>50</td>--%>
        <%--                                </tr>--%>
        <%--                                <tr>--%>
        <%--                                    <td>8</td>--%>
        <%--                                    <td><a href="#" class="student-popOpen">홍길동</a></td>--%>
        <%--                                    <td>-</td>--%>
        <%--                                </tr>--%>
        <%--                                <tr>--%>
        <%--                                    <td>7</td>--%>
        <%--                                    <td><a href="#" class="student-popOpen">홍길동</a></td>--%>
        <%--                                    <td>50</td>--%>
        <%--                                </tr>--%>
        <%--                                <tr>--%>
        <%--                                    <td>6</td>--%>
        <%--                                    <td><a href="#" class="student-popOpen">홍길동</a></td>--%>
        <%--                                    <td>50</td>--%>
        <%--                                </tr>--%>
        <%--                                </tbody>--%>
        <%--                            </table>--%>
                            <p class="title mgb5 uk-text-left">응시 학생 리스트</p>
                            <div class="tab-wrap tab-dep01 on">
                                <table class="table-style mgb20">
                                    <colgroup>
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>맞춘 개수</th>
                                        <th>풀이시간</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(uu, index) in userDetails" :key="index">
                                        <td>{{index+1}}</td>
                                        <td><a class="student-popOpen" href="#studentPop" uk-toggle
                                               @click="studentDetail(uu.examData.ExamId,uu.examData.UserId ,uu.email, uu.examData.studentTime)">{{uu.email}}</a></td>
                                        <td v-if="uu.examData == null">_</td>
                                        <td v-else>{{uu.examData.totalScore}}/{{questionCount}}</td>
                                        <td v-if="uu.examData == null">_</td>
                                        <td class="" v-else>{{uu.examData.studentTime}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                                </div>
                            </div>
                            <div class="tab-wrap tab-dep02">
                                <table class="table-style mgb20">
                                    <colgroup>
                                        <col width="33.3333%" />
                                        <col width="33.3333%" />
                                        <col width="33.3333%" />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>난이도</th>
                                        <th>변별도</th>
                                        <th>평균 풀이시간</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table class="table-style2 last boNone">
                                    <colgroup>
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>응답</th>
                                        <th>정답여부</th>
                                    </tr>
                                    </thead>
                                </table>
                                <div class="popup-scroll">
                                    <table class="table-style2 last">
                                        <colgroup>
                                            <col width="25%" />
                                            <col width="25%" />
                                            <col width="25%" />
                                            <col width="25%" />
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <td>12</td>
                                            <td><a href="#" class="student-popOpen">홍길동</a></td>
                                            <td>3</td>
                                            <td>O</td>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td><a href="#" class="student-popOpen">홍길동</a></td>
                                            <td>3</td>
                                            <td>X</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    <div class="dsp-b mgt15 tac">
                        <button class="btn-orange popup-close" @click="close">닫기</button>
                    </div>
    
                    <div id="studentPop" uk-modal>
                        <div class="uk-modal-dialog">
                            <button class="uk-modal-close-default" type="button" uk-close></button>
                            <div class="uk-modal-header">
                                <h2 class="uk-modal-title uk-text-center">평가 결과 보기 </h2>
                            </div>
                            <div class="uk-modal-body uk-padding-small uk-padding-remove-bottom">
                                <p class="title line mgb20">
                                    2020-01-01  I 초 3 I  수학 I 삼각형의 성질 탐구하기
                                </p>
                                <table class="table-style2 mgb20">
                                    <colgroup>
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                        <col width="25%" />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>응시학생</th>
                                        <th>응시여부</th>
                                        <th>맞은 개수</th>
                                        <th>풀이 시간</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>{{name}}</td>
                                        <td>응시</td>
                                        <td v-if="examType == true">{{trueScoreType}}/{{this.questionsResult.length}}</td>
                                        <td v-else>{{trueScore}}/{{this.questionsResult.length}}</td>
                                        <td>{{totalQuestiontime}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                
                                <div class="tab-wrap tab-dep01 on">
                                    <table class="table-style mgb20">
                                        <colgroup>
                                            <col width="25%" />
                                            <col width="25%" />
                                            <col width="15%" />
                                            <col width="15%" />
                                            <col width="20%" />
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>문제번호</th>
                                            <th>정답 여부</th>
                                            <th>정답</th>
                                            <th>응답</th>
                                            <th>문제별 풀이시간</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="(uu, index) in questionsResult" :key="index">
                                            <td>{{index+1}}</td>
                                            <td v-if="uu.qAnswerGiveType == 2">
                                                <span class="" v-for="(answer,ansInd) in uu.Answers" :key="ansInd">
                                                    <span class="" v-for="(ans,hehe) in uu.Results" :key="hehe">
                                                        <span class="" v-for="t in ans.ResultDetails" :key="t.id">
                                                           <p class="" v-if="t.answerInputedData == answer.answerTrueData">
                                                                O
                                                            </p>
                                                            <p class="" v-else>X</p>
                                                        </span>
                                                    </span>
                                                    
                                                </span>
                                            </td>
                                            <td v-else>
                                                <span class="" v-for="(ans,ansInd) in uu.Answers" :key="ansInd">
                                                    <p class="" v-if="ans.answerFlag == true && true == ans.trueAfalse">
                                                        O
                                                    </p>
                                                    <p class="" v-if="ans.answerFlag == true && false == ans.trueAfalse">X</p>
                                                </span>
                                            </td>
                                            <td v-if="uu.qAnswerGiveType == 2">
                                                <span class="" v-for="(ans,ansInd) in uu.Answers" :key="ansInd">
                                                        {{ans.answerTrueData}}
                                                </span>
                                            </td>
                                            <td class="" v-else>
                                                <span class="" v-for="(ans,ansInd) in uu.Answers" :key="ansInd">
                                                    <p class="" v-if="ans.answerFlag == true">
                                                        {{ans.number}}
                                                    </p>
                                                </span>
                                            </td>
                                            <td v-if="uu.qAnswerGiveType == 2">
                                                <span class="" v-for="(ans,ansInd) in uu.Results" :key="ansInd">
                                                    <p class="" v-for="t in ans.ResultDetails" :key="t.id">
                                                        {{t.answerInputedData}}
                                                    </p>
                                                </span>
                                            </td>
                                            <td v-else>
                                                <span class="" v-for="(ans,ansInd) in uu.Answers" :key="ansInd">
                                                    <p class="" v-if="ans.trueAfalse == true">
                                                        {{ans.number}}
                                                    </p>
                                                </span>
                                            </td>
                                            <td>
                                                 <span class="" v-for="(ans,ansInd) in uu.Results" :key="ansInd">
                                                    {{ans.time}}
                                                </span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="dsp-b mgt15 tac ">
                                <button class="btn-orange popup-close uk-margin-bottom uk-modal-close">
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </section>
        </div>
    <script>
        let router = new VueRouter({
            mode: 'history',
            routes: []
        });
        let app = new Vue({
            el: '#container',
            router,
            components:{
            
            },
            data:{
                examId: 0,
                userDetails: [],
                searchText: 'student',
                questionsResult: [],
                examType: false,
                name: '',
                detailsAnswerId: 0,
                answerInputedData: 0,
                examineeCount:0,
                trueScore: 0,
                trueScoreType: 0,
                totalGivin: 0,
                totalRemain: 0,
                totalPercent: 0,
                averageScore:0,
                scoreMax: 0,
                scoreMin: 0,
                averageTime: 0,
                examInfo: '',
                totalQuestiontime: 0,
                time:0,
                isRunning: false,
                interval: null,
                hours: 0,
                minutes: 0,
                seconds: 0,
                questionCount: 0,
            },
            computed:{
            
            },
            mounted(){
    
                let parameters = this.$route.query
                console.log("here is  parameter :")
                console.log(parameters)
    
                if (typeof this.$route.query.examId != 'undefined') {
    
                    let userId = this.$route.query.userId;
                    this.userId = userId
                    console.log("userId Id")
                    console.log(userId)
                    
                    let id = this.$route.query.examId;
                    
                    console.log("exam Id")
                    console.log(id)
                    this.studentsExamResult(id)
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
                async studentsExamResult(item){
                    try {
                        var loginId = '${sessionScope.loginId}';
                        
                        const headers = {
                            'Content-Type': 'application/json',
                        }
                        axios.get('${BASEURL}/kexam/studentsdata', {
                            params: {
                                examId: item,
                                loginId: loginId
                            },
                            headers: headers,
                            
                        }).then ((response)=> {
                            console.log(response.data);
    
                            this.userDetails = response.data.users
                            this.questionCount = response.data.questionCount
                            this.examInfo = response.data.examinfo
                            this.examineeCount = response.data.users.length
    
                            for (let i = 0; i < response.data.users.length; i++) {
                                let item = response.data.users[i];
                                if (item.examData != null) {
                                    
                                    let score = parseInt(item.examData.totalScore)
                                    this.totalGivin++
                                    this.averageScore += parseInt(item.examData.totalScore)
            
                                    if (item.examData.totalTime != null) {
                                        this.averageTime += parseInt(item.examData.totalTime)
                                    }
                                    if (score > this.scoreMax) {
                                        this.scoreMax = score
                                    }
                                    if (score < this.scoreMin) {
                                        this.scoreMin = score
                                    }
                                    let time = item.examData.totalTime
            
                                    time = parseInt(time);
                                    let hours = Math.floor(time / 3600);
                                    time %= 3600;
                                    let minutes = Math.floor(time / 60);
                                    let seconds = time % 60;
                                    item.examData.studentTime = hours + ":" + minutes + ":" + seconds
            
                                } else {
                                    this.totalRemain++
                                }
        
                            }
                            this.averageScore = this.averageScore / this.totalGivin
                            this.averageTime = this.averageTime / this.totalGivin
    
                            this.averageTime = parseInt(this.averageTime);
                            let ahours = Math.floor(this.averageTime / 3600);
                            this.averageTime %= 3600;
                            let aminutes = Math.floor(this.averageTime / 60);
                            let aseconds = this.averageTime % 60;
                            this.averageTime = ahours + ":" + aminutes + ":" + aseconds
    
                            this.totalPercent = this.totalGivin / this.examineeCount * 100
                        },(error)=> {
                            console.log("axios error found")
                            console.log(error);
                        });
            
                    } catch (error) {
                        console.log(error);
                    }
                },
    
                async studentDetail(id,userId, name, ssTime) {
                    try {
                        this.answerInputedData = 0
                        this.trueScoreType = 0
                        this.name = name
                        this.totalQuestiontime = ssTime
    
                        var loginId = '${sessionScope.loginId}';
                        
                        const headers = {
                            'Content-Type': 'application/json'
                        }
                        
                        axios.post('${BASEURL}/kexam/result/studentdetail',{
                        
                            examId: this.examId,
                            loginId : loginId
                            
                        },{headers: headers}).then((response)=>{
                            // const response = await services.studentDetails({examId: id, userId: userId});
    
                            this.questionsResult = response.data.result
                            console.log("hello");
                            console.log(this.questionsResult);
    
                            console.log(this.detailsAnswerId);
                            console.log(response.data.result)
    
                            for (let i = 0; i < response.data.result.length; i++) {
                                let q = response.data.result[i];
                                if (q.qAnswerGiveType == '2') {
                                    this.examType = true
                                    console.log(this.examType);
            
                                }
                                else{
                                    this.examType = false
                                }
                                for (let ra = 0; ra < q.Results.length; ra++) {
                                    let result = q.Results[ra];
            
                                    result.time = parseInt(result.time);
                                    let hours = Math.floor(result.time / 3600);
                                    result.time %= 3600;
                                    let minutes = Math.floor(result.time / 60);
                                    let seconds = result.time % 60;
                                    result.time  =  hours +":"+ minutes +":"+ seconds
            
                                    for (let j = 0; j < result.ResultDetails.length; j++) {
                                        let details = result.ResultDetails[j];
                                        this.detailsAnswerId = details.AnswerId
                                        this.answerInputedData = details.answerInputedData
                                    }
                                }
                                for (let ii = 0; ii < q.Answers.length; ii++) {
            
                                    let qa = q.Answers[ii];
                                    qa.trueAfalse = false
                                    if (qa.id == this.detailsAnswerId) {
                                        qa.trueAfalse = true
                                    }
                                    if (qa.trueAfalse == true && qa.answerFlag == true) {
                                        this.trueScore ++
                                    }
                                    if (this.answerInputedData == qa.answerTrueData) {
                                        this.trueScoreType++
                                    }
            
                                }
        
                            }
    
                        },(error)=> {
                            console.log("axios error found")
                            console.log(error);
                        });
                    } catch (error) {
                        console.log("error message");
                    }
                },
            }
        })
    </script>
    </body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Exam question check</title>
    <link rel="stylesheet" type="text/css" href="${ASSETS}/css/examCheck.css">

</head>
<body>
<div id="solving">
    <section class="solving-wrap" id="examquestiontest">
        <h1 class="title" style="margin: 0px">
            <span class="col-orange02">[초등 4 수학]</span>
            여러 가지 삼각형–이등변 삼각형의 성질 탐구하기
        </h1><!--// 타이틀 영역 -->
        <div class="solving-layout" v-if="isPopup == false">
            <div class="explain-wrap">
                <div class="explain-area left">
                    <div class="top-area" style="overflow:visible;"><!-- 2020-02-27 -->
                        <p class="take ftl" style="margin: 0px;">
                            전체문제 : <em>{{questions.length}}</em>
                        </p>
                    </div>
                    <div class="class-area popup-scroll " >
                        <!-- <span class="like-check">
							<input type="checkbox" name="likeCheck" id="likeCheck" value="">
							<label for="likeCheck"></label>
						</span> -->
                        <div class="pdl60" v-for="(item,examIndex) in questions" :key="examIndex"
                             v-show="currentQuestion === examIndex" :class="{'activeQuestion': currentQuestion === examIndex}">
                            <div class="uk-width-1-1 uk-margin-remove-left uk-padding-remove" uk-grid>
                                <span class="uk-margin-top uk-width-auto uk-padding-remove">{{examIndex+1}}. </span>
                                <p class="txt-type01 mgt20 uk-width-expand" style="width: 90% !important;"
                                   v-html="item.question">
                                </p>
                            </div>
                            <div class="question-area mgb0" v-if="item.datas.length > 0">
                                <template v-for="(apps, mindex) in item.datas">
                                    <div v-if="apps.media != null">
                                        <p v-if=" apps.media.mediaType == 'image' ">
                                            <img :src="'http://103.41.247.45:80/webapps/uploadingDir/examquestion/' + apps.media.fileName"
                                                 :alt="apps.media.fileName"  :key="mindex" style="width: auto"/>
                                        </p>
                                        <p v-else-if="apps.media.mediaType == 'math' ">
                                            <mathlive-mathfield
                                                    :id="'mf'+mindex"
                                                    :ref="'mathfield'+mindex"
                                                    @focus="ping"
                                                    :on-keystroke="displayKeystroke"
                                                    :config=" {smartMode:true, readOnly: true}"
                                                    v-model="apps.dataText"
                                                    style="font-size: 16px; font-weight: 400;" >
                                                {{apps.dataText}}
                                            </mathlive-mathfield>
<%--                                            {smartMode:true}, virtualKeyboardMode:'manual',--%>
                                        </p>
                                        <p v-else>
                                        
                                        </p>
                                    </div>
                                    <p v-else>
        
                                    </p>
    
                                </template>
                            </div>
                            <div class="uk-margin-large-top" v-else>
    
                            </div>
                            <div class="example-list"  v-if="item.questionType == '1'">
                                <div class="example-wrap" v-for="(aItem,index) in item.answers" :key="index"
                                     style="display: flex">
                                    <template v-if="item.answerType == 'math' " >
                                        <input type="button" name="numRadio" class="checkBtn uk-margin-remove"
                                               style="padding-left: 0px;  margin-right: 15px !important;"
                                               :value="aItem.optionNumber" :class="{'answerFlag': aItem.answerFlag}"/>
                                        <mathlive-mathfield
                                                :id="'mf'+index"
                                                :ref="'mathfield'+index"
                                                :config="{smartMode:true, readOnly: true}"
                                                @focus="ping"
                                                :on-keystroke="displayKeystroke"
                                                v-model="aItem.answer"
                                        >{{aItem.answer}}
                                        </mathlive-mathfield>
                                    </template>
                                    <span  v-else-if="item.answerType == 'image' " >
                                                <input type="button" name="numRadio" class="checkBtn uk-margin-remove"
                                                       style="padding-left: 0px;"
                                                       :value="aItem.optionNumber"   :class="{'answerFlag': aItem.answerFlag}"/>
                                                <img  :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.media.fileName"
                                                      :alt="aItem.media.fileName"  style="width: 300px !important;"
                                                      class="uk-margin-top uk-margin-left"/>
                                            </span>
                                    <div class="radio-numbers " v-else>
                                        <div class="uk-subnav" style="flex-wrap: unset; padding-left: 0px;">
                                            <input type="button" name="numRadio"
                                                   class="checkBtn" style="padding-left: 0px;"
                                                   :value="aItem.optionNumber"
                                                   :class="{'answerFlag': aItem.answerFlag}"/>
                                            <span class="answerMargin uk-margin-remove"  name="numRadio"
                                                  style="width: 90% !important;"
                                                  :class="{'answerTrue': aItem.answerFlag}"
                                                  v-html="aItem.answer"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="example-list"  v-else-if="item.questionType == '3'">
                                <div class="example-wrap" v-for="(aItem,index) in item.answers" :key="index" style="display: flex;">
                                    <template v-if="item.answerType == 'math' " >
                                        <input type="button" name="numRadio" class="checkBtn uk-margin-remove"
                                               style="padding-left: 0px; margin-right: 15px !important;"
                                               :value="aItem.optionNumber" :class="{'answerFlag': aItem.answerFlag}"/>
                                        <mathlive-mathfield
                                                :id="'mf'+index"
                                                :ref="'mathfield'+index"
                                                :config="{smartMode:true, readOnly: true}"
                                                @focus="ping"
                                                :on-keystroke="displayKeystroke"
                                                v-model="aItem.answer"
                                        >{{aItem.answer}}
                                        </mathlive-mathfield>
                                    </template>
                                    <span  v-else-if="item.answerType == 'image' " >
                                                <input type="button" name="numRadio" class="checkBtn uk-margin-remove"
                                                       style="padding-left: 0px;"
                                                       :value="aItem.optionNumber"   :class="{'answerFlag': aItem.answerFlag}"/>
                                                <img  :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.media.fileName"
                                                      :alt="aItem.media.fileName"  style="width: 300px !important;"
                                                      class="uk-margin-top uk-margin-left"/>
                                            </span>
                                    <div class="radio-numbers " v-else>
                                        <div class="uk-subnav" style="flex-wrap: unset; padding-left: 0px;">
                                            <input type="button" name="numRadio"
                                                   class="checkBtn" style="padding-left: 0px;"
                                                   :value="aItem.optionNumber"
                                                   :class="{'answerFlag': aItem.answerFlag}"/>
                                            <span class="answerMargin uk-margin-remove"  name="numRadio"
                                                  style="width: 90% !important;"
                                                  :class="{'answerTrue': aItem.answerFlag}"
                                                  v-html="aItem.answer"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div v-else-if="item.questionType == '4'" class="uk-margin-bottom">
                                <div class="uk-width-1-1" uk-grid v-for="(aItem,index) in item.answers" :key="index">
                                    <div class="uk-width-1-2 uk-text-center">
                                        <p class="" style="border: 1px solid #080808; padding: 8px;">
                                            정답지 - 펜을 눌러 쓰세요.</p>
                                        <img
                                                :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.drawingData"
                                                class="uk-flex uk-flex-center" style="width:100% !important;
                                                 margin: 0 !important"/>
                                    </div>
                                    <div class="uk-width-1-2 uk-text-center">
                                        <p class="" style="border: 1px solid #080808; padding: 8px;">
                                            채점지 – 정답을 보고 채점하세요.
                                        </p>
                                        <img
                                                :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/'+aItem.trueData"
                                                class="uk-flex uk-flex-center"
                                                style="width:100% !important; margin: 0 !important"/>
                                    </div>
                                </div>
                            </div>
                            <div class="answers-exp mgt60 uk-margin-large-bottom" v-else>
                                <div v-for="(aItem,index) in item.answers"  :key="index">
                                    <div v-if="aItem.answerFlag == 'math'">
                                        <div class="uk-flex uk-margin-bottom">
                                            <b>Guide text: </b>
                                            <p class="uk-margin-remove" style="padding-left: 15px;">
                                                {{aItem.answer}} </p>
                                        </div>
                                        <mathlive-mathfield
                                                :id="'mf'+index"
                                                :ref="'mathfield'+index"
                                                :config="{smartMode:true, virtualKeyboardMode:'manual'}"
                                                @focus="ping"
                                                :on-keystroke="displayKeystroke"
                                                v-model="aItem.trueData"
                                                style="border: 1px solid #ccc;padding: 10px;font-size: 17px;" >
                                            {{aItem.trueData}}
                                        </mathlive-mathfield>
                                    </div>
                                    <div v-if="aItem.answerFlag == true || aItem.answerFlag == 'text' ">
                                        <div class="uk-flex uk-margin-bottom">
                                            <b>Guide text: </b>
                                            <p class="uk-margin-remove" style="padding-left: 15px;">
                                                {{aItem.answer}} </p>
                                        </div>
                                        <div class="uk-flex uk-margin-bottom">
                                            <b>Answer true : </b>
                                            <p class="uk-margin-remove" style="padding-left: 15px;">
                                                {{aItem.trueData}} </p>
                                        </div>
                                        <input type="text" class="txt-input" placeholder="정답을 입력해 주세요"
                                               v-model="questions[currentQuestion].trueData"
                                               class="uk-width1-1" style="font-size: 16px; width: 100%;
													border: 1px solid #ccc;
													border-radius: 15px;
													padding: 8px;"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="no_scroll_n">
                            더 이상의 스크롤이 없습니다.
                        </div>
                    </div>
                </div><!--// 문제 -->
                <div class="explain-area right mobile-blind"><!-- 2020-02-27 -->
                    <a href="#" class="ex-listTab nth-3 on">전체문제</a>
                    <div class="list-area on">
                        <div class="popup-scroll height-type03 mgt15">
                            <ul class="list-basic uk-padding-remove">
                                <li v-for="(item,eindex) in questions" :key="eindex"
                                    @click="questionChange(eindex)"
                                    :class="{'changed': eindex == currentQuestion}">
                                    <span class="num-default uk-padding-remove" style="display: inline-block">{{eindex+1}}</span>
                                    <div uk-grid class="uk-margin-remove-left"  v-if="item.questionType == '4'"
                                         style="display:inline-block;">
                                        <p style="padding: 0" class="answer-text uk-margin-remove">그리기 문제</p>
                                    </div>
                                    <span class="answer-text uk-padding-remove"  v-else-if="item.questionType == '2'"
                                          style="position: absolute">
                                        <p style="padding-top: 4px">주관식 문제</p>
                                    </span>
                                    <label  class="" v-else v-for="(aitem,aindex) in item.answers" :key="aindex">
                                            <span class="number-txt" style="margin-right: 10px" :class="{'answerFlag': aitem.answerFlag}"
                                            >{{aindex+1}}</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!--// 목록 -->
            </div>
            
            <!-- 2020-02-27 -->
            <div class="next-area of-hd mgt15">
                <div class="solving-nav tac pc">
                    <button class="prev mobile-view" @click="prevQuestion">이전문제</button>
                    <button class="next mobile-view" @click="nextQuestion">다음문제</button>
                </div>
                <div class="solving-nav tac mob" style="text-align:center;">
                    <button class="prev mobile-view" style="margin-right:0;" @click="prevQuestion">이전문제</button>
                    <span style="display:inline-block; width:1px; height:14px; margin:8px 7px 0 6px; background:#d2d2d2; vertical-align:top;"></span>
                    <a  class="qs-list n_ty03" target="_blank" style="margin:0;"  @click="isPopup = !isPopup">
                        문제목록</a>
                    <span style="display:inline-block; width:1px; height:14px; margin:8px 7px 0 6px; background:#d2d2d2; vertical-align:top;"></span>
                    <a  @click="closeWindow"  class="qs-list n_ty03" target="_blank" style="margin:0;">
                        평가목록</a>
                    <span style="display:inline-block; width:1px; height:14px; margin:8px 7px 0 6px; background:#d2d2d2; vertical-align:top;"></span>
                    <button class="next mobile-view" style="margin-left:0;"  @click="nextQuestion">다음문제</button>
                </div>
            </div>
        </div>
        <div class="solving-layout" v-else>
            <div class="explain-wrap">
                <div class="explain-area left">
                    <div class="top-area" style="overflow:visible;">
                        <p class="take ftl" style="margin: 0px !important;">
                            전체문제 : <em>{{questions.length}}</em>
                        </p>
                    </div>
                </div><!--// 문제 -->
                <div class="explain-area right">
                    <a href="#" class="ex-listTab nth-3 on">전체문제</a>
                    <div class="list-area on">
                        <div class="popup-scroll height-type03 mgt15">
                            <!-- mob -->
                            <ul class="list-basic mob">
                                <li class="" v-for="(item,index) in questions" :key="index"
                                    @click="chooseQuestion(index)">
                                    <!-- <button class="uk-button uk-button-default"> 1 </button> -->
                                    <a href="#" class="num-default">{{index+1}}</a>
                                </li>
                            </ul>
                            <!-- mob -->
                        </div>
                    </div>
                </div><!--// 목록 -->
            </div>
        
            <!-- 2020-02-27 -->
            <div class="next-area mgt15">
                <div class="solving-nav tac mobile-view" style="overflow:visible;">
                    <button class="mobile-view btn_view_end" @click="closeWindow()">미리보기 종료</button>
                </div>
            </div><!--// 다음문제 영역 -->
            <!-- //2020-02-27 -->
        </div>
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
                    this.getQuestions(id)
                }
                else{
                    alert("exam id undefined")
                }
            },
            created(){
                // this.imgPath = window.location.protocol +'//'+ window.location.hostname+':80'+'/webapps/uploadingDir/'
                // this.imgPath = 'http://103.41.247.45:80/webapps/uploadingDir'
                // console.log("here is Userid : " +this.userId);
            },
            methods:{
                questionChange(item){
                    this.empty = ''
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
    
                        $.blockUI({message: '<span> Loading...</span>'});
                        
                        var _$ = $
                        var _this = this
    
                        axios.get('${BASEURL}/exam/questions', {
                            params: {
                                examId: examId,
                                loginId : loginId
                            },
                            headers: headers
                        }).then (function (response) {
                            _$.unblockUI()
                            for (let i = 0; i < response.data.result.questions.length; i++) {
                                let q = response.data.result.questions[i];
                                for (let j = 0; j < q.answers.length; j++) {
                                    let ans = q.answers[j];
                                    if (ans.answerFlag == 'false') {
                                        ans.answerFlag = false
                                    }
                                    else{
                                        ans.answerFlag = true
                                    }
                                }
                            }
                            if (response.data.status == 200) {
                                console.log("working ")
                                console.log(response.data.result)
                                _this.questions = response.data.result.questions
                                // localStorage.setItem('examQuestionData', JSON.stringify(response.data));
                                _$.unblockUI()
                            }
                            else{
                                alert("request failed")
                            }
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
        app.$mount('#examquestiontest')
    </script>
</div>

</body>

</html>
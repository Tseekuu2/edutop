<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/examCheck.css">

</head>

<body>
<section id="secondexam">
	<div id="solving">
		<section class="solving-wrap">
			<h1 class="title" style="margin: 0px;">
				<span class="col-orange02">[초등 4 수학]</span>
				여러 가지 삼각형–이등변 삼각형의 성질 탐구하기
			</h1><!--// 타이틀 영역 -->
			<div class="solving-layout">
				<div class="explain-wrap">
					<div class="explain-area left">
						<div class="top-area">
							<p class="timer ftl">{{leavedQuestion}}</p>
<%--							<div class="uk-flex uk-flex-left uk-subnav">--%>
<%--								<span class="uk-subnav col-darkgray">남은 문제 <p>6</p></span>--%>
<%--								<span class="uk-subnav uk-margin-left col-darkgray">전체 문제 <p>10</p></span>--%>
<%--							</div>--%>
							<p class="ftr pdt5 mgr10 font-size16" style="margin: 0px !important;" >
								<span class="col-darkgray mgr10 uk-padding-remove">남은 문제 : <b
										class="col-orange02">6</b></span>
								<span class="col-darkgray uk-padding-remove">전체 문제 :
									<b class="col-orange02">10</b></span>
							</p>
						</div>
						<div class="class-area popup-scroll">
<%--							<div class="pdl60" v-for="(item,examIndex) in questions" :key="examIndex"--%>
<%--								 v-show="currentQuestion === examIndex" :class="{'activeQuestion': currentQuestion === examIndex}">--%>
						<div class="pdl60" v-for="(item,index) in questions" :key="index"
							 v-show="currentQuestion === examIndex" :class="{'activeQuestion': currentQuestion === examIndex}">
							<p class="txt-type01 mgt20">
								<div>
									{{item+1}}
									<p>
										<span v-html="item.questions">
										</span>
									</p>
								</div>
							</p>
							<div class="view_wrap_n popup-scroll">
								<div class="bg_area02">
									<ul>
										<template v-for="(aItem, aIndex) in item.answers" :key="aIndex">
										<li class="ar_l">
											<div class="in_bx">
												<img
														:src="'http://asse.edunet.net/uploadingDir/examanswer/'+ aItem.drawingData"
														style="width:100% !important; margin: 0 !important"
														class="uk-flex uk-flex-center"
												/>
											</div>
											<p class="btm_Tx"><span class="tx_orange">[정답지]</span> 펜을 눌러 쓰세요.</p>
										</li>
										<li class="ar_r">
											<div class="in_bx">
												<img
														:src="'http://asse.edunet.net/uploadingDir/examanswer/'+ aItem.trueData"
														style="width:100% !important; margin: 0 !important"
														class="uk-flex uk-flex-center"
														/>
<%--												style="width:100% !important; margin: 0 !important"--%>
											</div>
											<p class="btm_Tx"><span class="tx_blue">[정답지]</span> 펜을 눌러 쓰세요.</p>
										</li>
										</template>
									</ul>
								</div>
							</div>
								<div class="view_bx_n ty_n02">
									<ul class="complete-wrap mgb50" >
										<li v-for="(aItem,aIndex) in answers" :key="aIndex">
											
											<div class="uk-subnav">
												<button class="checkBtn" @click="answerActive(aItem)"
														:class="{'checked': aItem.selectedAnswer}">{{aIndex+1
													}}</button>
												<span class="uk-padding-remove">{{aItem.answer}}</span>
											</div>
										
										</li>
									</ul>
								</div>
<%--&lt;%&ndash;									<div class="pe-wrap">&ndash;%&gt;--%>
<%--&lt;%&ndash;										<div class="pencil-eraser">&ndash;%&gt;--%>
<%--&lt;%&ndash;											<a href="#" class="dim"></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;											<a href="#" class="eraser"><img src="${ASSETS}/img/viewer/icon-eraser.jpg"></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;											<a href="#" class="pencil"><img src="${ASSETS}/img/viewer/icon-pencil.jpg"></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;										</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;										<a href="#" class="pe-openToggle"></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;									</div>&ndash;%&gt;--%>
<%--								</div>--%>
<%--								<div class="pencil-big">--%>
<%--									<a href="#" class="pe-close"><img src="${ASSETS}/img/viewer/icon-close.png" /></a>--%>
<%--									<button><img src="${ASSETS}/img/viewer/icon-pencil-big.png" /></button>--%>
<%--								</div>--%>
<%--								<div class="eraser-big">--%>
<%--									<a href="#" class="pe-close" style="top:-8px; right:-21px;"><img src="${ASSETS}/img/viewer/icon-close.png" /></a>--%>
<%--									<button><img src="${ASSETS}/img/viewer/icon-eraser-big.png" /></button>--%>
<%--								</div>--%>
<%--								<div class="answers-exp">--%>
<%--									<p class="txt-exp">[해설]</p>--%>
<%--									<p class="txt-subject">--%>
<%--										0부터 10도씩 90도까지 파란색선으로 표기하였고 직각은 90도 입니다.<br>--%>
<%--										한 바퀴는 360도 이므로, 90도 직각이 4번 돌려야 하고, 90도의 절반인 45도 씩을 돌리면<br>--%>
<%--										4*2 = 8번을 돌리면 한 바퀴가 됩니다.--%>
<%--									</p>--%>
<%--								</div> --%>
							</div>
						</div>
					</div>
					<div class="explain-area right mobile-blind">
						<a href="#" class="ex-listTab on">전체문제</a>
						<div class="list-area on">
							<div class="popup-scroll height-type01 mgt15">
								<ul class="list-basic uk-padding-remove">
<%--									<li v-for="(item,eindex) in questions" :key="eindex"--%>
<%--										@click="questionChange(eindex)"--%>
<%--										:class="{'changed': eindex == currentQuestion}">--%>
<%--										<span class="num-default uk-padding-remove" style="display: inline-block">{{eindex+1}}</span>--%>
<%--										<div uk-grid class="uk-margin-remove-left"  v-if="item.questionType == '4'"--%>
<%--											 style="display:inline-block;">--%>
<%--											<p style="padding: 0" class="answer-text uk-margin-remove"--%>
<%--											   v-html="item.question">{{item--%>
<%--												.question}}</p>--%>
<%--										</div> --%>
<%--                                    </span>--%>
<%--										<label  class="" v-else v-for="(aitem,aindex) in item.answers" :key="aindex">--%>
<%--                                            <span class="number-txt" style="margin-right: 10px" :class="{'answerFlag': aitem.answerFlag}"--%>
<%--											>{{aindex+1}}</span>--%>
<%--										</label>--%>
<%--									</li>--%>
								</ul>
<%--								<ul class="list-basic uk-padding-remove">--%>
<%--									<li class="like">--%>
<%--										<span class="num-default">1</span>--%>
<%--										<span class="num-default">90º</span>--%>
<%--										<span class="ftr"><img src="${ASSETS}/img/viewer/icon-x.png" alt="" /></span>--%>
<%--									</li>--%>
<%--								</ul>--%>
							</div>
						</div>
						<a href="#" class="ex-listTab nth-2">오답문제</a>
						<div class="list-area">
							<div class="popup-scroll height-type03 mgt15">
								<ul class="list-basic uk-padding-remove">
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
						<a href="#" class="ex-listTab nth-3">맞은문제</a>
						<div class="list-area">
							<div class="popup-scroll height-type03 mgt15">
								<ul class="list-basic uk-padding-remove">
									<li>
										<span class="num-default">1</span>
										<span class="num-default">90º</span>
										<span class="ftr"><img src="${ASSETS}/img/viewer/icon-o.png" alt="" /></span>
									</li>
									<li>
										<span class="num-default">2</span>
										<span class="number-txt">1</span>
										<span class="ftr"><img src="${ASSETS}/img/viewer/icon-o.png" alt="" /></span>
									</li>
									<li>
										<span class="num-default">3</span>
										<span class="number-txt">1</span>
										<span class="ftr"><img src="${ASSETS}/img/viewer/icon-o.png" alt="" /></span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="next-area of-hd mgt15">
					<div class="solving-nav tac">
<%--						<a href="./03-solving-mobile-02.html" class="qs-list" target="_blank">문항목록</a>--%>
						<button class="prev mobile-blind" @click="prevQuestion">이전문제</button>
						<a class="qs-list n_ty02" @click="isPopup()">문항목록</a>
						<button class="clip mobile-view">찜하기</button>
<%--						<button class="pen_n mobile-blind">펜쓰기</button>--%>
						<button class="memo mobile-view">메모</button>
						<button class="next mobile-blind" @click="nextQuestion" >다음문제</button>
					</div>
					<div class="solving-submit mobile-blind">
						<button class="on">학습종료</button><!--// 문제를 다 풀었을때 버튼 클래스 "on" 추가해주세요. --><!-- 2020-03-02 -->
					</div>
				</div>
			</div>
		</section>
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
            questions: [{
                fakeUrl : '',
				question: ''
			}],
            leavedQuestion: '',
            isPopup : false,
            empty: '',
            imgPath: '',
            userId: 0,
            localPath: 'http://localhost:8084/keris'
            // localPath: 'http://asse.edunet.net/exam',
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
                // this.getQuestions(id)
            }
            else{
                alert("exam id undefined")
            }
        },
        created(){
            // this.userId = this.$route.params.userId
            // this.examId = this.$route.params.userId
            // this.getQuestions()
            // this.imgPath = window.location.protocol +'//'+ window.location.hostname+':80'+'/webapps/uploadingDir/'
            // this.imgPath = 'http://asse.edunet.net/uploadingDir'
            // console.log("here is Userid : " +this.userId);
        },
        methods:{
            answerActive(item){
               item.selectedAnswer = !item.selectedAnswer
               
				
               for ( let i=0; i > this.answers.length; i++) {
                   console.log("selected answer")
                   console.log(this.answers[i])
               }
                if (this.answers[0].selectedAnswer == true) {
                    this.answers[1].selectedAnswer == false
                    // question.score = 0
                } else {
                    this.answers[1].selectedAnswer == true
                    // question.score = 1
                }

            },
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
                        'Content-Type': 'application/json',
                    }

                    $.blockUI({message: '<span> Loading...</span>'});

                    var _$ = $
                    var _this = this

                    axios.get('${BASEURL}/kexam/student/questions',{
                        params: {
                            examId: examId,
							loginId: loginId
                        },
                        headers: headers
                    }).then (function (response) {
                        _$.unblockUI()

                        for (let select = 0; select < response.data.result.result.questions.length; select++) {
                            let active = response.data.result.result.questions[select];
						    
						    if(active.questionType === "4"){
                                _this.questions.push(data)
                            }
						}
                        console.log('res= ',_this.questions[0])

                    },function (error){
                        console.log("axios error found")
                        console.log(error);
                        _$.unblockUI
                    });
                } catch (error) {
                    console.log(error)
                }
            },
            async stuval(){
                try {
                    let questions = []
					
                    var loginId = '${sessionScope.loginId}';

                    const headers = {
                        'Content-Type': 'application/json'
                    }
                    
                    for (let i = 0; i < this.questions.length; i++) {
                        let  q = this.questions[i];
                        if (q.answerSelected == true) {
                            let item = {
                                score: q.score,
                                questionType: q.questionType,
                                questionId: q.id
                            }
                            questions.push(item)
                        }
                        else{
                            alert("당신이 대답하지 않은 몇 가지 질문이 남아 있습니다. 답변 주먹을 선택하십시오")
                            return
                        }
                    }
                    axios.post('${BASEURL}/kexam/result/put/steval',{

                        examId: this.examId,
                        loginId : loginId,
                        questions: questions
						
					},{headers: headers}).then((response)=>
					{
                        console.log("question result send");
                        console.log(response);

                        let url = this.localPath + "/result_see" + "?examId=" + this.examId + "$userId=" + loginId
                        window.location.href = url
					},(error)=>{
						 console.log(error)
					});
                
                } catch (error) {
                    console.log(error);
                }
            },
			
        }
    })
    app.$mount('#secondexam')
</script>

</body>


</html>

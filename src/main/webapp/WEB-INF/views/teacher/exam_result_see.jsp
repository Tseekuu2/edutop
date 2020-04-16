<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Check total result</title>
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/examCheck.css">
</head>

<body>
<%-- id="resultcheckteacher"--%>
<section id="resultcheckteacher" v-cloak>

	<div id="solving"  >
	<section class="solving-wrap">
		<h1 class="title uk-margin-remove">
			<span class="col-orange02">[초등 4 수학]</span>
			여러 가지 삼각형–이등변 삼각형의 성질 탐구하기
		</h1><!--// 타이틀 영역 -->
		<div class="solving-layout" v-if="isPopup == false">
			<div class="explain-wrap" >
				<div class="explain-area left">
					<div class="top-area" style="overflow:visible;">
						<p class="take ftl" style="margin: 0px;">
							대상 : <em> 4 </em>
							응시 : <em> {{studentAll}} </em>
							미응시 : <em> {{4 - studentAll}} </em>
						</p>
						<p class="percent ftr pc_mb_db" style="margin:0px;">
                                <span>난이도:
									<em class="tt_wrap">
										{{aveCorrect}} ({{average.toFixed(1)}}%)
										<span class="tt_bx">
											<span
													class="arr"><img src="${ASSETS}/img/viewer/arr_baloon.png" alt=""
											/></span>
											해당 문제를 맞춘 학생 수 / 전체 응시자 수<br/><br/>

											용이 : 70% 이상<br/>
											허용(최적) : 50% 이상<br/>
											허용 : 30% 이상<br/>
											난해 : 30% 미만
										</span>
									</em>
								</span><!--
                                --><span>
										분별도 :
										<em class="tt_wrap">
											{{aveIndex}} ({{aveIndexPercent.toFixed(1)}}%)
											<span class="tt_bx">
												<span
														class="arr"><img
														src="${ASSETS}/img/viewer/arr_baloon.png" alt=""/></span>
												상위 27%의 난이도(상위 27% 학생 중 맞은 학생 수 / 상위 27% 학생 수) - 하위 27%의 난이도 (하위 27% 학생 중 맞은 학생 수 / 하위 27% 학생 수)<br/><br/>

												Excellent : 25% 이상<br/>
												Good : 15% 이상<br/>
												Marginal : 0% 이상<br/>
												Poor : 0% 미만
											</span>
										</em>
									</span><!--
                                --><span>평균풀이 시간 : <em>{{aveTime}}</em></span>
						</p>
						<div style="clear:both;"></div>
						<!-- //2020-02-27 -->
					</div>
					<!-- 2020-02-27 -->
					<script>
                        $(document).ready(function () {
                            $('.tt_wrap').hover(function () {
                                $(this).addClass("on");
                            }, function () {
                                $(this).removeClass("on");
                            });
                        });
					</script>
					<!-- //2020-02-27 -->
					<div class="class-area popup-scroll ">
						<!-- <span class="like-check">
							<input type="checkbox" name="likeCheck" id="likeCheck" value="">
							<label for="likeCheck"></label>
						</span> -->
						<!-- //2020-02-27 -->
						<div class="pdl60" v-for="(item, eIndex) in questions" :key="eIndex"
							 v-if="currentQuestion === eIndex"
							 :class="{'activeQuestion': currentQuestion === eIndex}">
							<div class="uk-width-1-1 uk-margin-remove-left uk-padding-remove" uk-grid
								 style="margin-bottom: 30px">
								<span class="uk-margin-top uk-width-auto uk-padding-remove">{{eIndex+1}}. </span>
								<p class="txt-type01 mgt20 uk-width-expand" style="width: 90% !important;"
								   v-html="item.question">
								</p>
							</div>
							<div class="question-area mgb0" v-if="item.datas.length > 0">
								<template v-for="(apps, mindex) in item.datas" :key="mindex">
									<div v-if="apps.media != null">
										<p v-if=" apps.media.mediaType == 'image' ">
											<img :src="'http://103.41.247.45:80/webapps/uploadingDir/examquestion/' + apps.media.fileName"
												 :alt="apps.media.fileName" :key="mindex" style="width: auto"/>
										</p>
										<p v-else-if="apps.media.mediaType == 'math' ">
											<mathlive-mathfield
													:id="'mf'+mindex"
													:ref="'mathfield'+mindex"
													@focus="ping"
													:on-keystroke="displayKeystroke"
													:config=" {smartMode:true, readOnly: true}"
													v-model="apps.dataText"
													style="font-size: 16px; font-weight: 400;">
												{{apps.dataText}}
											</mathlive-mathfield>
										</p>
										<p v-else>
										</p>
									</div>
									<p v-else>
									</p>
								</template>
							</div>
							
							<div class="example-list uk-margin-bottom" v-if="item.questionType == '1'">
								<div class="example-wrap" v-for="(aitem,www) in item.answers" :key="www">
<%--									--%>
                                        <span class="radio-number">
                                            <input id="number1" :value="aitem.optionNumber"
												   style="padding-left: 0px;  margin-right: 15px !important;" class="checkBtn uk-margin-remove"
												   :class="{'answerFlag': aitem.answerFlag}">
											<label for="number1">
												<div v-if="item.answerType == 'math'">
													<mathlive-mathfield
															:id="'mf'+www"
															:ref="'mathfield'+www"
															:config="{smartMode:true, readOnly: true}"
															@focus="ping"
															:on-keystroke="displayKeystroke"
															v-model="aitem.answer"
															>{{aitem.answer}}
													</mathlive-mathfield>
												</div>
												<span v-else-if="item.answerType == 'image' ">
													<img :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aitem.media.fileName"
														 :alt="aitem.media.fileName" style="width: 300px !important;"
														 class="uk-margin-top uk-margin-left"/>
												</span>
												<div v-else>
													<span v-html="aitem.answer"></span>
												</div>
											</label>
                                        </span>
									<div class="progress">
										<i :style="{width: (aitem.checkedCount/item.totalExaminee*100) + '%'}"></i>
									</div>
									<span class="num-txt">
										{{allPoint = (aitem.checkedCount/item.totalExaminee*100).toFixed(0)}}%
										({{aitem.checkedCount}}명/{{item.totalExaminee}}명)
									</span>
								</div>
							</div>
							<div class="example-list uk-margin-bottom" v-else-if="item.questionType == '3'">
								<div class="example-wrap" v-for="(aitem,www) in item.answers" :key="www">
									<span class="radio-number">
                                            <input id="number2" :value="aitem.optionNumber"
												   style="padding-left: 0px;  margin-right: 15px !important;" class="checkBtn uk-margin-remove"
												   :class="{'answerFlag': aitem.answerFlag}">
											<label for="number2">
												<div v-if="item.answerType == 'math'">
													<mathlive-mathfield
															:id="'mf'+www"
															:ref="'mathfield'+www"
															:config="{smartMode:true, readOnly: true}"
															@focus="ping"
															:on-keystroke="displayKeystroke"
															v-model="aitem.answer"
													>{{aitem.answer}}
													</mathlive-mathfield>
												</div>
												<span v-else-if="item.answerType == 'image' ">
													<img :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aitem.media.fileName"
														 :alt="aitem.media.fileName" style="width: 300px !important;"
														 class="uk-margin-top uk-margin-left"/>
												</span>
												<div v-else>
													<span v-html="aitem.answer"></span>
												</div>
											</label>
                                        </span>
									<div class="progress">
										<i :style="{width: (aitem.checkedCount/item.totalExaminee*100) + '%'}"></i>
									</div>
									<span class="num-txt">
										{{allPoint = (aitem.checkedCount/item.totalExaminee*100).toFixed(0)}}%
										({{aitem.checkedCount}}명/{{item.totalExaminee}}명)
									</span>
								</div>
							</div>
							<div class="example-list uk-margin-bottom" v-else-if="item.questionType == '2'">
								<div class="example-wrap" v-for="(aitem,www) in item.answers" :key="www">
									<span class="radio-number">
                                            <input id="number3" :value="aitem.optionNumber"
												   style="padding-left: 0px;  margin-right: 15px !important;" class="checkBtn uk-margin-remove"
												   :class="{'answerFlag': aitem.answerFlag}">
											<label for="number3">
												<div>
													<mathlive-mathfield
															:id="'mf'+www"
															:ref="'mathfield'+www"
															:config="{smartMode:true, readOnly: true}"
															@focus="ping"
															:on-keystroke="displayKeystroke"
															v-model="aitem.trueData"
													>{{aitem.trueData}}
													</mathlive-mathfield>
												</div>
											</label>
                                        </span>
									<div class="progress">
										<i :style="{width: (aitem.checkedCount/item.totalExaminee*100) + '%'}"></i>
									</div>
									<span class="num-txt">
										{{allPoint = (aitem.checkedCount/item.totalExaminee*100).toFixed(0)}}%
										({{aitem.checkedCount}}명/{{item.totalExaminee}}명)
									</span>
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
<%--							--%>
<%--							<div class="example-list" v-else-if="item.questionType == '3'">--%>
<%--								<div class="example-wrap" v-for="(aItem,index) in item.answers" :key="index"--%>
<%--									 style="display: flex;">--%>
<%--									<template v-if="item.answerType == 'math' " :key="index">--%>
<%--										<input type="button" name="numRadio" class="checkBtn uk-margin-remove"--%>
<%--											   style="padding-left: 0px; margin-right: 15px !important;"--%>
<%--											   :value="aItem.optionNumber" :class="{'answerFlag': aItem.answerFlag}"/>--%>
<%--										<mathlive-mathfield--%>
<%--												:id="'mf'+index"--%>
<%--												:ref="'mathfield'+index"--%>
<%--												:config="{smartMode:true, readOnly: true}"--%>
<%--												@focus="ping"--%>
<%--												:on-keystroke="displayKeystroke"--%>
<%--												v-model="aItem.answer"--%>
<%--										>{{aItem.answer}}--%>
<%--										</mathlive-mathfield>--%>
<%--									</template>--%>
<%--									<span v-else-if="item.answerType == 'image' ">--%>
<%--                                                <input type="button" name="numRadio" class="checkBtn uk-margin-remove"--%>
<%--													   style="padding-left: 0px;"--%>
<%--													   :value="aItem.optionNumber"--%>
<%--													   :class="{'answerFlag': aItem.answerFlag}"/>--%>
<%--                                                <img :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.media.fileName"--%>
<%--													 :alt="aItem.media.fileName" style="width: 300px !important;"--%>
<%--													 class="uk-margin-top uk-margin-left"/>--%>
<%--                                            </span>--%>
<%--									<div class="radio-numbers " v-else>--%>
<%--										<div class="uk-subnav" style="flex-wrap: unset; padding-left: 0px;">--%>
<%--											<input type="button" name="numRadio"--%>
<%--												   class="checkBtn" style="padding-left: 0px;"--%>
<%--												   :value="aItem.optionNumber"--%>
<%--												   :class="{'answerFlag': aItem.answerFlag}"/>--%>
<%--											<span class="answerMargin uk-margin-remove" name="numRadio"--%>
<%--												  style="width: 90% !important;"--%>
<%--												  :class="{'answerTrue': aItem.answerFlag}"--%>
<%--												  v-html="aItem.answer"></span>--%>
<%--										</div>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</div>--%>
						</div>
					 
						<div class="mb_bx_n03 uk-margin-remove" style="margin-left: 0px !important;">
							<ul class="uk-margin-remove" style="margin-left: 0px !important;">
								<li>
									<div class="in_bx uk-margin-top">
										<p>난이도</p>
										<p><span>{{aveCorrect}} </span>({{average.toFixed(1)}}%)</p>
									</div>
								</li>
								<li class="mid">
									<div class="in_bx uk-margin-top">
										<p>분별도</p>
										<p><span>{{aveIndex}}</span> ({{aveIndexPercent.toFixed(1)}}%)</p>
									</div>
								</li>
								<li>
									<div class="in_bx uk-margin-top">
										<p>평균 풀이 시간</p>
										<p><span>{{aveTime}}</span></p>
									</div>
								</li>
								<li>
									<div class="in_bx uk-margin-top">
										<p>찜 한 학생</p>
										<p><span>{{likeCount}}명</span></p>
									</div>
								</li>
								<li class="mid">
									<div class="in_bx uk-margin-top">
										<p>펜쓰기 한 학생</p>
										<p><span>{{paintCount}}명</span></p>
									</div>
								</li>
								<li>
									<div class="in_bx uk-margin-top">
										<p>메모 한 학생</p>
										<p><span>{{memoCount}}명</span></p>
									</div>
								</li>
							</ul>
							<div style="clear:both;"></div>
						
						</div>
						<!-- //2020-03-03 -->
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
									<div uk-grid class="uk-margin-remove-left" v-if="item.questionType == '4'"
										 style="display:inline-block;">
										<p style="padding: 0" class="answer-text uk-margin-remove">그리기 문제</p>
									</div>
									<span class="answer-text uk-padding-remove" v-else-if="item.questionType == '2'"
										  style="position: absolute">
                                        <p style="padding-top: 4px">주관식 문제</p>
                                    </span>
									<label class="" v-else v-for="(aitem,aindex) in item.answers" :key="aindex">
                                            <span class="number-txt" style="margin-right: 10px"
												  :class="{'answerFlag': aitem.answerFlag}"
											>{{aindex+1}}</span>
									</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 2020-02-27 -->
			<div class="next-area of-hd mgt15">
				<div class="solving-nav tac pc">
					<button class="prev mobile-view" @click="prevQuestion()">이전문제</button>
					<button class="clip mobile-blind none" style="text-align:left;">찜한 학생<br/>{{likeCount}}명</button>
					<!-- 2020-03-03 -->
					<button class="pen_n mobile-blind" style="text-align:left;">펜쓰기 한 학생<br/>{{paintCount}}명</button>
					<button class="memo mobile-blind" style="text-align:left;">메모한 학생<br/>{{memoCount}}명</button>
					<button class="next mobile-view" @click="nextQuestion()">다음문제</button>
				</div>
				<div class="solving-nav tac mob" style="text-align:center;">
					<button class="prev mobile-view" style="margin-right:0;" @click="prevQuestion">이전문제</button>
					<span style="display:inline-block; width:1px; height:14px; margin:8px 7px 0 6px; background:#d2d2d2; vertical-align:top;"></span>
					<button class="qs-list n_ty03"
					   style="margin:0;" @click="questionList()">문제목록</button>
					<span style="display:inline-block; width:1px; height:14px; margin:8px 7px 0 6px; background:#d2d2d2; vertical-align:top;"></span>
					<button class="qs-list n_ty03"
					   style="margin:0;" @click="closeWindow">평가목록</button>
					<span style="display:inline-block; width:1px; height:14px; margin:8px 7px 0 6px; background:#d2d2d2; vertical-align:top;"></span>
					<button class="next mobile-view" style="margin-left:0;" @click="nextQuestion">다음문제</button>
				</div>
			</div>
			<script>
                $(".clip").click(function () {
                    $(this).toggleClass('none');
                });
			</script>
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
					<button class="mobile-view btn_view_end" @click="closeWindow">미리보기 종료</button>
				</div>
			</div><!--// 다음문제 영역 -->
			<!-- //2020-02-27 -->
		</div>
	</section>
	
</div>

</section>
<script type="text/javascript">
    let router = new VueRouter({
        mode: 'history',
        routes: []
    });
    let app = new Vue({
        // el: '#resultcheckteacher',
        router,
        // component(){
        //
        // },
        data: {
            currentQuestion: 0,
            questions: [],
            results: [],
            isPopup: false,
            empty: '',
            imgPath: '',
            examId: 0,
            userId: 0,
            memoCount: '0',
            likeCount: '0',
            paintCount: '0',
            aveCorrect: '0',
            average: 0,
            aveTime: 0,
            aveIndex: '',
            aveIndexPercent: 0,
            studentAll: 0,
            allPoint: 0,
            loginName: '',

        },
        mounted() {

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


            } else {
                alert("exam id undefined")
            }

        },
        created() {

        },
        methods: {
            questionChange(item) {
                this.empty = ''
                this.currentQuestion = item

            },
            chooseQuestion(index) {
                this.isPopup = false
                this.currentQuestion = index
            },
            questionList(){
                this.isPopup=true
            },
            closeWindow() {
                window.close()
                alert("window close")
            },
            nextQuestion() {
                console.log("nextQuestion")
                this.currentQuestion++
                this.getResultProfessor()
                this.empty = ''
                if (this.currentQuestion > this.questions.length - 1) {
                    alert("last Question")
                }
            },
            prevQuestion() {
                if (this.currentQuestion > 0) {
                    this.currentQuestion--
                    this.getResultProfessor()
                    this.empty = ''
                } else {
                    alert("1번 문제입니다. 이전 문제가 없습니다.")
                }
            },
            async getQuestions(examId) {
                try {
                    var loginId = '${sessionScope.loginId}';

                    const headers = {
                        'Content-Type': 'application/json'
                    }
                    var _$ = $
                    var _this = this

                    axios.get('${BASEURL}/kexam/questions', {
                        params: {
                            examId: examId,
                            loginId: loginId
                        },
                        headers: headers
                    }).then(function (response) {
                        if (response.data.status == 200) {

                            for (let i = 0; i < response.data.result.questions.length; i++) {
                                let q = response.data.result.questions[i];

                                for (let j = 0; j < q.answers.length; j++) {
                                    let ans = q.answers[j];

                                    if (ans.answerFlag == 'false') {
                                        ans.answerFlag = false
                                    } else {
                                        ans.answerFlag = true
                                    }
                                }

                            }
                            console.log("all questions id")
                            _this.questions = response.data.result.questions
                            _this.getResultProfessor()

                            _$.unblockUI
                        } else {
                            console.log(error)
                        }
                    }, (error) => {
                        console.log("axios error found")
                        console.log(error);
                        _$.unblockUI
                    });
                } catch (error) {
                    console.log(error)
                }
            },
            async getResultProfessor() {
                try {
                    console.log("QQQQQQQQQID")
                    console.log(this.questions)
                    let questionId = this.questions[this.currentQuestion].id
                    console.log(questionId)


                    const headers = {
                        'Content-Type': 'application/json',
                    }

                    axios.get('${BASEURL}/kexam/result/professor/' + questionId, {
                        params: {headers: headers}
                    }).then((response) => {
                        console.log("Professor details");
                        console.log(response.data);

                        this.questions[this.currentQuestion].totalExaminee = response.data.result.givedTotalCount
                        for (let i = 0; i < this.questions[this.currentQuestion].answers.length; i++) {
                            let ans = this.questions[this.currentQuestion].answers[i];
                            for (let a = 0; a < response.data.result.answers.length; a++) {
                                let aCheck = response.data.result.answers[a];
                                if (ans.id == aCheck.id) {
                                    ans.checkedCount = aCheck.checkedCount
                                }
                            }
                        }

                        this.studentAll = response.data.result.givedTotalCount
                        this.memoCount = response.data.result.memoUsedCount
                        this.likeCount = response.data.result.likedCount
                        this.paintCount = response.data.result.penUsedCount
                        let average = response.data.result.trueGivedCount / response.data.result.givedTotalCount * 100
                        this.average = average
                        if (average > 70) {
                            this.aveCorrect = "용이"
                        }
                        if (average <= 70 && average >= 50) {
                            this.aveCorrect = "허융(최적)"
                        }
                        if (average < 50 && average >= 30) {
                            this.aveCorrect = "허융"
                        }
                        if (average < 30) {
                            this.aveCorrect = "난해"
                        }

                        if (response.data.result.totalTime == 0) {
                            this.aveTime = "_"
                        } else {
                            let time = response.data.result.totalTime / response.data.result.givedTotalCount
                            console.log(time);
                            time = parseInt(time);
                            let hours = Math.floor(time / 3600);
                            time %= 3600;
                            let minutes = Math.floor(time / 60);
                            let seconds = time % 60;
                            this.aveTime = hours + ":" + minutes + ":" + seconds
                        }


                        //  this.aveTime = response.data.result.totalTime / response.data.result.givedTotalCount


                        this.aveIndexPercent = response.data.result.idi
                        if (this.aveIndexPercent >= 25) {
                            this.aveIndex = "매우 높음"
                        }
                        if (this.aveIndexPercent < 25 && this.aveIndexPercent >= 15) {
                            this.aveIndex = "높음"
                        }
                        if (this.aveIndexPercent < 15 && this.aveIndexPercent >= 0) {
                            this.aveIndex = "적절"
                        }
                        if (this.aveIndexPercent < 0) {
                            this.aveIndex = "적음 "
                        }

                    }, (error) => {
                        console.log(error)
                    });

                } catch (error) {
                    console.log(error);

                }
            }
        },
    });
    app.$mount('#resultcheckteacher')
</script>
</body>

</html>
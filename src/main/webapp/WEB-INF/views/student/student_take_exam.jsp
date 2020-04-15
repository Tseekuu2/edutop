<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Take exam</title>
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/studentTakeExam.css">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/script/mathlive/dist/mathlive.core.css">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/script/mathlive/dist/mathlive.css">
<%--	<script type="text/javascript" src="${ASSETS}/script/vue/signature_pad.min.js"></script>--%>
<%--	<script src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>--%>
<%--	<script type="text/javascript" src="${ASSETS}/script/vue/drawing.js"></script>--%>
</head>

<body>
<section id="takeexam">
	<div id="solving">
		<section class="solving-wrap">
			<h1 class="title" style="margin: 0px;">
				<span class="col-orange02">[초등 4 수학]</span>
				여러 가지 삼각형–이등변 삼각형의 성질 탐구하기
			</h1>
			<div class="solving-layout" v-if="isPopup == false">
				<div class="explain-wrap">
					<div class="explain-area left">
						<div class="top-area">
							<p class="timer ftl">{{hours}}:{{minutes}}:{{seconds}}</p>
							<p class="ftr pdt5 uk-margin-remove">
								<span class="col-darkgray">남은 문제 : <b class="col-orange02">{{leavedQuestion}}</b></span>
								<span class="col-darkgray">전체 문제 :
                                        <b class="col-orange02">{{questions.length}}</b></span>
							</p>
						</div>
<%--						:class="{ 'showCanvas' : pencil2}"--%>
<%--						<VueSignaturePad--%>
<%--								style="width: 74.5%; height: 100%;  position:absolute;--%>
<%--                                top:0; left: 0px; padding: 0; z-index:1.5; background: #ccc;"--%>
<%--								ref="signaturePad"--%>
<%--								class="signature-pad"--%>
<%--								:options="options">--%>
<%--						</VueSignaturePad>--%>
						<div class="class-area popup-scroll">
<%--							<canvas id="signature-pad" class="signature-pad" style="width: 100%; height: 100%"></canvas>--%>
							<div class="pdl60" v-for="(item,examIndex) in questions" :key="examIndex"
								 v-show="currentQuestion === examIndex"
								 :class="{'activeQuestion': currentQuestion === examIndex}">
								<div class="uk-subnav" style="display: flex;">
									<span class="questionOptionNumber">{{examIndex+1}}</span>
									<p class="txt-type01 mgt20" v-html="item.question" style="padding-left: 20px;
                                         width: 90%; margin: 0px;">
									</p>
								</div>
								<div class="question-area mgb0" v-if="item.datas.length > 0">
									<template v-for="(apps, mindex) in item.datas">
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
												<span>{{apps.dataText}}</span>
											</p>
										</div>
										<p v-else>
										</p>
									</template>
								</div>
								<div class="uk-margin-large-top" v-else>
								
								</div>
								<div class="example-list" v-if="item.questionType == '1'">
									<div class="example-wrap" v-for="(aItem,index) in item.answers" :key="index">
										<template v-if="item.answerType == 'math' ">
											<div class="" style="display: inline-flex">
												<input type="button" name="numRadio" class="checkBtn uk-margin-remove"
													   style="padding-left: 0px;" @click="activeanswers(aItem, item)"
													   :value="aItem.optionNumber"
													   :class="{'answerFlag': aItem.selectedAnswer}"/>
												<mathlive-mathfield
														:id="'mf'+index"
														:ref="'mathfield'+index"
														:config="{smartMode:true , readOnly: true}"
														@focus="ping"
														:on-keystroke="displayKeystroke"
														v-model="aItem.answer"
												>{{aItem.answer}}
												</mathlive-mathfield>
											</div>
										</template>
										<span v-else-if="item.answerType == 'image' ">
                                                <input type="button" name="numRadio" class="checkBtn uk-margin-remove"
													   style="padding-left: 0px;" @click="activeanswers(aItem, item)"
													   :value="aItem.optionNumber"
													   :class="{'answerFlag': aItem.selectedAnswer}"/>
                                                <img :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.media.fileName"
													 :alt="aItem.media.fileName" style="width: 100% !important;
                                                       max-width: 280px;"
													 class="uk-margin-top "/>
                                            </span>
										<div class="radio-numbers " v-else>
											<div class="uk-subnav" style="flex-wrap: unset; padding-left: 0px;">
												<input type="button" name="numRadio"
													   class="checkBtn" style="padding-left: 0px;"
													   @click="activeanswers(aItem, item)"
													   :value="aItem.optionNumber"
													   :class="{'answerFlag': aItem.selectedAnswer}"/>
												<span class="answerMargin uk-margin-remove" name="numRadio"
													  style="width: 90% !important;"
													  :class="{'answerTrue': aItem.selectedAnswer}"
													  v-html="aItem.answer"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="example-list" v-else-if="item.questionType == '3'">
									<div class="example-wrap" v-for="(aItem,index) in item.answers" :key="index"
										 style="display: flex">
										<template v-if="item.answerType == 'math' ">
											<div style="display: inline-flex">
												<input type="button" name="numRadio" class="checkBtn uk-margin-remove"
													   style="padding-left: 0px; margin-right: 20px !important;"
													   @click="activeanswers(aItem, item)"
													   :value="aItem.optionNumber"
													   :class="{'answerFlag': aItem.selectedAnswer}"/>
												
												<mathlive-mathfield
														:id="'mf'+index"
														:ref="'mathfield'+index"
														:config="{smartMode:true, readOnly: true}"
														@focus="ping"
														:on-keystroke="displayKeystroke"
														v-model="aItem.answer"
												>{{aItem.answer}}
												</mathlive-mathfield>
											</div>
										</template>
										<span v-else-if="item.answerType == 'image' ">
                                                <input type="button" name="numRadio" class="checkBtn uk-margin-remove"
													   style="padding-left: 0px;" @click="activeanswers(aItem, item)"
													   :value="aItem.optionNumber"
													   :class="{'answerFlag': aItem.selectedAnswer}"/>
                                                <img :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.media.fileName"
													 :alt="aItem.media.fileName" style="width: 100% !important;"
													 class="uk-margin-top "/>
                                            </span>
										<div class="radio-numbers " v-else>
											<div class="uk-subnav" style="flex-wrap: unset; padding-left: 0px;">
												<input type="button" name="numRadio"
													   class="checkBtn" style="padding-left: 0px;"
													   @click="activeanswers(aItem, item)"
													   :value="aItem.optionNumber"
													   :class="{'answerFlag': aItem.selectedAnswer}"/>
												<p>
                                                        <span class="answerMargin uk-margin-remove" name="numRadio"
															  style="width: 90%; !important;"
															  :class="{'answerTrue': aItem.selectedAnswer}"
															  v-html="aItem.answer"></span>
												</p>
											
											</div>
										</div>
									</div>
								</div>
								<div v-else-if="item.questionType == '4'"
									 class="uk-width-1-1 answers-exp mgt60 uk-margin-remove-left" uk-grid
									 v-for="(aItem,index) in item.answers" :key="index">
									<div class="uk-width-expand uk-flex uk-flex-middle uk-flex-center">
										<img class=""
											 :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + item.answers[0].drawingData"
											 :width="item.answers[0].width" :height="item.answers[0].height"/>
										<!-- :width="item.answers[0].width+'px'"
												:height="item.answers[0].height+'px'" -->
										<!-- :style="{ background: 'url('+ 'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + item.answers[0].drawingData +')'+
											'no-repeat left center', width: item.answers[0].width + 'px', height: item.answers[0].height + 'px', margin: 'auto' }" -->
										<%--                                                <vue-signature-pad--%>
										<%--                                                        :key="index"--%>
										<%--                                                        :options="options2"--%>
										<%--                                                        v-if="currentQuestion === index"--%>
										<%--                                                        style="z-index:1.5;"--%>
										<%--                                                        class="uk-width-3-4 uk-padding-remove"--%>
										<%--                                                        :width="370+'px'"--%>
										<%--                                                        :height="370+'px'"--%>
										<%--                                                        :style="{ background: 'url('+ 'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + item.answers[0].drawingData +')'+--%>
										<%--                                                'no-repeat left center', width: 370 + 'px', height: 370 + 'px', margin: 'auto' }"--%>
										<%--                                                        ref="qcanvas">--%>
										<%--                                                </vue-signature-pad>--%>
									</div>
									<div class="uk-width-1-3 ">
										<div class="uk-margin-top-small uk-flex uk-flex-center">
											<p class="questionOptionNumber">Select color</p>
										</div>
										<div class="uk-margin-top uk-flex uk-flex-center">
											<button class="colorModify1"
													@click="colorChange2">
											</button>
										</div>
										<div class="uk-margin-top uk-flex uk-flex-center">
											<button class="colorModify2" @click="colorChange">
											</button>
										</div>
										<div class="uk-margin-top uk-flex uk-flex-center">
											<button class="colorModify3" @click="colorChange1">
											</button>
										</div>
										<div class="uk-margin-top uk-flex uk-flex-center">
											<img src="${ASSETS}/img/viewer/icon-eraser-big.png"
												 alt="" class="pencilMobile" @click="options2Eraser">
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
													v-model="aItem.answerWrite"
													style="border: 1px solid #ccc;padding: 10px;font-size: 17px;" >
												{{aItem.answerWrite}}
											</mathlive-mathfield>
										</div>
										<div v-else>
											<div class="uk-flex uk-margin-bottom">
												<b>Guide text: </b>
												<p class="uk-margin-remove" style="padding-left: 15px;">
												{{aItem.answer}} </p>
											</div>
										
											<input type="text" class="txt-input" placeholder="정답을 입력해 주세요"
												   v-model="aItem.answerWrite"
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
					</div>
					
					<div class="explain-area right mobile-blind">
						<ul class="uk-tab uk-flex uk-flex-right uk-margin-remove-bottom"
							data-uk-tab="{connect:'#my-id'}">
							<li class="tabnew"><a href="" class="ex-listTab nth-1 on">전체문제</a></li>
							<li class="tabnew"><a href="" class="ex-listTab nth-2">안푼문제</a></li>
							<li class="tabnew"><a href="" class="ex-listTab nth-3">찜한문제</a></li>
						</ul>
						<ul id="my-id" class="uk-switcher">
							<li>
								<div class="list-area on uk-margin-remove">
									<div class="popup-scroll height-type01 mgt15">
										<ul class="list-basic uk-padding-remove">
											<template v-for="(item,eindex) in questions" :key="eindex">
												<li @click="webIndex(eindex)" class="like" v-if="item.like == '1'"
													:class="{'changed': eindex == currentQuestion}">
													<span class="num-default">{{eindex+1}}</span>
													<span v-if="item.questionType == '4'">
														<p class="num-default uk-margin-remove">그리기 문제</p>
													</span>
													<span class="answer-text" v-else-if="item.questionType == '2'">
<%--														disabled--%>
<%--														<input type="text" placeholder="주관식 문제"--%>
<%--															   class="num-default uk-margin-remove"--%>
<%--															   :value="questions[currentQuestion].answerWrite">--%>
														<p class="num-default uk-margin-remove" placeholder="주관식 문제"></p>
													</span>
													<label class="" v-else v-for="(aitem,aindex) in item.answers"
													   :key="aindex">
														<span class="number-txt" style="margin-right: 10px"
															  :class="{'answerFlag': aitem.selectedAnswer}"
														>{{aindex+1}}</span>
													</label>
												</li>
												<li @click="webIndex(eindex)" class="like none" v-else
													:class="{'changed': eindex == currentQuestion}">
													<span class="num-default">{{eindex+1}}</span>
													<span v-if="item.questionType == '4'">
						                                                <p class="num-default uk-margin-remove">그리기 문제</p>
						                                            </span>
													<span class="answer-text" v-else-if="item.questionType == '2'">
						                                                <p class="num-default uk-margin-remove">주관식 문제</p>
						                                            </span>
													<label class="" v-else v-for="(aitem,aindex) in item.answers"
														   :key="aindex">
						                                            <span class="number-txt" style="margin-right: 10px"
																		  :class="{'answerFlag': aitem.selectedAnswer}"
																	>{{aindex+1}}</span>
													</label>
												</li>
											</template>
										</ul>
									</div>
								</div>
							</li>
							<li>
								<div class="list-area on uk-margin-remove">
									<div class="popup-scroll height-type01 mgt15">
										<ul class="list-basic uk-padding-remove">
											<li v-for="(item,eindex) in questions" :key="eindex"
												@click="webIndex(eindex)" v-if="item.selectedAnswer== false")
												:class="{'changed': eindex == currentQuestion}">
												<span class="num-default">{{eindex+1}}</span>
												<span v-if="item.questionType == '4'">
                                                    <p class="num-default uk-margin-remove">그리기 문제</p>
                                                </span>
												<span class="answer-text" v-else-if="item.questionType == '2'">
                                                    <p class="num-default uk-margin-remove">주관식 문제</p>
                                                </span>
												<label class="" v-else v-for="(aitem,aindex) in item.answers"
													   :key="aindex">
                                                    <span class="number-txt" style="margin-right: 10px"
														  :class="{'answerFlag': aitem.selectedAnswer}"
													>{{aindex+1}}</span>
												</label>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<li class="">
								<div class="list-area on uk-margin-remove">
									<div class="popup-scroll height-type01 mgt15">
										<ul class="list-basic uk-padding-remove">
											<template v-for="(item,eindex) in questions" :key="eindex">
												<li @click="webIndex(eindex)" class="like" v-if="item.like == '1'"
													:class="{'changed': eindex == currentQuestion}">
													<span class="num-default">{{eindex+1}}</span>
													<span v-if="item.questionType == '4'">
                                                        <p class="num-default uk-margin-remove">그리기 문제</p>
                                                    </span>
													<span class="answer-text" v-else-if="item.questionType == '2'">
                                                        <p class="num-default uk-margin-remove">주관식 문제</p>
                                                    </span>
													<label class="" v-else v-for="(aitem,aindex) in item.answers"
														   :key="aindex">
                                                        <span class="number-txt" style="margin-right: 10px"
															  :class="{'answerFlag': aitem.selectedAnswer}"
														>{{aindex+1}}</span>
													</label>
												</li>
											</template>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>
				
				</div>
				
				<div class="next-area of-hd mgt15">
					<div class="solving-nav tac">
						<button class="prev mobile-view" @click="prevQuestion">이전문제</button>
						<a class="qs-list n_ty02" @click="changePop()">문항목록</a>
						<button class="clip none mobile-view" @click="bigLike(currentQuestion)"
								v-if="bigheartlike == false">찜하기
						</button>
						<button class="clip mobile-view" @click="bigLike(currentQuestion)" v-else>찜하기</button>
						<button class="pen_n mobile-blind">펜쓰기</button>
						<button class="erase mobile-blind" @click="undo">지우개</button>
<%--						<button class="memo_n mobile-view" href="#memosPopup"--%>
<%--								v-if="questions[currentQuestion].memo.length > 0" uk-toggle>메모--%>
<%--						</button>--%>
<%--						v-else --%>
						<button class="memo mobile-view" href="#memosPopup" uk-toggle>메모
						</button>
						<button class="next mobile-view" @click="nextQuestion">다음문제</button>
					</div>
					<div class="popup-dim " id="memosPopup" uk-modal>
						<div class="popup-layout memo-popup ">
							<button class="uk-modal-close-default" type="button" uk-close></button>
							<p class="pop-title tal">메모하기</p>
							<div class="memo-wrap">
								<textarea placeholder="메모를 작성해주세요."
										  v-model="questions[currentQuestion].memo"></textarea>
								<button class="btn-orange uk-modal-close">저장하기</button>
							</div>
						</div>
					</div>
					<div class="solving-submit mobile-blind">
						<button class="on" @click="saveLast()">학습종료</button><!--// 문제를 다 풀었을때 버튼 클래스 "on" 추가해주세요.
						 --><!-- 2020-03-02
						 -->
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
						<ul class="uk-tab uk-flex uk-flex-right uk-margin-remove-bottom"
							data-uk-tab="{connect:'#mobileTab'}">
							<li class="tabnew"><a href="" class="ex-listTab nth-1 on">전체문제</a></li>
							<li class="tabnew"><a href="" class="ex-listTab nth-2">안푼문제</a></li>
							<li class="tabnew"><a href="" class="ex-listTab nth-3">찜한문제</a></li>
						</ul>
						<ul id="mobileTab" class="uk-switcher">
							<li>
								<div class="list-area on uk-margin-remove">
									<div class="popup-scroll height-type01 mgt15">
										<ul class="list-basic uk-padding-remove">
											<li class="" v-for="(item,index) in questions" :key="index"
												@click="chooseQuestion(index)"
												:class="{'mobileCheck': item.answerSelected}">
												<a href="#" class="num-default"
												   :class="{'mobileNumber': item.answerSelected}">
													{{index+1}}</a>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<li>
								<div class="list-area on uk-margin-remove">
									<div class="popup-scroll height-type01 mgt15">
										<ul class="list-basic uk-padding-remove">
											<li class="" v-for="(item,index) in questions" :key="index"
												@click="chooseQuestion(index)" v-if="item.answerselected == false">
												<a href="#" class="num-default">{{index+1}}</a>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<li class="">
								<div class="list-area on uk-margin-remove">
									<div class="popup-scroll height-type01 mgt15">
										<ul class="list-basic uk-padding-remove">
											<li class="" v-for="(item,index) in questions" :key="index"
												@click="chooseQuestion(index)" v-if="item.like == '1'">
												<a href="#" class="num-default">{{index+1}}</a>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				
				<!-- 2020-02-27 -->
				<div class="next-area mgt15">
					<div class="solving-nav tac mobile-view" style="overflow:visible;">
						<button class="mobile-view btn_view_end" @click="mobileBack">back</button>
					</div>
				</div><!--// 다음문제 영역 -->
				<!-- //2020-02-27 -->
			</div>
		</section>
		
	</div>
</section>
<script type="module">
    // import VueSignaturePad from 'vue-signature-pad';
    // import Vue from 'vue';

    import MathLive from '${ASSETS}/script/mathlive/dist/src/mathlive.js';
    import Mathfield from '${ASSETS}/script/mathlive/dist/vue-mathlive.js';
    // import VueSignaturePad from '../../../../../../node_modules/vue-signature-pad/dist/vue-signature-pad.js';
    // Vue.use(VueSignaturePad);
    Vue.use(Mathfield, MathLive);

    var router = new VueRouter({
        mode: 'history',
        routes: []
    });

    var app = new Vue({
        el: '#takeexam',
        router,
		components:{
            // VueSignaturePad
		},
        data: {
            formula: 'x=-b\\pm \\frac {\\sqrt{b^2-4ac}}{2a}',
            keystroke: '',
            // images: ['../../assets/img/viewer/icon_dec_on.png'],
            options2: {
                penColor: "#0d87f9"
            },
            options: {
                penColor: "#FF0000"
            },
            pencil2: true,
            bigheartlike: false,
            like: false,
            examId: 0,
            questions: [],
            currentQuestion: 0,
            sendQuestion: [],
            answerActive: [],
            ansWer: [],
            likeCount: '',
            leavedQuestion: 0,
            savePaint: '',
            time: 0,
            isRunning: false,
            interval: null,
            eraser: false,
            hours: 0,
            minutes: 0,
            seconds: 0,
            isPopup: false,
            imgPath: '',
            empty: '',
			isLast: 'notlast',
			localPath: 'http://localhost:8084/exam/student',
            // localPath: 'http://devasse.edunet.net:8000/exam',
        },
        mounted() {
            let parameters = this.$route.query
            console.log("here is  parameter :")
            console.log(parameters)

            this.imgPath = 'http://103.41.247.45:80/webapps/uploadingDir/'
            // this.imgPath = window.location.protocol +'//'+ window.location.hostname+':80'+'/webapps/uploadingDir/'
            console.log(this.imgPath)
			
            if (typeof this.$route.query.examId != 'undefined') {
                let userId = this.$route.query.userId;
                this.userId = userId

                let id = this.$route.query.examId;
                this.examId = id
				
                this.getQuestions(id)
            } else {
                alert("exam id undefined")
            }
        },
        created() {
            // this.imgPath = window.location.protocol +'//'+ window.location.hostname+':80'+'/webapps/uploadingDir/'
        },
        methods: {
            colorChange() {
                this.options2 = {
                    penColor: "#ff9d35"
                };
            },
            colorChange1() {
                this.options2 = {
                    penColor: "#3bd660"
                };
            },
            colorChange2() {
                this.options2 = {
                    penColor: "#0d87f9"
                };
            },
			saveLast(){
                console.log(this.questions.length)
                // if (this.currentQuestion > this.questions.length - 1){
                // 	if (this.leavedQuestion <= 1) {
                        this.isLast = 'last'
                        this.nextQuestion()
					// }
                    // else{
                    //     alert(" You should finish all your question.")
					// }
                // }
                // else{
                // 	alert(" This is not last question!!! ")
                // }
			},
            mobileBack() {
                this.isPopup = false
            },
            webIndex(item) {
                this.currentQuestion = item
				
                this.leavedQuestion = 0
                for (let i = 0; i < this.questions.length; i++) {
                    
                    let a = this.questions[i];

                    if (a.questionType == '2') {
                        if (typeof(this.questions[i].answerWrite) !== 'undefined' || this.questions[i].answerWrite ==
							"") {
                            this.leavedQuestion++
                        }
                    }
                    if(a.questionType == '4'){
                        if (a.drawingData == '') {
                            this.leavedQuestion++
                        }
                    }
                    else{
                        if ( a.answerselected == false ) {
                            this.leavedQuestion++
                        }
                    }
                }
               
                // if (this.questions[this.currentQuestion].questionType === '4') {
                //
                //     let {isEmpty, data} = this.$refs.qcanvas[0].saveSignature()
                //
                //     if (isEmpty == false) {
                //         this.questions[this.currentQuestion].drawingData = data
                //     }
                // }

                if (this.pencil2 == false) {

                    alert("펜쓰기 저장 버튼을 눌러주세요.")

                    return
                    console.log("false pencil2")
					
                } else {

                    // if (this.questions[item].questionType === '4') {
                    //     this.$nextTick(() => {
                    //         this.$refs.qcanvas[0].fromDataURL(this.questions[this.currentQuestion].drawingData)
                    //     })
                    // }
                    //
                    // this.$refs.signaturePad.clearSignature()
                    // this.$refs.signaturePad.fromDataURL(this.questions[item].paint)
                    //
                    //
                    if (this.questions[item].like == '0') {
                        this.bigheartlike = false
                    } else {
                        this.bigheartlike = true
                    }
                }
            },
            activeanswers(answer, question) {
                if (question.questionType == "3") {
                    answer.selectedAnswer = !answer.selectedAnswer
                    if (answer.selectedAnswer == true) {
                        question.answerselected = true
                    } else {
                        question.answerselected = false
                    }
                } else {
                    for (let q = 0; q < question.answers.length; q++) {
                        if (question.answers[q].selectedAnswer == true) {
                            question.answers[q].selectedAnswer = false
                        }
                    }
                    answer.selectedAnswer = !answer.selectedAnswer

                    if (answer.selectedAnswer == true) {
                        question.answerselected = true
                    } else {
                        question.answerselected = false
                    }
                }
                this.isPopup = false
            },
            chooseQuestion(item) {
                this.currentQuestion = item
                this.isPopup = false

                // if (this.questions[this.currentQuestion].questionType === '4') {
                //     this.$nextTick(() => {
                //         this.$refs.qcanvas[0].fromDataURL(this.questions[this.currentQuestion].drawingData)
                //     });
                // }
            },
            changePop() {
                // this.isPopup = !this.isPopup
                if (this.isPopup == false) {
                    this.isPopup = true
                } else {
                    this.isPopup = false
                }
                // if (this.questions[this.currentQuestion].questionType === '4') {
                //
                //     let {isEmpty, data} = this.$refs.qcanvas[0].saveSignature()
                //
                //     if (isEmpty == false) {
                //         this.questions[this.currentQuestion].drawingData = data
                //     }
                // }
            },
            bigLike(item) {
                if (this.questions[item].like == '0') {
                    this.questions[item].like = '1'
                    this.bigheartlike = true
                } else {
                    this.questions[item].like = '0'
                    this.bigheartlike = false
                }
            },
            // drawing() {
            //     this.pencil2 = !this.pencil2
            //     // this.$refs.signaturePad.fromDataURL(this.questions[this.currentQuestion].answerData);
            //     if (this.pencil2 == true) {
            //         const {isEmpty, data} = this.$refs.signaturePad.saveSignature();
            //         this.questions[this.currentQuestion].paint = data
            //         this.$refs.signaturePad.fromDataURL(this.questions[this.currentQuestion].paint)
            //     }
            // },
            options2Eraser() {
                alert("working on it ")
                // this.$refs.qcanvas[0].undoSignature();
            },
            undo() {
                console.log("undo clicked")
                // if (this.pencil2 == false) {
                //     this.$refs.signaturePad.undoSignature();
                // }
            },
            nextQuestion() {
                try {
                    let question = {}
                    let sendAnswer = []
					let typeBool = false

                    if (this.pencil2 == false) {
                        alert("펜쓰기 저장 버튼을 눌러주세요.")
                        return
                    }
                    else {
                        if (this.leavedQuestion > 0) {

                            this.leavedQuestion = 0

                            for (let i = 0; i < this.questions.length; i++) {
                                let a = this.questions[i];

                                if (a.questionType == '2') {
                                    //typeof(this.questions[i].answerWrite) !== 'undefined' ||
                                    if ( this.questions[i].answerWrite == "") {
                                        this.leavedQuestion++
                                    }
                                    else{
                                    }
                                }
                                if(a.questionType == '4'){
                                    if (a.drawingData == '') {
                                        this.leavedQuestion++
                                    }
                                }
                                else{
                                    if ( a.answerselected == false && a.questionType != 2) {
                                        this.leavedQuestion++
                                    }
                                    else{
                                    }
                                }
                            }
                        }
						
                        if (this.questions[this.currentQuestion].questionType == "2") {
							for (let i = 0; i < this.questions[this.currentQuestion].answers.length; i++)
							{
								let choose = this.questions[this.currentQuestion].answers[i]
									let iitem ={
										answerFlag: choose.answerFlag,
										answerId: choose.id,
										answerTrueData: choose.trueData,
										answerData: choose.answerWrite,
										optionNumber:""
									}
								sendAnswer.push(iitem)
							}
                        }
                        if (this.questions[this.currentQuestion].questionType == "4") {
                            for (let i = 0; i < this.questions[this.currentQuestion].answers.length; i++) {
                                let choose = this.questions[this.currentQuestion].answers[i]
                                let iitem = {
                                    answerFlag: choose.answerFlag,
                                    answerId: choose.id,
                                    answerTrueData: choose.trueData,
                                    answerData: this.questions[this.currentQuestion].drawingData,
                                    optionNumber: ""
                                }
                                sendAnswer.push(iitem)
                            }
                        }
                        else {
                            for (let i = 0; i < this.questions[this.currentQuestion].answers.length; i++) {
                                let choose = this.questions[this.currentQuestion].answers[i]
                                if (choose.selectedAnswer == true) {
                                    if(choose.answerFlag == 'true')
									{
                                        typeBool  = true
									}
                                    let iitem = {
                                        answerFlag: typeBool,
                                        answerId: choose.id,
                                        answerTrueData: choose.selectedAnswer,
                                        answerData: this.questions[this.currentQuestion].answerWrite,
                                        optionNumber: ""
                                    }
                                    sendAnswer.push(iitem)
                                }
                            }
                        }
                        var loginId = '${sessionScope.loginId}';
                        
                        question.questionId = this.questions[this.currentQuestion].id
                        question.examId = this.examId
                        question.paint = this.questions[this.currentQuestion].paint
                        question.like = this.questions[this.currentQuestion].like
                        question.memo = this.questions[this.currentQuestion].memo
                        question.time = this.questions[this.currentQuestion].time
                        question.answers = sendAnswer
						question.loginId = loginId
						question.islast = this.isLast
						question.classId = 'demoClass'
                        
                        const headers = {
                            'Content-Type': 'application/json'
                        }
                        
                        axios.post('${BASEURL}/exam/result/put',
							question,
							{
							    headers: headers
							}).then((response)=> {

                            console.log("question result put response ")
                            console.log(response)
							
							
						if(response.status == 200) {
                            if (this.currentQuestion >= this.questions.length-1) {
                                if (this.isLast == 'last')
								{
                                    let url = this.localPath + "/result_see" + "?examId=" + this.examId + "&userId=" + loginId

                                    window.location.href = url
								}
                                else{
                                    alert("마지막 문제입니다. 다음 문제가 없습니다.")
                                    return
								}
                            }
                            else{

                                this.currentQuestion++

                                // this.$nextTick(() => {
                                //     this.$refs.qcanvas[0].fromDataURL(this.questions[this.currentQuestion].drawingData)
                                // })

                                if (this.questions[this.currentQuestion].like == '0') {
                                    this.bigheartlike = false
                                } else {
                                    this.bigheartlike = true
                                }

                                this.pencil2 == false
                                
							}
									// this.$refs.signaturePad.clearSignature();
									// this.$refs.signaturePad.fromDataURL(this.questions[this.currentQuestion].paint)


							// if (this.questions[this.currentQuestion].questionType === '4') {
							//     this.$nextTick(() => {
							//         this.$refs.qcanvas[this.currentQuestion].clearSignature();
							//         this.$refs.qcanvas[this.currentQuestion].fromDataURL(this.questions[this.currentQuestion].answers[0].answerData)
							//     });
							// }


							// if (this.questions[this.currentQuestion].questionType === '4') {
							//     let {isEmpty, data} = this.$refs.qcanvas[0].saveSignature()
							//     if (isEmpty == false) {
							//         this.questions[this.currentQuestion].drawingData = data
							//     }
							// }
							}
                            else{
                                alert(response.data.message)
                                window.close();
                            }
                        },function (error){
                            console.log("axios error found")
                            console.log(error);
                        });

                        
                    }
                } catch (error) {
                    console.log(error)
                }
            },
            async getQuestions(examId) {
                try {
                    // $.blockUI({message: '<span> Loading...</span>'});
                    // var _$ = $
                    var _this = this

                    // const users = JSON.parse(localStorage.getItem('users'));
                    // console.log("this is users")
                    // console.log(users.id)
                    var loginId = '${sessionScope.loginId}';
                    const headers = {
                        'Content-Type': 'application/json'
                    }

                    axios.get('${BASEURL}/exam/questions', {
                        params: {
                            examId: examId,
                            loginId : loginId
                        },
                        headers: headers
                    }).then(function (response) {
                        // _$.unblockUI()
                        for (let select = 0; select < response.data.result.questions.length; select++) {
                            let active = response.data.result.questions[select];

                            active.like = '0'
                            active.memo = ""
                            active.paint = ""
                            active.answerData = ""
                            active.answerselected = false
                            active.time = 0
                            active.drawingData = ""
							active.answerWrite = ''
                            
                            // if(active.resultData != null || active.resultData === 'undefined' ){
							// 	if( active.resultData.islike == 1){
                            //         active.like = '1'
							// 		// this.bigheartlike = true
							// 	}
							// 	else{
                            //         active.like = '0'
                            //         // this.bigheartlike = false
							// 		}
							//
                            //     active.memo = active.resultData.memo
                            //     active.paint = active.resultData.paint
                            // }
                            
                            for (let a = 0; a < active.answers.length; a++) {
                                let item = active.answers[a];
                                item.selectedAnswer = ''
                                item.answerWrite = ''
								
                                // if(active.resultData != null){
                                //     if (active.resultData.id == item.id)
								// 	{
                                //         item.selectedAnser = true
								// 	}
								// }
                             
                                if (active.questionType == '4') {
                                    // item.width = '100%'
                                    // item.height = '100%'
                                    item.width = '370px'
                                    item.height = '370px'

                                    let img = new Image();

                                    // img.src = active.answers[0].drawingData
                                    // img.src = _this.imgPath + 'examanswer/' + active.answers[0].drawingData

                                    console.log(img.src);

                                    img.onload = () => {
                                        item.width = img.width + ""
                                        item.height = img.height + ""
                                        <%--console.log(`the image dimensions are ${img.width}x${img.height} ${active.id}`);--%>
                                    }
                                }
                            }
                          
                        }
                        _this.questions = response.data.result.questions
                        console.log(_this.questions)
                        _this.leavedQuestion = _this.questions.length
                        // var _this = this
						
                        // if (response.data.success == true) {
                        //     if (_this.questions[_this.currentQuestion].questionType === '4') {
                        //         for (let i = 0; i < _this.questions.length; i++) {
                        //             const question = _this.questions[i];
                        //             _this.$nextTick(() => {
                        //                 let img = new Image();
                        //                 img.src = _this.imgPath + 'examanswer/' + question.answers[0].drawingData
                        //             });
                        //         }
                        //     }
                            _this.toggleTimer()
                        // }
                        // _this.currentQuestion++;
                        // setTimeout(() => {
                        //     _this.currentQuestion--;
                        // }, 50)
                        console.log("done!!!")
                    }, function (error) {
                        console.log("axios error found")
                        console.log(error);
                        // _$.unblockUI
                    });
                } catch (error) {
                    console.log(error)
                    if (error.response.data.status == 403) {
                        // this.$router.push({ name: 'login',
                        <%--//    query: { redirect: `solving0301/${this.$route.params.examId}` } });--%>
                    }
                }
            },
            prevQuestion() {
                if (this.pencil2 == false) {
                    alert("펜쓰기 저장 버튼을 눌러주세요.")
                    return
                } else {
                    if (this.currentQuestion > 0) {
                        if (this.leavedQuestion > 0) {

                            this.leavedQuestion = 0

                            for (let i = 0; i < this.questions.length; i++) {
                                let a = this.questions[i];

                                if (a.questionType == '2') {
                                    if (typeof(this.questions[i].answerWrite) !== 'undefined' ||
										this.questions[i].answerWrite == "") {
                                        this.leavedQuestion++
                                    }
                                }
                                if(a.questionType == '4'){
                                    if (a.drawingData == '') {
                                        this.leavedQuestion++
                                    }
                                }
                                else{
                                    if ( a.answerselected == false && a.questionType != 2) {
                                        this.leavedQuestion++
                                    }
                                }
                            }
                        }

                        // if (this.questions[this.currentQuestion].questionType === '4') {
                        //     let {isEmpty, data} = this.$refs.qcanvas[0].saveSignature()
                        //     if (isEmpty == false) {
                        //         this.questions[this.currentQuestion].drawingData = data
                        //     }
                        // }

                        this.currentQuestion--

                        // if (this.questions[this.currentQuestion].questionType === '4') {
                        //     this.$nextTick(() => {
                        //         this.$refs.qcanvas[0].fromDataURL(this.questions[this.currentQuestion].drawingData)
                        //     });
                        // }

                        if (this.questions[this.currentQuestion].like == '0') {
                            this.bigheartlike = false
                        } else {
                            this.bigheartlike = true
                        }
                        // this.$refs.signaturePad.clearSignature()
                        // this.$refs.signaturePad.fromDataURL(this.questions[this.currentQuestion].paint)
                    } else {
                        alert("1번 문제입니다. 이전 문제가 없습니다.")
                    }
                }
            },
            toggleTimer() {
                if (this.isRunning) {
                    clearInterval(this.interval);
                    console.log('timer stops');
                } else {
                    this.interval = setInterval(this.incrementTime, 1000);

                }
                this.isRunning = !this.isRunning
            },
            incrementTime() {
                this.time = parseInt(this.time) + 1;
                this.hours = Math.floor(this.time / 3600);
                this.time %= 3600;
                this.minutes = Math.floor(this.time / 60);
                this.seconds = this.time % 60;
                this.questions[this.currentQuestion].time++

                // console.log("real timer: "+this.questions[this.currentQuestion].time)
                // console.log("time" + this.time);

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
    });
</script>

</body>

</html>
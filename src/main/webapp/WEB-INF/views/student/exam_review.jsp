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
        <h1 class="title" style="margin: 0px ">
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
                                                 :alt="apps.media.fileName"  :key="mindex" style="width: 100%"/>
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
                                    </template>
                                    <span  v-else-if="item.answerType == 'image' " >
                                                <input type="button" name="numRadio" class="checkBtn uk-margin-remove"
                                                       style="padding-left: 0px;"
                                                       :value="aItem.optionNumber"   :class="{'answerFlag': aItem.selectedAnswer}"/>
                                                <img  :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.media.fileName"
                                                      :alt="aItem.media.fileName"  style="width: 300px !important;"
                                                      class="uk-margin-top uk-margin-left"/>
                                            </span>
                                    <div class="radio-numbers " v-else>
                                        <div class="uk-subnav" style="flex-wrap: unset; padding-left: 0px;">
                                            <input type="button" name="numRadio"
                                                   class="checkBtn" style="padding-left: 0px;"
                                                   :value="aItem.optionNumber"
                                                   :class="{'answerFlag': aItem.selectedAnswer}"/>
                                            <span class="answerMargin uk-margin-remove"  name="numRadio"
                                                  style="width: 90% !important;"
                                                  :class="{'answerTrue': aItem.selectedAnswer}"
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
                                               :value="aItem.optionNumber" :class="{'answerFlag': aItem.selectedAnswer}"/>
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
                                                       :value="aItem.optionNumber"   :class="{'answerFlag': aItem.selectedAnswer}"/>
                                                <img  :src="'http://103.41.247.45:80/webapps/uploadingDir/examanswer/' + aItem.media.fileName"
                                                      :alt="aItem.media.fileName"  style="width: 300px !important;"
                                                      class="uk-margin-top uk-margin-left"/>
                                            </span>
                                    <div class="radio-numbers " v-else>
                                        <div class="uk-subnav" style="flex-wrap: unset; padding-left: 0px;">
                                            <input type="button" name="numRadio"
                                                   class="checkBtn" style="padding-left: 0px;"
                                                   :value="aItem.optionNumber"
                                                   :class="{'answerFlag': aItem.selectedAnswer}"/>
                                            <span class="answerMargin uk-margin-remove"  name="numRadio"
                                                  style="width: 90% !important;"
                                                  :class="{'answerTrue': aItem.selectedAnswer}"
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
                            <div class="answers-exp mgt60" v-else>
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
                                                v-model="item.answerInputedData"
                                                style="border: 1px solid #ccc;padding: 10px;font-size: 17px;" >
                                            {{item.answerInputedData}}
                                        </mathlive-mathfield>
                                    </div>
                                    <div v-if="aItem.answerFlag == true || aItem.answerFlag == 'text' ">
                                        <div class="uk-flex uk-margin-bottom">
                                            <b>Guide text: </b>
                                            <p class="uk-margin-remove" style="padding-left: 15px;">
                                                {{aItem.answer}} </p>
                                        </div>
                                        
                                        <input type="text" class="txt-input" placeholder="정답을 입력해 주세요"
                                               v-model="questions[currentQuestion].answerInputedData"
                                               class="uk-width1-1" style="font-size: 16px; width: 100%;
													border: 1px solid #ccc;
													border-radius: 15px;
													padding: 8px;"/>
                                    </div>
                                </div>
                            </div>
    
                            <div class="answers-exp uk-margin-top">
                                <!-- <h2 class="title none">
									<span class="col-orange02">[정답]</span>
								</h2> -->
                                <div class="" v-if="item.incorrectNote != null">
                                    <h3 class="">hhhhhhhhhhhhhhh</h3>
                                    <p class="txt-subject uk-margin" ></p>
                                </div>
                                <div class="" v-else>
                                    <h3 class="txt-exp">[해설]</h3>
                                    <p class="txt-subject uk-margin"> Empty </p>
                                </div>
                            </div>
                        </div>
                        <div class="no_scroll_n">
                            더 이상의 스크롤이 없습니다.
                        </div>
                    </div>
                </div><!--// 문제 -->
<%--                <div class="explain-area right mobile-blind"><!-- 2020-02-27 -->--%>
<%--                    <a href="#" class="ex-listTab nth-3 on">전체문제</a>--%>
<%--                    <div class="list-area on">--%>
<%--                        <div class="popup-scroll height-type03 mgt15">--%>
<%--                            <ul class="list-basic uk-padding-remove">--%>
<%--                                <li v-for="(item,eindex) in questions" :key="eindex"--%>
<%--                                    @click="questionChange(eindex)"--%>
<%--                                    :class="{'changed': eindex == currentQuestion}">--%>
<%--                                    <span class="num-default uk-padding-remove" style="display: inline-block">{{eindex+1}}</span>--%>
<%--                                    <div uk-grid class="uk-margin-remove-left"  v-if="item.questionType == '4'"--%>
<%--                                         style="display:inline-block;">--%>
<%--                                        <p style="padding: 0" class="answer-text uk-margin-remove">그리기 문제</p>--%>
<%--                                    </div>--%>
<%--                                    <span class="answer-text uk-padding-remove"  v-else-if="item.questionType == '2'"--%>
<%--                                          style="position: absolute">--%>
<%--                                        <p style="padding-top: 4px">주관식 문제</p>--%>
<%--                                    </span>--%>
<%--                                    <label  class="" v-else v-for="(aitem,aindex) in item.answers" :key="aindex">--%>
<%--                                            <span class="number-txt" style="margin-right: 10px" :class="{'answerFlag': aitem.answerFlag}"--%>
<%--                                            >{{aindex+1}}</span>--%>
<%--                                    </label>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div><!--// 목록 -->--%>
                <div class="explain-area  right mobile-blind">
                    <ul class="uk-tab uk-margin-remove-bottom uk-flex uk-flex-right" data-uk-tab="{connect:'#my-id3'}">
                        <li id="tab1" class="tabnew"><a href="">전체문제</a></li>
                        <li id="tab2" class="tabnew"><a href="">틀린문제</a></li>
                        <li id="tab3" class="tabnew"><a href="">맞은문제</a></li>
<%--                        <li id="tab4" class="tabnew"><a href="">찜한문제</a></li>--%>
                    </ul>
                    <ul id="my-id3" class="uk-switcher">
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
                                        <template v-for="(item,eindex) in questions" :key="eindex">
                                            <li @click="webIndex(eindex)" class="like " v-if="item.like == '1'"
                                                :class="{'changed': eindex == currentQuestion}" >
                                                   <span class="num-default">{{eindex+1}}</span>
                                                   <span v-if="item.questionType == '4'">
                                                        <p
                                                                class="num-default uk-margin-remove ">그리기 문제</p>
                                                    </span>
                                                   <div class="answer-text" v-else-if="item.questionType == '2'">
                                                        <div v-for="(aitem,index) in item.answers" :key="index" >
                                                             <p v-if="aitem.answerFlag == 'math' ">
                                                                 <mathlive-mathfield
                                                                         :id="'mf'+index"
                                                                         :ref="'mathfield'+index"
                                                                         :config="{smartMode:true, readOnly: true}"
                                                                         @focus="ping"
                                                                         :on-keystroke="displayKeystroke"
                                                                         v-model="item.answerInputedData" >
                                                                    {{item.answerInputedData}}
                                                                </mathlive-mathfield>
                                                             </p>
                                                            <p v-else>
                                                                <input type="text" placeholder="주관식 문제"
                                                                       class="num-default uk-margin-remove" disabled
                                                                       :value="questions[currentQuestion].answerInputedData">
                                                            </p>
                                                        </div>
                                                    </div>
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
                    </ul>
<%--                    <ul class="uk-tab uk-flex uk-flex-right uk-margin-remove-bottom"--%>
<%--                        data-uk-tab="{connect:'#mexamId'}">--%>
<%--                        <li class="tabnew"><a href="" class="ex-listTab nth-1 on">전체문제</a></li>--%>
<%--                        <li class="tabnew"><a href="" class="ex-listTab nth-2">틀린문제</a></li>--%>
<%--                        <li class="tabnew"><a href="" class="ex-listTab nth-3">찜한문제</a></li>--%>
<%--                    </ul>--%>
<%--                    <ul id="mexamId" class="uk-switcher">--%>
<%--                        <li>--%>
<%--                            <div class="list-area on uk-margin-remove">--%>
<%--                                <div class="popup-scroll height-type01 mgt15">--%>
<%--                                    <ul class="list-basic uk-padding-remove">--%>
<%--                                        <template v-for="(item,eindex) in questions" :key="eindex">--%>
<%--                                            <li @click="webIndex(eindex)" class="like" v-if="item.like == '1'"--%>
<%--                                                :class="{'changed': eindex == currentQuestion}">--%>
<%--                                                <span class="num-default">{{eindex+1}}</span>--%>
<%--                                                <span v-if="item.questionType == '4'">--%>
<%--														<p class="num-default uk-margin-remove">그리기 문제</p>--%>
<%--													</span>--%>
<%--                                                <span class="answer-text" v-else-if="item.questionType == '2'">--%>
<%--&lt;%&ndash;														disabled&ndash;%&gt;--%>
<%--&lt;%&ndash;														<input type="text" placeholder="주관식 문제"&ndash;%&gt;--%>
<%--&lt;%&ndash;															   class="num-default uk-margin-remove"&ndash;%&gt;--%>
<%--&lt;%&ndash;															   :value="questions[currentQuestion].answerWrite">&ndash;%&gt;--%>
<%--														<p class="num-default uk-margin-remove" placeholder="주관식 문제"></p>--%>
<%--													</span>--%>
<%--                                                <label class="" v-else v-for="(aitem,aindex) in item.answers"--%>
<%--                                                       :key="aindex">--%>
<%--														<span class="number-txt" style="margin-right: 10px"--%>
<%--                                                              :class="{'answerFlag': aitem.selectedAnswer}"--%>
<%--                                                        >{{aindex+1}}</span>--%>
<%--                                                </label>--%>
<%--                                            </li>--%>
<%--                                            <li @click="webIndex(eindex)" class="like none" v-else--%>
<%--                                                :class="{'changed': eindex == currentQuestion}">--%>
<%--                                                <span class="num-default">{{eindex+1}}</span>--%>
<%--                                                <span v-if="item.questionType == '4'">--%>
<%--						                                                <p class="num-default uk-margin-remove">그리기 문제</p>--%>
<%--						                                            </span>--%>
<%--                                                <span class="answer-text" v-else-if="item.questionType == '2'">--%>
<%--						                                                <p class="num-default uk-margin-remove">주관식 문제</p>--%>
<%--						                                            </span>--%>
<%--                                                <label class="" v-else v-for="(aitem,aindex) in item.answers"--%>
<%--                                                       :key="aindex">--%>
<%--						                                            <span class="number-txt" style="margin-right: 10px"--%>
<%--                                                                          :class="{'answerFlag': aitem.selectedAnswer}"--%>
<%--                                                                    >{{aindex+1}}</span>--%>
<%--                                                </label>--%>
<%--                                            </li>--%>
<%--                                        </template>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="list-area on uk-margin-remove">--%>
<%--                                <div class="popup-scroll height-type01 mgt15">--%>
<%--                                    <ul class="list-basic uk-padding-remove">--%>
<%--                                        <li v-for="(item,eindex) in questions" :key="eindex"--%>
<%--                                            @click="webIndex(eindex)" v-if="item.selectedAnswer== false")--%>
<%--                                            :class="{'changed': eindex == currentQuestion}">--%>
<%--                                            <span class="num-default">{{eindex+1}}</span>--%>
<%--                                            <span v-if="item.questionType == '4'">--%>
<%--                                                    <p class="num-default uk-margin-remove">그리기 문제</p>--%>
<%--                                                </span>--%>
<%--                                            <span class="answer-text" v-else-if="item.questionType == '2'">--%>
<%--                                                    <p class="num-default uk-margin-remove">주관식 문제</p>--%>
<%--                                                </span>--%>
<%--                                            <label class="" v-else v-for="(aitem,aindex) in item.answers"--%>
<%--                                                   :key="aindex">--%>
<%--                                                    <span class="number-txt" style="margin-right: 10px"--%>
<%--                                                          :class="{'answerFlag': aitem.selectedAnswer}"--%>
<%--                                                    >{{aindex+1}}</span>--%>
<%--                                            </label>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="list-area on uk-margin-remove">--%>
<%--                                <div class="popup-scroll height-type01 mgt15">--%>
<%--                                    <ul class="list-basic uk-padding-remove">--%>
<%--                                        <template v-for="(item,eindex) in questions" :key="eindex">--%>
<%--                                            <li @click="webIndex(eindex)" class="like" v-if="item.like == '1'"--%>
<%--                                                :class="{'changed': eindex == currentQuestion}">--%>
<%--                                                <span class="num-default">{{eindex+1}}</span>--%>
<%--                                                <span v-if="item.questionType == '4'">--%>
<%--                                                        <p class="num-default uk-margin-remove">그리기 문제</p>--%>
<%--                                                    </span>--%>
<%--                                                <span class="answer-text" v-else-if="item.questionType == '2'">--%>
<%--                                                        <p class="num-default uk-margin-remove">주관식 문제</p>--%>
<%--                                                    </span>--%>
<%--                                                <label class="" v-else v-for="(aitem,aindex) in item.answers"--%>
<%--                                                       :key="aindex">--%>
<%--                                                        <span class="number-txt" style="margin-right: 10px"--%>
<%--                                                              :class="{'answerFlag': aitem.selectedAnswer}"--%>
<%--                                                        >{{aindex+1}}</span>--%>
<%--                                                </label>--%>
<%--                                            </li>--%>
<%--                                        </template>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
                </div>
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
                // this.userId = this.$route.params.userId
                // this.examId = this.$route.params.userId
                // this.getQuestions()
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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta property="og:image" content="">
	<meta property="og:image:width" content="1200">
	<meta property="og:image:height" content="628">
	<meta property="og:type" content="website">
	<meta name="theme-color" content="#">
	<meta name="msapplication-navbutton-color" content="rgb(251, 95, 51)">
	<meta name="apple-mobile-wep-app-status-bar-style" content="rgb(251, 95, 51)">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/home/style.css">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/home/reset.css">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/home/popup.css">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/uikit/uikit.css">
	
	
	<script src="${ASSETS}/script/vue/vue.js"></script>
	<script src="${ASSETS}/script/vue/axios.js"></script>
	<script src="https://unpkg.com/vuejs-datepicker"></script>
	<script src="${ASSETS}/script/uikit/uikit.js"></script>
	<script src="${ASSETS}/script/jquery.js"></script>
	<script src="${ASSETS}/script/blockUI.js" type="text/javascript"></script>
	<script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.3"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.22"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Date-picker itself -->
	<script src="https://cdn.jsdelivr.net/npm/pc-bootstrap4-datetimepicker@4.17/build/js/bootstrap-datetimepicker.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/pc-bootstrap4-datetimepicker@4.17/build/css/bootstrap-datetimepicker.min.css"
		  rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
		  integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<!-- Lastly add this package -->
	<script src="https://cdn.jsdelivr.net/npm/vue-bootstrap-datetimepicker@5"></script>
	<script src="${ASSETS}/script/uikit/modaledit.js"></script>


</head>
<body>
<section id="teacherhome">
	<div id="wrapper" class="section-portal teacher">
		<!-- 상단 메인보드 -->
		<div class="main-board">
			<!-- board -->
			<div class="board-area">
				<!-- head -->
				<div class="head">
					<h1 class="title">평가 보관함</h1>
					<div class="tab-main-menu">
						<a href="#" class="active"><span>평가 보관함</span></a>
						<a href="#"><span>대시보드</span></a>
					</div>
				</div>
				<!-- //head -->
				<div class="calendar-area">
					<p class="desc"><strong>김상우 선생님</strong>께 등록된 평가지에요. 등록 버튼을 클릭하여 평가를
						원하는 위두랑 클래스를 선택해주세요.</p>
				</div>
			</div>
			<!-- //board -->
		</div>
		<div class="tab_top_n01">
			<ul>
				<li class="on"><a href="#">내가 만든 평가</a></li>
				<li><a href="#">Edulap for Math</a></li>
			</ul>
		</div>
		<div class="content-board">
			<div class="class-btn">
				<button class="ftl">삭제</button>
				<button class="ftr">평가 만들기</button>
			</div>
			
			<!-- 모바일 대응 : 스크롤 타입 테이블 -->
			<div class="tb_mb_wrap">
				<table class="table-style">
					<caption>내가 만든 평가로 구성된 표</caption>
					<colgroup>
						<col style="width:3%;"/>
						<col style="width:11%;"/>
						<col style="width:10%;"/>
						<col style="width:8%;"/>
						<col style="width:8%;"/>
						<col style="width:11%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:5%;"/>
					</colgroup>
					<thead>
					<tr>
						<th>
							<span class="stg-check">
								<input type="checkbox" name="classChkAll" id="classChkAll" value="">
								<label for="classChkAll"></label>
							</span>
						</th>
						<th>
							<button class="btn-sort">평가일자</button>
						</th>
						<th>
							<button class="btn-sort">클래스 명</button>
						</th>
						<th>
							<button class="btn-sort">과목</button>
						</th>
						<th>
							<button class="btn-sort">평가명</button>
						</th>
						<th>
							<button class="btn-sort">문제 수<br> (미리보기)</button>
						</th>
						<th>
							<button class="btn-sort">응시학생 <br>(응답율)</button>
						</th>
						<th>
							<button class="btn-sort">평균점수 <br> (결과보기)</button>
						</th>
						<th>
							<button class="btn-sort">평균시간</button>
						</th>
						<th style="color: #fff">
							과제등록<br>
							(전송)
						</th>
						<th>
						
						</th>
					</tr>
					</thead>
					<tbody>
					<tr v-for="(item,index) in exams">
						<td>
							<span class="stg-check">
								<input type="checkbox" name="classChk" value="">
							</span>
						</td>
						<td>{{item.updateAt}}</td>
						<td>{{item.classRoom}}</td>
						<td>{{item.examSubject}}</td>
						<%--								<td>{{item.examSubject}}</td>--%>
						<td>{{item.examName}}</td>
						<td class="on">
							<a href="javascript:void(0)" class=""
							   @click="newtab('teacher/exam_check', item.id)">
								{{item.questionCount}}</a>
						</td>
						<td class="on">
							<a href="javascript:void(0)" class=""
							   @click="newtab('teacher/exam_result_see', item.id)">
								{{((item.givedUserCount/item.studentCount)*100).toFixed(2)}}%</a>
						</td>
						<td>
<%--							 v-if="exam.givedUserCount > 0"--%>
							<a href="" class="" @click="newtab2('teacher/students_total_score', item.id)"
							  >
								{{(item.totalScore/item.givedUserCount).toFixed(1)}}</a>
<%--							<p class="" v-else> _ </p>--%>
						</td>
						<td class="on"> {{item.averageTime}}</td>
						<td>
							<a class="clipboard" href="#urlPopup"
							   v-if="item.examStatus == 'finish'"
							   uk-toggle @click="urlCopy(item.id)">URL 복사</a>
							
							<a class="clipboard" href="#bigmodalone" uk-toggle="bg-close: false"
							   v-else @click="examIdcall(item.id)"> 등록</a>
							
							<div class="popup-dim url-popup" id="urlPopup" uk-modal>
								<div class="popup-layout">
									<!-- <a href="#" class="popup-close"><img src="../../assets/img/common/icon-popup-close.jpg" alt="닫기" /></a> -->
									<button class="uk-modal-close-default" type="button" uk-close></button>
									<p class="pop-title">URL 복사하기</p>
									<div class="uk-width-1-1@m uk-padding-small">
										<p class="uk-text-center ">
											아래 URL을 복사하여 학생들에게 공유해주세요. <br>(학생들은 로그인 후, 시험을 진행할 수 있습니다.)
										</p>
									</div>
									<div class="url-popup-wrap">
										<input type="text" class="url-input" id="clipInput"
											   :value="host+ `${examIdCopy}`"/>
									</div>
									<div class="uk-text-center uk-margin-top">
										<button class="uk-modal-close btn-black">취소</button>
										<%--										<button class="btn-orange uk-margin-left" v-clipboard:copy="host + examIdCopy"--%>
										<%--												v-clipboard:success="onCopy">복사</button>--%>
									</div>
								</div>
							</div>
							
							<div class="popup-dim wedo-popup" id="bigmodalone" style="padding-right: 700px"
								 data-uk-modal="bg-close: false">
								<div class="popup-layout" style="overflow: auto">
									<button class="uk-modal-close-default" type="button" uk-close></button>
									<p class="pop-title">위두랑 과제방 등록</p>
									<div class="url-popup-wrap" style="text-align:left;">
										<p class="p_s_tit">과제 발송 시간 설정</p>
										<div class="in_bx01">
											<ul>
												<li>
													<p class="ck_wp">
														<span class="stg-radio">
															<input type="radio" name="n_ty01"
																   id="n_ty01" value="">
															<label for="n_ty01">바로 전송</label>
														</span>
													</p>
												</li>
												<li>
													<p class="ck_wp">
														<span class="stg-radio">
															<input type="radio" name="n_ty01"
																   id="n_ty02" value="">
															<label for="n_ty02">예약 전송</label>
 														
															<button href="#modal-center" uk-toggle="bgclose: close"
																	class="uk-button uk-button-default uk-button-small"
															>{{exam.autoStart}}
															</button>
															
															<div id="modal-center" class="uk-flex-top" uk-modal>
																<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
																	<button class="uk-modal-close-default" type="button"
																			uk-close></button>
														 			<div class="uk-width-1-1 uk-margin-remove-left"
																		 uk-grid>
																		<date-picker v-model="exam.autoStart"
																					 class="uk-width-expand"
																					 :config="options"></date-picker>
																	<button
																			class="uk-button uk-button-primary uk-button-small uk-width-auto"
																			style="padding: 8px"
																			@click="examIdcall(eeid)"
																			href="#bigmodalone" uk-toggle>done
																	</button>
																	</div>
																</div>
															</div>
														</span>
													</p>
												</li>
											</ul>
										</div>
										
										<p class="p_s_tit">과제 진행 기간 설정</p>
										
										<div class="in_bx01">
											<ul>
												<li style="padding-left:0;">
													<div class="uk-width-1-1" uk-grid>
														<button href="#lifeDatepicker" uk-toggle
																class="uk-button uk-button-default uk-button-small"
														>{{exam.lifeStartDate}}
														</button>
														<button href="#lifeEndpicker" uk-toggle  style="padding-left:
														 80px;"
																class="uk-button uk-button-default uk-button-small "
														>{{exam.lifeEndDate}}
														</button>
													</div>
													<div id="lifeDatepicker" class="uk-flex-top" uk-modal>
														<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
															<button class="uk-modal-close-default" type="button"
																	uk-close></button>
															<div class="uk-width-1-1 uk-margin-remove-left"
																 uk-grid>
																<date-picker v-model="exam.lifeStartDate"
																			 class="uk-width-expand"
																			 :config="options"></date-picker>
																<button
																		class="uk-button uk-button-primary uk-button-small uk-width-auto"
																		style="padding: 8px"
																		@click="examIdcall(eeid)"
																		href="#bigmodalone" uk-toggle>done
																</button>
															</div>
														</div>
													</div>
													
													<div id="lifeEndpicker" class="uk-flex-top" uk-modal>
														<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
															<button class="uk-modal-close-default" type="button"
																	uk-close></button>
															<div class="uk-width-1-1 uk-margin-remove-left"
																 uk-grid>
																<date-picker v-model="exam.lifeEndDate"
																			 class="uk-width-expand"
																			 :config="options"></date-picker>
																<button
																		class="uk-button uk-button-primary uk-button-small uk-width-auto"
																		style="padding: 8px"
																		@click="examIdcall(eeid)"
																		href="#bigmodalone" uk-toggle>done
																</button>
															</div>
														</div>
													</div>
												</li>
											</ul>
										</div>
										
										<p class="p_s_tit">클래스 선택</p>
										<div class="in_bx02">
											<ul>
												<li v-for="(item,index) in allClase" :key="index">
													<span class="stg-check">
														 <input type="checkbox" id="item.id" value="true"
																 v-model="item.selected">
														<label for="item.id">{{item.id}} {{item.schoolName}}</label>
													</span>
												</li>
											</ul>
										</div>
										<div class="pagination" style="display: block;">
											<a href="#"><img
													src="${ASSETS}/img/common/icon-page-first.jpg" alt="처음으로"/></a>
											<a href="#"><img src="${ASSETS}/img/common/icon-page-prev.jpg"
															 alt="뒤로"/></a>
											<a href="#" class="on">1</a>
											<a href="#"><img src="${ASSETS}/img/common/icon-page-next.jpg" alt="앞으로"
											/></a>
											<a href="#"><img
													src="${ASSETS}/img/common/icon-page-last.jpg" alt="마지막으로"/></a>
										</div>
										<div class="btm_btns_n">
											<button class="btn-black uk-modal-close">취소</button>
											<button class="btn-orange uk-modal-close" @click="examStatusChange(eeid)">등록
											</button>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td class="uk-hidden-hover">
							<%--							 @click="reset(item.id)"--%>
							<button class="" style="width:50px; height: 50px;" uk-toggle="target: #modalreset"
									@click="examIdcall(item.id)">
							</button>
							
							<div id="modalreset" uk-modal>
								<div class="uk-modal-dialog">
									<button class="uk-modal-close-default" type="button" uk-close></button>
									<div class="uk-modal-header">
										<h2 class="" style="font-size: 18px; font-weight: 400">Reset</h2>
									</div>
									<div class="uk-modal-body">
										<p>Are you sure ?</p>
										<p>Do you wanna reset this question?</p>
									</div>
									<div class="uk-modal-footer uk-text-right">
										<button class="uk-button uk-button-default uk-modal-close uk-button-small"
												type="button">
											Cancel
										</button>
										<button class="uk-button uk-button-danger uk-modal-close uk-button-small"
												type="button"
												@click="reset(eeid)">
											Reset
										</button>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<%--					<tr v-for="(item,index) in exams">--%>
					<%--						<td>--%>
					<%--							<span class="stg-check">--%>
					<%--								<input type="checkbox" name="classChk" value="">--%>
					<%--							</span>--%>
					<%--						</td>--%>
					<%--						<td>{{item.updateAt.substring(0,10)}}</td>--%>
					<%--						<td>{{item.classRoom}}</td>--%>
					<%--						<td>{{item.examSubject}}</td>--%>
					<%--						&lt;%&ndash;								<td>{{item.examSubject}}</td>&ndash;%&gt;--%>
					<%--						<td>{{item.examName}}</td>--%>
					<%--						<td class="on">--%>
					<%--							<a href="javascript:void(0)" class=""--%>
					<%--							   @click="newtab('teacher/exam_check', item.id)">--%>
					<%--								{{item.questionCount}}</a>--%>
					<%--						</td>--%>
					<%--						<td class="on">--%>
					<%--							<a href="javascript:void(0)" class=""--%>
					<%--							   @click="newtab('teacher/exam_result_see', item.id)">--%>
					<%--								result</a>--%>
					<%--						</td>--%>
					<%--						<td>0</td>--%>
					<%--						<td class="on">0</td>--%>
					<%--						<td>--%>
					<%--							--%>
					<%--							--%>
					<%--							<a class="clipboard" href="#urlPopup"--%>
					<%--							   v-if="item.examStatus == 'finish'"--%>
					<%--							   uk-toggle  @click="urlCopy(item.id)">URL--%>
					<%--								복사</a>--%>
					<%--							<a class="clipboard" href="#bigmodalone" uk-toggle--%>
					<%--							   v-else--%>
					<%--							   @click="examIdcall(item.id)"> 등록</a>--%>
					<%--							--%>
					<%--							<div class="popup-dim url-popup" id="urlPopup" uk-modal>--%>
					<%--								<div class="popup-layout">--%>
					<%--									<!-- <a href="#" class="popup-close"><img src="../../assets/img/common/icon-popup-close.jpg" alt="닫기" /></a> -->--%>
					<%--									<button class="uk-modal-close-default" type="button" uk-close></button>--%>
					<%--									<p class="pop-title">URL 복사하기</p>--%>
					<%--									<div class="uk-width-1-1@m uk-padding-small">--%>
					<%--										<p class="uk-text-center ">--%>
					<%--											아래 URL을 복사하여 학생들에게 공유해주세요. <br>(학생들은 로그인 후, 시험을 진행할 수 있습니다.)--%>
					<%--										</p>--%>
					<%--									</div>--%>
					<%--									<div class="url-popup-wrap">--%>
					<%--										<input type="text" class="url-input" id="clipInput"--%>
					<%--											   :value="host+ `${examIdCopy}`"/>--%>
					<%--									</div>--%>
					<%--									<div class="uk-text-center uk-margin-top">--%>
					<%--										<button class="uk-modal-close btn-black">취소 </button>--%>
					<%--&lt;%&ndash;										<button class="btn-orange uk-margin-left" v-clipboard:copy="host + examIdCopy"&ndash;%&gt;--%>
					<%--&lt;%&ndash;												v-clipboard:success="onCopy">복사</button>&ndash;%&gt;--%>
					<%--									</div>--%>
					<%--								</div>--%>
					<%--							</div>--%>
					<%--						</td>--%>
					<%--						<td class="uk-hidden-hover">--%>
					<%--&lt;%&ndash;							 @click="reset(item.id)"&ndash;%&gt;--%>
					<%--							<button class="" style="width:50px; height: 50px;" uk-toggle="target: #modalreset"--%>
					<%--									@click="examIdcall(item.id)">--%>
					<%--							</button>--%>
					<%--	--%>
					<%--							<div id="modalreset" uk-modal>--%>
					<%--								<div class="uk-modal-dialog">--%>
					<%--									<button class="uk-modal-close-default" type="button" uk-close></button>--%>
					<%--									<div class="uk-modal-header">--%>
					<%--										<h2 class="" style="font-size: 18px; font-weight: 400">Reset</h2>--%>
					<%--									</div>--%>
					<%--									<div class="uk-modal-body">--%>
					<%--										<p>Are you sure ?</p>--%>
					<%--										<p>Do you wanna reset this question?</p>--%>
					<%--									</div>--%>
					<%--									<div class="uk-modal-footer uk-text-right">--%>
					<%--										<button class="uk-button uk-button-default uk-modal-close uk-button-small"--%>
					<%--												type="button">--%>
					<%--											Cancel</button>--%>
					<%--										<button class="uk-button uk-button-danger uk-modal-close uk-button-small"--%>
					<%--												type="button"--%>
					<%--												@click="reset(eeid)">--%>
					<%--											Reset</button>--%>
					<%--									</div>--%>
					<%--								</div>--%>
					<%--							</div>--%>
					<%--						</td>--%>
					<%--					</tr>--%>
					</tbody>
				</table>
			</div>
			
			<div class="each_mobile-wrap">
				<div class="tp_rad_n01">
							<span class="stg-check">
								<input type="checkbox" name="ty_n01" id="11" value="">
								<label for="11"></label>
							</span>
				</div>
				<table class="table-style">
					<caption>내가 만든 평가로 구성된 표</caption>
					<colgroup>
						<col style="width:25%"/>
						<col style="width:25%"/>
						<col style="width:25%"/>
						<col style="width:25%"/>
					</colgroup>
					<thead>
					<tr>
						<th colspan="2">평가일자</th>
						<th colspan="2">클래스명</th>
					</tr>
					<tr>
						<th colspan="2">과목</th>
						<th colspan="2">평가명</th>
					</tr>
					</thead>
					<tbody v-for="(item,index) in exams" :key="index">
					<tr>
						<td class="w32">{{item.updateAt}}</td>
						<td colspan="3">{{item.classRoom}}</td>
					</tr>
					<tr>
						<td class="w32">{{item.examSubject}}</td>
						<td colspan="3">{{item.examName}}</td>
					</tr>
					<tr class="bg-gray tac">
						<td>문제수</td>
						<td>응시학생수</td>
						<td>평균점수</td>
						<td>과제등록</td>
					</tr>
					<tr class="last tac">
						<td><a @click="newtab('teacher/exam_check', item.id)">
							{{item.questionCount}}</a></td>
						<td>
							<a href="" class="" @click="newtab2('teacher/students_total_score', item.id)"
							   v-if="item.givedUserCount > 0">
								{{(exam.totalScore/exam.givedUserCount).toFixed(1)}}</a>
							<p class="" v-else> _ </p>
						</td>
						<td>
							{{exam.averageTime}}
						</td>
						<td>
							<button class="clipboard">URL 복사</button>
						</td>
					</tr>
					</tbody>
				</table>
				
				<div class="tp_rad_n01">
					<span class="stg-check">
						<input type="checkbox" name="ty_n01" id="ty_n01_01" value="">
						<label for="ty_n01_01"></label>
					</span>
				</div>
			
			</div>
			<div class="pagination" style="display: block;">
				<a
						href="javascript:void(0)"><img src="${ASSETS}/images/bg-pagination-first.png"
													   @click="firstQuestion()"
													   alt="처음으로"/></a>
				<a href="javascript:void(0)"><img src="${ASSETS}/images//bg-pagination-prev.png"
												  @click="prevQuestion()"
												  alt="뒤로"/></a>
				<template v-for="(item,index) in pages" :key="index"
						  v-if="Math.abs(item - currentPage) < 3 || item == pages || item == 1">
					<a href="javascript:void(0)" @click="questionCurrent(item)" :class="{
						'activePagination': currentPage === item,
					last: (item == pages && Math.abs(item - currentPage) > 3),
					first: (item == 1 && Math.abs(item - currentPage) > 3)}" >{{item}}</a>
				</template>
				<a href="javascript:void(0)"><img src="${ASSETS}/images//bg-pagination-next.png"
												  @click="nextQuestion()"
												  alt="앞으로"/></a>
				<a href="javascript:void(0)"><img src="${ASSETS}/images//bg-pagination-last.png"
												  @click="lastQuestion()"
												  alt="마지막으로"/></a>
			</div>
<%--			<div class="pagination">--%>
<%--				<a--%>
<%--						href="javascript:void(0)"><img src="${ASSETS}/images/bg-pagination-first.png"--%>
<%--													   @click="firstQuestion()"--%>
<%--													   alt="처음으로"/></a>--%>
<%--				<a--%>
<%--						href="javascript:void(0)"><img src="${ASSETS}/images//bg-pagination-prev.png"--%>
<%--													   @click="prevQuestion()"--%>
<%--													   alt="뒤로"/></a>--%>
<%--				<template v-for="(item,index) in pages" :key="index"--%>
<%--						  v-if="Math.abs(item - currentPage) < 3 || item == pages || item == 1">--%>
<%--					<a href="javascript:void(0)" @click="questionCurrent(item)" :class="{--%>
<%--						'activePagination': currentPage === item,--%>
<%--						last: (item == pages && Math.abs(item - currentPage) > 3),--%>
<%--						first: (item == 1 && Math.abs(item - currentPage) > 3)}">{{item}}</a>--%>
<%--				</template>--%>
<%--				<a href="javascript:void(0)">--%>
<%--					<img src="${ASSETS}/images//bg-pagination-next.png" @click="nextQuestion()"--%>
<%--						 alt="앞으로"/></a>--%>
<%--				<a href="javascript:void(0)">--%>
<%--					<img src="${ASSETS}/images//bg-pagination-last.png" @click="lastQuestion()"--%>
<%--						 alt="마지막으로"/></a>--%>
<%--			</div>--%>
		</div>
	</div>
</section>

<script type="module">
    Vue.component('date-picker', VueBootstrapDatetimePicker);
    var app = new Vue({
        el: '#teacherhome',
        components: {
            vuejsDatepicker,
        },
        data() {
            return {
                options: {
                    format: 'DD/MM/YYYY h:mm:ss',
                    useCurrent: false,
                    showClear: true,
                    showClose: true,
                },
                exams: [],
                end: 'end',
                eeid: 0,
                examIdCopy: 0,
                copiedText: 'http://103.41.247.45:81/',
                host: '',
                exam: {
                    examName: '',
                    examType: '',
                    lifeStartDate: '14/04/2020 , 12:12:12',
                    lifeEndDate: '12/12/2020 , 12:12:12',
                    examFee: '',
                    examStatus: 'finish',
                    autoStart: '20/04/2020 , 12:12:01',
                },
                allClase:[
					{
					    classId : '1',
						year: '2020/12/12',
						schoolName: 'ICT 맞춤형 클래스',
						groupName: 'ICT 맞춤형 클래스',
						photo: 'change',
						selected : false
					},
                    // {
                    //     classId : '2',
                    //     year: '2020/12/12',
                    //     schoolName: '위두랑 클래스 2',
                    //     groupName: 'Tseekuu group',
                    //     photo: 'change2',
                    //     selected : false
                    // },
                    // {
                    //     classId : '3',
                    //     year: '2020/12/12',
                    //     schoolName: '위두랑 클래스 5',
                    //     groupName: 'Tseke group',
                    //     photo: 'change3',
                    //     selected : false
                    // },
                    // {
                    //     classId : '4',
                    //     year: '2020/12/12',
                    //     schoolName: '위두랑 클래스 7',
                    //     groupName: 'Anand group',
                    //     photo: 'change4',
                    //     selected : false
                    // },
                    // {
                    //     classId : '5',
                    //     year: '2020/12/12',
                    //     schoolName: '위두랑 클래스 4',
                    //     groupName: 'My group',
                    //     photo: 'change5',
                    //     selected : false
                    // }
				],
                oId: '',
                currentPage: 1,
                pages: 0,
                itemsPerPage: 1,
                totalQuestionNumber: 0,
                userId: 0,
                linkPath: 'http://103.41.247.45/kerisexam',
                // localPath: 'http://localhost:8084/exam'
                localPath: 'http://devasse.edunet.net:8000/exam',
            }
        },

        watch: {},

        computed: {
            paginate: function () {
                if (!this.exams || this.exams.length != this.exams.length) {
                    return
                }
                this.resultCount = this.exams.length
                if (this.currentPage >= this.pages) {
                    this.currentPage = this.pages
                }
                var index = this.currentPage * this.itemsPerPage - this.itemsPerPage
                return this.exams.slice(index, index + this.itemsPerPage)
            }
        },
        mounted() {
        },
        created() {
            this.loaddata();
        },
        filters: {},
        methods: {
            async classListAdd(examId){

                console.log("all classes  seles e ee is here ")
                console.log(this.allClase.length)
				
				
                let activeClass = []

               for (let i = 0; i > this.allClase.length; i++){
               
				  	if( this.allClase[i].selected == true){
				  	    
                        console.log("send classess")
                        console.log(this.allClase[i])
				  	     
                        let item = {
							classId : this.allClase[i].classId,
							year : this.allClase[i].year,
							schoolName: this.allClase[i].schoolName,
							groupName: this.allClase[i].groupName,
							photo: this.allClase[i].photo
                        }
                        
                        
                        console.log(";;;;;;;;;;;;;;;;;;")
                        activeClass.push(item)
					}
				  	else{
                        console.log("lofe is good official")
					}
				}
              
              axios.post('${BASEURL}/exam/classes',{
                  classes: activeClass,
                  examId: examId
			  }).then((response)=>{
                  console.log(response);
				  
			  })
			},
            customFormatter(date) {
                return moment(date).format('MMMM Do YYYY, h:mm:ss a');
            },
            examIdcall(item) {
                this.eeid = item
                console.log("eeid is ::" + this.eeid)
            },
            newtab2(link, id) {

                var loginId = '${sessionScope.loginId}';
                this.userId =loginId
				
                window.open(this.localPath + "/" + link + "?examId=" + id + "&userId=" + this.userId,
                    '_blank', 'width=620, height=881')
            },
            newtab(link, id) {
                
                var loginId = '${sessionScope.loginId}';
                this.userId =loginId
				
                window.open(this.localPath + "/" + link + "?examId=" + id + "&userId=" + this.userId,
                    '_blank',
                    'width=1240,height=800')

                // window.location.href= "http://localhost:8088/exam/"+ link +"?id=" + id,target ="_blank","width=1170,height=700"

                <%-- let route = this.$router.resolve({name: link, params: {examId: id}});--%>
                <%-- window.open(route.href, '_blank','width=1240,height=652');--%>

                <%--localStorage.setItem('questionId', JSON.stringify(id));--%>
                <%--const questionId = JSON.parse(localStorage.getItem('questionId'));--%>
                <%--window.location.href= "${HOME}/question_registration/each/preview/preview?id=" + id--%>
            },
            async reset(Id) {
                try {
                    var loginId = '${sessionScope.loginId}';
                    const headers = {
                        'Content-Type': 'application/json',
                    }
                    var _this = this
                    axios.post('${BASEURL}/exam/reset', {
                        examId: Id,
						loginId: loginId
                    }, {
                        headers: headers
                    }).then(function (response) {
                        if (response.status == 200) {
                            alert("Success")
                            _this.loaddata()
                        } else {
                            alert("Error")
                        }
                    }, (error) => {
                        console.log(error);
                        alert('Error')
                    });

                } catch (error) {
                    console.log(error);
                }
            },
            async examStatusChange(item) {
                try {
                    var loginId = '${sessionScope.loginId}';
                    const headers = {
                        'Content-Type': 'application/json',
                    }
                    
                    var _this = this
                    axios.post('${BASEURL}/exam/examstatus',
                        {
                            examId: item,
                            examStatus: this.exam.examStatus,
                            loginId: loginId
                        }, {headers: headers}).then(function (response) {
                        if (response.status == 200) {
                            alert("exam status changed!!!")
                            _this.loaddata()
                        } else {
                            alert("request failed")
                        }
                    }, function (error) {
                        console.log("axios error found")
                        console.log(error);
                    });

                } catch (error) {
                    console.log(error);

                }
            },

            async loaddata(page) {
                try {
                    console.log("heelooo")

                    var loginId = '${sessionScope.loginId}';
                    console.log(loginId)
					
                    const headers = {
                        'Content-Type': 'application/json'
                    }
                    // $.blockUI({message: '<span> Loading...</span>'});

                    var _this = this;
                    var _$ = $

                    if (page > 0) {
                        page = page - 1
                    }

                    axios.get('${BASEURL}/exam/list/?size=8', {
                        params: {
                            page: page,
                            examId: this.exam.id,
                            examName: this.exam.examName,
                            
                        },loginId: loginId,
                        headers: headers
                    }).then(function (response) {
                        // _$.unblockUI()

                        if (response.status == 200) {
                            
                            for (let i = 0; i < response.data.content.length; i++) {

                                if (response.data.content[i].totalTime == 0) {
                                    response.data.content[i].averageTime = ""
                                }
                                else{
                                    let time =  response.data.content[i].totalTime / response.data.content[i].givedUserCount
                                    // console.log(time);
                                    time = parseInt(time);
                                    let hours = Math.floor(time / 3600);
                                    time %= 3600;
                                    let minutes = Math.floor(time / 60);
                                    let seconds = time % 60;
                                    response.data.content[i].averageTime =  hours +":"+ minutes +":"+ seconds
                                }
                            }
                            
                            console.log(response.data);
                            _this.exams = response.data.content
                    		_this.pages = response.data.totalPages
                            console.log(_this.pages)
                    		_this.totalElements = response.data.totalElements
                            // _$.unblockUI()
                        } else {
                            alert("request failed")
                        }
                    }, function (error) {
                        console.log("axios error found")
                        console.log(error);
                        // _$.unblockUI
                    });

                } catch (error) {
                    console.log("try catch error found")
                    console.log(error)
                }
            },
            questionCurrent(item) {
                this.currentPage = item
                this.loaddata(this.currentPage)
            },
            nextQuestion() {
                if (this.pages > this.currentPage) {
                    this.currentPage = this.currentPage + 1
                    this.loaddata(this.currentPage)
                }
            },
            prevQuestion() {
                if (this.currentPage > 1) {
                    this.currentPage = this.currentPage - 1
                    this.loaddata(this.currentPage)
                }
            },
            lastQuestion() {
                this.currentPage = this.pages
                this.loaddata(this.currentPage)
            },
            firstQuestion() {
                this.currentPage = 1
                this.loaddata(this.currentPage)
            },
        }
    })
    // app.$mount('#teacherhome')
</script>
</body>
</html>

<%--	<div class="">--%>
<%--		<page-header/>--%>
<%--		<div id="container">--%>
<%--			<section class="contents storage">--%>
<%--				--%>
<%--				<section class="storage-contents">--%>
<%--					<div id="sub_contents" class="wrap">--%>
<%--						<div class="make-wrap">--%>
<%--							<!-- <ul class="storage-menu teacher mid">--%>
<%--								<li>--%>
<%--									<a href="./04-storage-0101.html">내가 만든 평가</a>--%>
<%--								</li>--%>
<%--								<li class="on">--%>
<%--									<a href="./04-storage-0102.html">Edulap for Math</a>--%>
<%--								</li>--%>
<%--							</ul> -->--%>
<%--							--%>
<%--							<div class="class-btn">--%>
<%--								<button class="ftl">삭제</button>--%>
<%--								<button class="ftr">평가 만들기</button>--%>
<%--							</div>--%>
<%--							--%>
<%--							<!-- 모바일 대응 : 스크롤 타입 테이블 -->--%>
<%--							<!-- 2020-02-29 -->--%>
<%--							<div class="tb_mb_wrap">--%>
<%--								<table class="table-style">--%>
<%--									<caption>내가 만든 평가로 구성된 표</caption>--%>
<%--									<colgroup>--%>
<%--										<col style="width:10%;" />--%>
<%--										<col style="width:8%;" />--%>
<%--										<col style="width:*;" />--%>
<%--										<col style="width:8%;" />--%>
<%--										<col style="width:*;" />--%>
<%--										<col style="width:10%;" />--%>
<%--										<col style="width:10%;" />--%>
<%--										<col style="width:10%;" />--%>
<%--										<col style="width:9%;" />--%>
<%--										<col style="width:10%;" />--%>
<%--									</colgroup>--%>
<%--									<thead>--%>
<%--									<tr >--%>
<%--										<th>--%>
<%--											<button class="btn-sort">평가일자 </button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">학년</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">클래스명</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">과목</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">평가명</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">문제수<br>(미리보기)</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">응시학생수<br>(응답율) </button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">평균점수 <br>(결과보기)</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">평균풀이<br>시간</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--											<button class="btn-sort">과제등록<br>(전송)</button>--%>
<%--										</th>--%>
<%--										<th>--%>
<%--										</th>--%>
<%--									</tr>--%>
<%--									</thead>--%>
<%--									<tbody>--%>
<%--									<tr v-for="(exam,index) in exams" :key="index">--%>
<%--										<td>{{exam.examSdate|moment}}</td>--%>
<%--										<td>--%>
<%--											{{exam.kurs}}--%>
<%--										</td>--%>
<%--										<td>{{exam.classRoom}}</td>--%>
<%--										<td>{{exam.examType}}</td>--%>
<%--										<td>{{exam.examName}}</td>--%>
<%--										<td>--%>
<%--											<a href="javascript:void(0)" class="" @click="newtab('solving0302_ty02', exam.id)">--%>
<%--												{{exam.questionCount}}</a>--%>
<%--											<!-- <a href="javascript:void(0)" class="" @click="newtab('solving0302_ty02', exam.id)">--%>
<%--											999</a> -->--%>
<%--										</td>--%>
<%--										<td>--%>
<%--											<a href="" class="" @click="newtab('solving0302', exam.id)">--%>
<%--												{{((exam.givedUserCount/exam.studentCount)*100).toFixed(2)}}%</a>--%>
<%--										</td>--%>
<%--										<td>--%>
<%--											<a href="" class="" @click="newtab2('storage0204_pop', exam.id)" v-if="exam.givedUserCount > 0">--%>
<%--												{{(exam.totalScore/exam.givedUserCount).toFixed(1)}}</a>--%>
<%--											<p class="" v-else> _ </p>--%>
<%--										</td>--%>
<%--										<td>--%>
<%--											{{exam.averageTime}}--%>
<%--										</td>--%>
<%--										<td>--%>
<%--											<div class="make-btn-wrap">--%>
<%--												<!-- <a href="javascript:;" class="bt_add_hw wedo-popOpen">등록</a> -->--%>
<%--												<a class="bt_add_hw" href="#bigmodalone" uk-toggle v-if="exam.examStatus == 'register'"--%>
<%--												   @click="examIdcall(exam.id)"> 등록</a>--%>
<%--												<!-- <p class="uk-text-success" v-else-if="exam.examStatus == 'finish'--%>
<%--												&& exam.givedUserCount == 0">초기화</p> -->--%>
<%--												<a class="bt_add_hw" href="#urlPopup" uk-toggle v-else @click="urlCopy(exam.id)">URL 복사</a>--%>
<%--												<div class="popup-dim wedo-popup" id="bigmodalone" uk-modal>--%>
<%--													<div class="popup-layout" style="overflow: auto">--%>
<%--														<button class="uk-modal-close-default" type="button" uk-close></button>--%>
<%--														<p class="pop-title">위두랑 과제방 등록</p>--%>
<%--														<div class="url-popup-wrap" style="text-align:left;">--%>
<%--															<p class="p_s_tit">과제 발송 시간 설정</p>--%>
<%--															<div class="in_bx01">--%>
<%--																<ul>--%>
<%--																	<li>--%>
<%--																		<p class="ck_wp">--%>
<%--                                                                                        <span class="stg-radio">--%>
<%--                                                                                            <input type="radio" name="n_ty01" id="n_ty01" value="">--%>
<%--                                                                                            <label for="n_ty01">바로 전송</label>--%>
<%--                                                                                        </span>--%>
<%--																		</p>--%>
<%--																	</li>--%>
<%--																	<li>--%>
<%--																		<p class="ck_wp">--%>
<%--                                                                                        <span class="stg-radio">--%>
<%--                                                                                            <input type="radio" name="n_ty01" id="n_ty02" value="">--%>
<%--                                                                                            <label for="n_ty02">예약 전송</label>--%>
<%--                                                                                        </span>--%>
<%--																		</p>--%>
<%--																		<select class="sel_ty01">--%>
<%--																			<option>2020</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">년</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>12</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">월</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>20</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">일</span>--%>
<%--																		<span class="line">/</span>--%>
<%--																		<select class="sel_ty02 sepa">--%>
<%--																			<option>12</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">시</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>20</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01 last">분</span>--%>
<%--																	</li>--%>
<%--																	<!-- <li>--%>
<%--																		<p class="ck_wp">--%>
<%--																			<span class="stg-radio">--%>
<%--																				<input type="radio" name="n_ty01" id="n_ty02" value="">--%>
<%--																				<label for="n_ty02">url 전송</label>--%>
<%--																			</span>--%>
<%--																		</p>--%>
<%--																		<div class="url-popup-wrap uk-margin-remove" uk-grid>--%>
<%--																			<input type="text" class="url-input  uk-width-expand@m" id="clipInput"--%>
<%--																				placeholder="https://www.url.co.kr/test/test.jsp?cont_id=21335334244" />--%>
<%--																			<button class="btn-black uk-width-auto@m uk-padding-remove" onclick="copy_to_clipboard()"--%>
<%--																				style="background: #fb5f33!important">복사</button>--%>
<%--																		</div>--%>
<%--																	</li> -->--%>
<%--																</ul>--%>
<%--															</div>--%>
<%--															--%>
<%--															<p class="p_s_tit">과제 진행 기간 설정</p>--%>
<%--															--%>
<%--															<div class="in_bx01">--%>
<%--																<ul>--%>
<%--																	<li style="padding-left:0;">--%>
<%--																		<select class="sel_ty01">--%>
<%--																			<option>2020</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">년</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>12</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">월</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>20</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">일</span>--%>
<%--																		<span class="line">/</span>--%>
<%--																		<select class="sel_ty02 sepa">--%>
<%--																			<option>12</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">시</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>20</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">분</span>--%>
<%--																		<span class="tx_n01 last">~</span>--%>
<%--																	</li>--%>
<%--																	<li style="padding-left:0;">--%>
<%--																		<select class="sel_ty01">--%>
<%--																			<option>2020</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">년</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>12</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">월</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>20</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">일</span>--%>
<%--																		<span class="line">/</span>--%>
<%--																		<select class="sel_ty02 sepa">--%>
<%--																			<option>12</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01">시</span>--%>
<%--																		<select class="sel_ty02">--%>
<%--																			<option>20</option>--%>
<%--																		</select>--%>
<%--																		<span class="tx_n01 last">분</span>--%>
<%--																	</li>--%>
<%--																</ul>--%>
<%--															</div>--%>
<%--															--%>
<%--															<p class="p_s_tit">클래스 선택</p>--%>
<%--															<div class="in_bx02">--%>
<%--																<ul>--%>
<%--																	<li>--%>
<%--                                                                                    <span class="stg-check">--%>
<%--                                                                                        <input type="checkbox" name="n_ty03_01" id="n_ty03_01" value="">--%>
<%--                                                                                        <label for="n_ty03_01">달성 10분 - 12</label>--%>
<%--                                                                                    </span>--%>
<%--																	</li>--%>
<%--																	<li>--%>
<%--                                                                                    <span class="stg-check">--%>
<%--                                                                                        <input type="checkbox" name="n_ty03_02" id="n_ty03_02" value="">--%>
<%--                                                                                        <label for="n_ty03_02">달성 10분 - 11</label>--%>
<%--                                                                                    </span>--%>
<%--																	</li>--%>
<%--																	<li>--%>
<%--                                                                                    <span class="stg-check">--%>
<%--                                                                                        <input type="checkbox" name="n_ty03_03" id="n_ty03_03" value="">--%>
<%--                                                                                        <label for="n_ty03_03">달성 10분 - 테스트</label>--%>
<%--                                                                                    </span>--%>
<%--																	</li>--%>
<%--																	<li>--%>
<%--                                                                                    <span class="stg-check">--%>
<%--                                                                                        <input type="checkbox" name="n_ty03_04" id="n_ty03_04" value="">--%>
<%--                                                                                        <label for="n_ty03_04">달성 10분 - 07</label>--%>
<%--                                                                                    </span>--%>
<%--																	</li>--%>
<%--																	<li>--%>
<%--                                                                                    <span class="stg-check">--%>
<%--                                                                                        <input type="checkbox" name="n_ty03_05" id="n_ty03_05" value="">--%>
<%--                                                                                        <label for="n_ty03_05">달성 10분 - 06</label>--%>
<%--                                                                                    </span>--%>
<%--																	</li>--%>
<%--																</ul>--%>
<%--															</div>--%>
<%--															--%>
<%--															<div class="pagination">--%>
<%--																<a href="#"><img src="../../assets/img/common/icon-page-first.jpg" alt="처음으로" /></a>--%>
<%--																<a href="#"><img src="../../assets/img/common/icon-page-prev.jpg" alt="뒤로" /></a>--%>
<%--																<a href="#" class="on">1</a>--%>
<%--																<a href="#">2</a>--%>
<%--																<a href="#">3</a>--%>
<%--																<a href="#">4</a>--%>
<%--																<a href="#">5</a>--%>
<%--																<a href="#"><img src="../../assets/img/common/icon-page-next.jpg" alt="앞으로" /></a>--%>
<%--																<a href="#"><img src="../../assets/img/common/icon-page-last.jpg" alt="마지막으로" /></a>--%>
<%--															</div>--%>
<%--															--%>
<%--															<div class="btm_btns_n">--%>
<%--																<button class="btn-black uk-modal-close">취소</button>--%>
<%--																<button class="btn-orange uk-modal-close" @click="examStatus(eeid)">등록</button>--%>
<%--															</div>--%>
<%--														</div>--%>
<%--													</div>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--										</td>--%>
<%--										<td class="uk-hidden-hover">--%>
<%--											<button class="" @click="reset(exam.id)"--%>
<%--													style="width:50px; height: 50px;">--%>
<%--											</button>--%>
<%--										</td>--%>
<%--									</tr>--%>
<%--									</tbody>--%>
<%--								</table>--%>
<%--							</div>--%>
<%--							--%>
<%--							<div class="each_mobile-wrap">--%>
<%--								<table class="table-style">--%>
<%--									<caption>내가 만든 평가로 구성된 표</caption>--%>
<%--									<colgroup>--%>
<%--										<col style="width:25%" />--%>
<%--										<col style="width:25%" />--%>
<%--										<col style="width:25%" />--%>
<%--										<col style="width:25%" />--%>
<%--									</colgroup>--%>
<%--									<thead>--%>
<%--									<tr>--%>
<%--										<th colspan="2">평가일자</th>--%>
<%--										<th colspan="2">클래스명</th>--%>
<%--									</tr>--%>
<%--									<tr>--%>
<%--										<th colspan="2">과목</th>--%>
<%--										<th colspan="2">평가명</th>--%>
<%--									</tr>--%>
<%--									</thead>--%>
<%--									<tbody v-for="(exam,index) in exams" :key="index">--%>
<%--									<tr>--%>
<%--										<td class="w32">{{exam.examSdate|moment}}</td>--%>
<%--										<td colspan="3">{{exam.classRoom}}</td>--%>
<%--									</tr>--%>
<%--									<tr>--%>
<%--										<td>{{exam.examType}}</td>--%>
<%--										<td colspan="2">{{exam.examName}}</td>--%>
<%--										<td class="tac">--%>
<%--											<a class="bt_add_hw" href="#bigmodalone" uk-toggle v-if="exam.examStatus == 'register'"--%>
<%--											   @click="examIdcall(exam.id)"> 등록</a>--%>
<%--											<!-- <a class="bt_add_hw" v-if="exam.examStatus == 'register'"> 등록</a> -->--%>
<%--											<button class="clipboard url-popOpen" v-else--%>
<%--													href="#urlPopup" uk-toggle @click="urlCopy(exam.id)">URL 복사</button>--%>
<%--										</td>--%>
<%--									</tr>--%>
<%--									--%>
<%--									<tr class="bg-gray tac">--%>
<%--										<td>문제수 <br>(미리보기)</td>--%>
<%--										<td>응시학생수<br>(응답율)</td>--%>
<%--										<td>평균점수<br>(결과보기)</td>--%>
<%--										<td>평균풀이<br>시간</td>--%>
<%--									</tr>--%>
<%--									<tr class="last tac">--%>
<%--										<td>--%>
<%--											<a href="javascript:void(0)" class="" @click="newtab('solving0302_ty02', exam.id)">--%>
<%--												{{exam.questionCount}}</a>--%>
<%--										</td>--%>
<%--										<td>--%>
<%--											<!-- <a href="../viewer/02-solving-0201.html" onClick="window.open(this.href, '', 'width=1140, height=762'); return false;" target="_blank">15</a> -->--%>
<%--											<a href="" class="" @click="newtab('solving0302', exam.id)">--%>
<%--												{{exam.givedUserCount}}</a>--%>
<%--										</td>--%>
<%--										<td>--%>
<%--											<a href="" class="" @click="newtab2('storage0204_pop', exam.id)" v-if="exam.givedUserCount > 0">--%>
<%--												{{(exam.totalScore/exam.givedUserCount).toFixed(1)}}</a>--%>
<%--											<p class="" v-else> _ </p>--%>
<%--											<!-- <a href="#" class="appraisal-popOpen">80</a> -->--%>
<%--										</td>--%>
<%--										<td>--%>
<%--											{{exam.averageTime}}--%>
<%--										</td>--%>
<%--									</tr>--%>
<%--									</tbody>--%>
<%--								</table>--%>
<%--							</div>--%>
<%--							--%>
<%--							<div class="popup-dim url-popup" id="urlPopup" uk-modal>--%>
<%--								<div class="popup-layout">--%>
<%--									<!-- <a href="#" class="popup-close"><img src="../../assets/img/common/icon-popup-close.jpg" alt="닫기" /></a> -->--%>
<%--									<button class="uk-modal-close-default" type="button" uk-close></button>--%>
<%--									<p class="pop-title">URL 복사하기</p>--%>
<%--									<div class="uk-width-1-1@m uk-padding-small">--%>
<%--										<p class="uk-text-center ">--%>
<%--											아래 URL을 복사하여 학생들에게 공유해주세요. <br>(학생들은 로그인 후, 시험을 진행할 수 있습니다.)--%>
<%--										</p>--%>
<%--									</div>--%>
<%--									<div class="url-popup-wrap">--%>
<%--										<input type="text" class="url-input" id="clipInput"--%>
<%--											   :value="host+ `${examIdCopy}`"/>--%>
<%--									</div>--%>
<%--									<div class="uk-text-center uk-margin-top">--%>
<%--										<button class="uk-modal-close btn-black">취소 </button>--%>
<%--										<button class="btn-orange uk-margin-left" v-clipboard:copy="host + examIdCopy"--%>
<%--												v-clipboard:success="onCopy">복사</button>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--							<!--// 모바일 대응 : 모바일용 각벌 형식 -->--%>
<%--							--%>
<%--							<!-- <div class="pagination">--%>
<%--								<a href="#"><img src="../../assets/img/common/icon-page-first.jpg" alt="처음으로" /></a>--%>
<%--								<a href="#"><img src="../../assets/img/common/icon-page-prev.jpg" alt="뒤로" /></a>--%>
<%--								<a href="#" class="on">1</a>--%>
<%--								<a href="#"><img src="../../assets/img/common/icon-page-next.jpg" alt="앞으로" /></a>--%>
<%--								<a href="#"><img src="../../assets/img/common/icon-page-last.jpg" alt="마지막으로" /></a>--%>
<%--							</div> -->--%>
<%--							<div class="uk-card-footer uk-text-center uk-padding-small">--%>
<%--								<div class="uk-flex uk-flex-center" >--%>
<%--									<v-pagination--%>
<%--											style-="color: black"--%>
<%--											v-model="currentPage"--%>
<%--											:page-count="pages"--%>
<%--											:classes="uikitClasses"--%>
<%--											:labels="Labels"--%>
<%--											@change="onChange"--%>
<%--									></v-pagination>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</section>--%>
<%--				<!--// 내가 만든 평가 -->--%>
<%--			</section>--%>
<%--			<!--// 보관함 -->--%>
<%--		</div>--%>
<%--		<page-footer/>--%>
<%--	</div>--%>
<%--<script>--%>
<%--    import $ from 'jquery'--%>
<%--    import PageHeader from '../_layout/header-after'--%>
<%--    import PageFooter from '../_layout/footer'--%>
<%--    import services from "../../services/AllServices"--%>
<%--    import vPagination from "vue-plain-pagination"--%>
<%--    import UIkit from 'uikit'--%>
<%--    import moment from "moment"--%>
<%--    export default {--%>
<%--        components:{--%>
<%--            PageHeader,--%>
<%--            PageFooter,--%>
<%--            vPagination--%>
<%--        },--%>
<%--        data(){--%>
<%--            return {--%>
<%--                exams: [],--%>
<%--                examstatus: 'finish',--%>
<%--                end: 'end',--%>
<%--                eeid: 0,--%>
<%--                examIdCopy: 0,--%>
<%--                copiedText: 'http://103.41.247.45:81/',--%>
<%--                host: '',--%>
<%--                exam:{--%>
<%--                    examName:'',--%>
<%--                    examType: '',--%>
<%--                    finishDate: '',--%>
<%--                    endDate: '',--%>
<%--                    examFee:'',--%>
<%--                },--%>
<%--                currentPage: 1,--%>
<%--                pages: 0,--%>
<%--                uikitClasses: {--%>
<%--                    ul: "uk-pagination",--%>
<%--                    li: "",--%>
<%--                    liActive: "uk-active",--%>
<%--                    liDisable: "uk-disabled",--%>
<%--                    button: "page-link"--%>
<%--                },--%>
<%--                Labels: {--%>
<%--                    first: "<span uk-pagination-previous></span><span uk-pagination-previous></span>",--%>
<%--                    prev: "<span uk-pagination-previous></span>",--%>
<%--                    next: "<span uk-pagination-next></span>",--%>
<%--                    last: "<span uk-pagination-next></span><span uk-pagination-next></span>"--%>
<%--                },--%>


<%--            };--%>
<%--        },--%>
<%--        created(){--%>
<%--            this.userId = this.$route.params.userId--%>
<%--            this.host = window.location.origin + '/solving0301/'--%>
<%--            console.log("here is userId" + this.userId);--%>

<%--        },--%>
<%--        filters: {--%>
<%--            moment: function (date) {--%>
<%--                return moment(date).format('YYYY.MM.DD')--%>
<%--            }--%>
<%--        },--%>
<%--        methods: {--%>
<%--            onCopy: function (e) {--%>
<%--                alert('다음과 같이 URL이 복사되었습니다. \n' + e.text)--%>
<%--            },--%>
<%--            onError: function (e) {--%>
<%--                alert('Failed to copy texts')--%>
<%--            },--%>
<%--            urlCopy(item){--%>
<%--                this.examIdCopy = item--%>
<%--            },--%>
<%--            onChange: function() {--%>
<%--                // console.log(`"currentPage" has been changed`);--%>
<%--                this.loaddata(this.currentPage);--%>
<%--            },--%>
<%--            popup(){--%>
<%--                let routeData = this.$router.resolve({name: 'routeName', query: {data: "someData"}});--%>
<%--                window.open(routeData.href, '_blank');--%>
<%--            },--%>
<%--            async reset(Id){--%>
<%--                try {--%>
<%--                    const response = await services.reset({--%>
<%--                        examId: Id--%>
<%--                    });--%>
<%--                    alert("exam status changed!!!")--%>
<%--                    console.log(response);--%>
<%--                    this.loaddata()--%>

<%--                } catch (error) {--%>
<%--                    console.log(error);--%>

<%--                }--%>
<%--            },--%>
<%--            newtab(link,id){--%>
<%--                let route = this.$router.resolve({name: link, params: {examId: id}});--%>
<%--                window.open(route.href, '_blank','width=1240,height=652');--%>
<%--            },--%>
<%--            newtab2(link,id){--%>
<%--                let route = this.$router.resolve({name: link, params: {examId: id}});--%>
<%--                window.open(route.href, '_blank','width=620, height=881');--%>
<%--            },--%>
<%--            examIdcall(item){--%>
<%--                this.eeid = item--%>
<%--            },--%>
<%--            urlpopOpen(){--%>
<%--                $("html, body").addClass("not-scroll");--%>
<%--                $(".url-popup").fadeIn(150);--%>
<%--            },--%>
<%--            wedopopOpen(){--%>
<%--                $("html, body").addClass("not-scroll");--%>
<%--                $(".wedo-popup").fadeIn(150);--%>
<%--            },--%>
<%--            appraisal(){--%>
<%--                $("html, body").addClass("not-scroll");--%>
<%--                $(".appraisal-popup").fadeIn(150);--%>
<%--            },--%>
<%--            openSolving(link){--%>
<%--                window.open(link)--%>
<%--            },--%>
<%--            async examStatus(item){--%>
<%--                try {--%>
<%--                    const response = await services.examStatus({--%>
<%--                        examId: item,--%>
<%--                        examStatus: this.examstatus--%>
<%--                    });--%>
<%--                    alert("exam status changed!!!")--%>
<%--                    console.log(response);--%>
<%--                    this.loaddata()--%>
<%--                } catch (error) {--%>
<%--                    console.log(error);--%>

<%--                }--%>
<%--            },--%>
<%--            async loaddata(page) {--%>
<%--                try {--%>
<%--                    if (page > 0) {--%>
<%--                        page = page - 1;--%>
<%--                    }--%>
<%--                    let item = {--%>
<%--                        page: page,--%>
<%--                        examId: this.exam.id,--%>
<%--                        examName: this.exam.examName,--%>
<%--                    }--%>

<%--                    const response = await services.getExams(item);--%>

<%--                    if (response.status == 200) {--%>

<%--                        for (let i = 0; i < response.data.content.length; i++) {--%>

<%--                            if (response.data.content[i].totalTime == 0) {--%>
<%--                                response.data.content[i].averageTime = ""--%>
<%--                            }--%>
<%--                            else{--%>
<%--                                let time =  response.data.content[i].totalTime / response.data.content[i].givedUserCount--%>
<%--                                // console.log(time);--%>
<%--                                time = parseInt(time);--%>
<%--                                let hours = Math.floor(time / 3600);--%>
<%--                                time %= 3600;--%>
<%--                                let minutes = Math.floor(time / 60);--%>
<%--                                let seconds = time % 60;--%>
<%--                                response.data.content[i].averageTime =  hours +":"+ minutes +":"+ seconds--%>
<%--                            }--%>
<%--                        }--%>
<%--                        this.exams = response.data.content--%>
<%--                        console.log("exams");--%>
<%--                        console.log(this.exams);--%>


<%--                        // this.currentPage = response.data.page;--%>
<%--                        this.pages = response.data.totalPages;--%>

<%--                        // if (!this.examDetail.length) {--%>
<%--                        //     this.isLoading = false;--%>
<%--                        //     return;--%>
<%--                        // }--%>
<%--                    }--%>
<%--                } catch (error) {--%>
<%--                    console.log(error);--%>
<%--                    this.scrollToTop();--%>
<%--                }--%>
<%--            },--%>
<%--            // async getExams() {--%>
<%--            //     try {--%>
<%--            //         const response = await services.getExams();--%>

<%--            //         console.log(response.data)--%>
<%--            //         this.exams = response.data--%>

<%--            //         for (let i = 0; i < response.data.length; i++) {--%>

<%--            //             if (response.data[i].totalTime == 0) {--%>
<%--            //                 response.data[i].averageTime = "_"--%>
<%--            //             }--%>
<%--            //             else{--%>
<%--            //                 let time =  response.data[i].totalTime / response.data[i].givedUserCount--%>
<%--            //                 console.log(time);--%>
<%--            //                 time = parseInt(time);--%>
<%--            //                 let hours = Math.floor(time / 3600);--%>
<%--            //                 time %= 3600;--%>
<%--            //                 let minutes = Math.floor(time / 60);--%>
<%--            //                 let seconds = time % 60;--%>
<%--            //                 response.data[i].averageTime =  hours +":"+ minutes +":"+ seconds--%>
<%--            //             }--%>
<%--            //         }--%>
<%--            //     } catch (error) {--%>
<%--            //         console.log("error.message");--%>
<%--            //     }--%>
<%--            // },--%>
<%--            scrollToTop() {--%>
<%--                window.scrollTo(0, 0);--%>
<%--            },--%>
<%--            popUpSolving0302_ty(Id){--%>
<%--                let route = this.$router.resolve({path: '/solving0302_ty02', params:{examId: Id, userId: this.userId}});--%>
<%--                // let route = this.$router.resolve('/link/to/page'); // This also works.--%>
<%--                window.open(route.href, '_blank');--%>
<%--            }--%>
<%--        }--%>
<%--        // 달력--%>
<%--        // jQuery.datetimepicker.setLocale('ko')--%>
<%--        // $('#datetimepicker1').datetimepicker({--%>
<%--        //     timepicker:false,--%>
<%--        //     format:'Y.m.d'--%>
<%--        // })--%>
<%--        // $('#datetimepicker2').datetimepicker({--%>
<%--        //     timepicker:false,--%>
<%--        //     format:'Y.m.d'--%>
<%--        // })--%>
<%--// 그래프--%>
<%--//     var correctgraph = document.getElementById("percentCorrect");--%>
<%--//     var corrsetplugin = {--%>
<%--//         beforeDraw: function (chart) {--%>
<%--//             var meta = chart.getDatasetMeta(0).data[1]._model;--%>
<%--//             meta.outerRadius = 80;--%>
<%--//         },--%>
<%--//     };--%>
<%--//     var setPercentCorrect = new Chart(correctgraph, {--%>
<%--//         type: 'doughnut',--%>
<%--//         plugins: corrsetplugin,--%>
<%--//         data: {--%>
<%--//             labels: ['오답', '정답'],--%>
<%--//             datasets: [{--%>
<%--//                 data: [12, 88],--%>
<%--//                 borderWidth: 0,--%>
<%--//                 backgroundColor: ["#e3e3e3", "#fcae40"],--%>
<%--//                 hoverBackgroundColor: ["#e3e3e3", "#fca03e"]--%>
<%--//             }]--%>
<%--//         },--%>
<%--//         options: {--%>
<%--//             layout: {--%>
<%--//                 padding: 20--%>
<%--//             },--%>
<%--//             legend: false,--%>
<%--//             tooltips: false,--%>
<%--//             responsive: true,--%>
<%--//             maintainAspectRatio: false,--%>
<%--//             cutoutPercentage: 60,--%>
<%--//             rotation: Math.PI + 0.3,--%>
<%--//             plugins: {--%>
<%--//                 datalabels: {--%>
<%--//                     color: ['transparent', "transparent"],--%>
<%--//                     font: {--%>
<%--//                         weight: 'bold',--%>
<%--//                         size: 20,--%>
<%--//                         family: 'Noto Sans'--%>
<%--//                     },--%>
<%--//                     formatter: function(value, context) {--%>
<%--//                         return value + '%';--%>
<%--//                     }--%>
<%--//                 }--%>
<%--//             }--%>
<%--//         }--%>
<%--//     });--%>
<%--// $(document).ready(function() {--%>
<%--        // URL 복사 팝업--%>
<%--        // $(".url-popOpen").on("click", function(e){--%>
<%--        //     $("html, body").addClass("not-scroll");--%>
<%--        //     $(".url-popup").fadeIn(150);--%>
<%--        // });--%>
<%--        /* 2020-02-29 */--%>
<%--        // 위두랑 과제방 팝업--%>
<%--        // $(".wedo-popOpen").on("click", function(e){--%>
<%--        //     $("html, body").addClass("not-scroll");--%>
<%--        //     $(".wedo-popup").fadeIn(150);--%>
<%--        // });--%>
<%--        /* //2020-02-29 */--%>
<%--        // 평가하기 팝업--%>
<%--        // $(".appraisal-popOpen").on("click", function(e){--%>
<%--        //     $("html, body").addClass("not-scroll");--%>
<%--        //     $(".appraisal-popup").fadeIn(150);--%>
<%--        // });--%>
<%--        // 학생 팝업--%>
<%--//     $(".student-popOpen").on("click", function(e){--%>
<%--//         $("html, body").addClass("not-scroll");--%>
<%--//         $(".appraisal-popup").hide();--%>
<%--//         $(".student-popup").fadeIn(150);--%>
<%--//     });--%>
<%--// });--%>
<%--    }--%>
<%--</script>--%>

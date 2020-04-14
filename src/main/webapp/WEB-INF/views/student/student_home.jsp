<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge, chrome=1">
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta property="og:image" content="">
	<meta property="og:image:width" content="1200">
	<meta property="og:image:height" content="628">
	<meta property="og:type" content="website">
	<meta name="theme-color" content="#">
	<meta property="og:type" content="website">
	<meta name="theme-color" content="#">
	<meta name="msapplication-navbutton-color" content="rgb(251, 95, 51)">
	<meta name="apple-mobile-wep-app-status-bar-style" content="rgb(251, 95, 51)">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/home/style.css">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/home/reset.css">
	<script src="${ASSETS}/script/vue/vue.js"></script>
	<script src="${ASSETS}/script/vue/axios.js"></script>
	<script src="${ASSETS}/script/jquery.js"></script>
	<script src="${ASSETS}/script/blockUI.js" type="text/javascript"></script>
	<script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
</head>
<body>
	<section id="studenthome">
		
		<div id="wrapper" class="section-portal achievement">
			<!-- 상단 메인보드 -->
			<div class="main-board">
				<!-- board -->
				<div class="board-area" style=" height: 300px;">
					<!-- head -->
					<div class="head">
						<h1 class="title">학습 분석</h1>
						<div class="tab-main-menu">
							<a href="#" class="active"><span>평가 보관함</span></a>
							<a href="#"><span>진도맵</span></a>
							<a href="#"><span>학습 성취수준</span></a>
							<a href="#"><span>학습 성향</span></a>
						</div>
					</div>
					<div class="achi">
						<div class="user"><div class="user-inner">
						<span class="user-img">
							<img src="${ASSETS}/images/bg-default-user.png" style="width: 80px;  height: 80px;"/>
						</span>
							<strong class="user-name"><em>에듀포</em>님</strong>
						</div></div>
						<div class="user-info calendar-area line_one" style="  height: 160px;">
							<p class="desc"><strong>김상우님</strong>에게 등록된 평가지에요. 등록 버튼을 클릭하여 평가를 원하는 위두랑 클래스를 선택해주세요.</p>
						</div>
					</div>
					<!-- //head -->
				</div>
				<!-- //board -->
			</div>
			<div class="content-board ty_mr_t">
				<!-- 모바일 대응 : 스크롤 타입 테이블 -->
				<div class="tb_mb_wrap">
					<table class="table-style">
						<caption>내가 만든 평가로 구성된 표</caption>
						<colgroup>
							<col style="width:10%;" />
							<col style="width:8%;" />
							<col style="width:10%;" />
							<col style="width:11%;" />
							<col style="width:11%;" />
							<col style="width:12%;" />
							<col style="width:12%;" />
							<col style="width:10%;" />
						</colgroup>
						<thead>
						<tr>
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
								<button class="btn-sort">문제 수</button>
							</th>
							<th>
								<button class="btn-sort">평가시작</button>
							</th>
							<th>
								<button class="btn-sort">맞은개수</button>
							</th>
							<th>
								공유하기
							</th>
						</tr>
						</thead>
						<tbody>
							<tr v-for="(item,index) in exams">
<%--								.substring(0,10)--%>
								<td>{{item.updateAt}}</td>
								<td>{{item.classRoom}}</td>
								<td>{{item.examSubject}}</td>
								<td>{{item.examName}}</td>
								<td>
										{{item.questionCount}}
								</td>
								<td>
<%--									<p v-if="item.gived == true">종료</p>--%>
<%--									 v-else--%>
									<button class="vew_result01" @click="newtab('student/student_take_exam', item.id)">
										문제풀기
									</button>
								</td>
								<td>{{item.totalScore}}</td>
								<td>
									<button class="vew_result01" v-if="item.isReEval == true"
											@click="newtab('student/secondexam', item.id)">
										결과보기
									</button>
									<button class="i_score"  @click="newtab('student/exam_review', item.id)">채첨하기
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--// 모바일 대응 : 스크롤 타입 테이블 -->
				
				<!-- 모바일 대응 : 모바일용 각벌 형식 -->
				<div class="each_mobile-wrap">
					<table class="table-style">
						<caption>내가 만든 평가로 구성된 표</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:25%" />
							<col style="width:25%" />
							<col style="width:25%" />
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
						<tbody>
						<tr>
							<td class="w32">2019-07-21</td>
							<td colspan="3">우리 초등학교 4학년 1반</td>
						</tr>
						<tr>
							<td class="w32">수학</td>
							<td colspan="3">곱셈 기초 이해하기2</td>
						</tr>
						<tr class="bg-gray tac">
							<td>문제수</td>
							<td>응답률</td>
							<td>평균점수</td>
							<td>평가관리</td>
						</tr>
						<tr class="last tac">
							<td>10</td>
							<td>19</td>
							<td>98</td>
							<td>
								<button class="vew_result01">결과보기</button>
							</td>
						</tr>
						</tbody>
					</table>
					
					<table class="table-style">
						<caption>내가 만든 평가로 구성된 표</caption>
						<colgroup>
							<col style="width:25%" />
							<col style="width:25%" />
							<col style="width:25%" />
							<col style="width:25%" />
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
						<tbody>
						<tr>
							<td class="w32">2019-07-21</td>
							<td colspan="3">우리 초등학교 4학년 1반</td>
						</tr>
						<tr>
							<td class="w32">수학</td>
							<td colspan="3">곱셈 기초 이해하기2</td>
						</tr>
						<tr class="bg-gray tac">
							<td>문제수</td>
							<td>응답률</td>
							<td>평균점수</td>
							<td>평가관리</td>
						</tr>
						<tr class="last tac">
							<td>10</td>
							<td>19</td>
							<td>98</td>
							<td>
								<button class="i_score">채첨하기</button>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<!--// 모바일 대응 : 모바일용 각벌 형식 -->
				<div class="pagination">
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
			
			</div>
		</div>
	</section>
	<script>
		var app = new Vue({
			data() {
				return {
					exams: [],
					exam: {
						examName: '',
						examType: '',
						finishDate: '',
						endDate: '',
						examFee: '',
					},
					currentPage: 1,
					pages: 0,
					itemsPerPage: 1,
					totalQuestionNumber: 0,
					userId: 0,
					linkPath: 'http://103.41.247.45/kerisexam',
					localPath: 'http://localhost:8084/exam'
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
				newtab(link, id) {

                    var loginId = '${sessionScope.loginId}';
                    loginId = this.userId

                    window.open( this.localPath + "/" + link + "?examId=" + id + "&userId=" + this.userId,
						'_blank',
						'width=1240,height=800')
				},
				async loaddata(page) {
					try {

                        var loginId = '${sessionScope.loginId}';
                        
						const headers = {
							'Content-Type': 'application/json',
						}
	
						$.blockUI({message: '<span> Loading...</span>'});
	
						var _this = this;
						var _$ = $
	
						if (page > 0) {
							page = page - 1
						}
	
						axios.get('${BASEURL}/student/exams/'+loginId+'?size=6'
						,{
						    params:{
						        page: page,
                                examId: this.exam.id,
                                examName: this.exam.examName,
							},
							headers: headers
						}).then(function (response) {
							_$.unblockUI()
                            console.log(response)
							if (response.status == 200) {
								// console.log('response = ',response.data);
								_this.exams = response.data.content
								_this.pages = response.data.totalPages
								_$.unblockUI()
							} else {
								alert("request failed")
							}
						}, function (error) {
							console.log("axios error found")
							console.log(error);
							_$.unblockUI
						});
	
					} catch (error) {
						console.log("try catch error found")
						console.log(error)
					}
				},
                questionCurrent(item){
                    this.currentPage = item
                    this.loaddata(this.currentPage)
                },
                nextQuestion() {
                    if (this.pages > this.currentPage)
                    {
                        this.currentPage  = this.currentPage + 1
                        this.loaddata( this.currentPage)
                    }
                },
                prevQuestion(){
                    if (this.currentPage > 1)
                    {
                        this.currentPage = this.currentPage - 1
                        this.loaddata(this.currentPage)
                    }
                },
                lastQuestion(){
                    this.currentPage = this.pages
                    this.loaddata(this.currentPage)
                },
                firstQuestion(){
                    this.currentPage = 1
                    this.loaddata(this.currentPage)
                },
			}
		})
		app.$mount('#studenthome')
	</script>
</body>
</html>

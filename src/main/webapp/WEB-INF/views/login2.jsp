<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Publisher" content="NSDevil">
    <meta name="Keywords" content="NSDevil OSCE">
    <meta name="Description" content="NSDevil OSCE (관리자용)">
    <meta name="format-detection" content="telephone=no,date=no,address=no,email=no,url=no">
    <meta name="viewport" content="user-scalable=no, width=1200">
    <link rel="stylesheet" href="${CSS}/login/login.css">
    <link rel="stylesheet" href="${CSS}/style.css">
    <link rel="stylesheet" href="${CSS}/common.css">

    
    <script src="${JS}/vue/vue.js"></script>
    <script src="${JS}/vue/axios.js"></script>
    <script src="${JS}/jquery.js"></script>
    <script src="${JS}/blockUI.js" type="text/javascript"></script>
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
    
    <title>Login</title>
</head>
<body>
<%--<%@ include file="./common/head.jsp" %>--%>
<section id="login">
    <body class="login-back uk-width-1-1" style="background:url(${IMG}/login/login-back.png)">
        <div id="login-wrapper">
            <section class="login-wrap">
                <form class="login-form"  @submit.prevent="login">
                    <h1 class="lg-title">Login</h1>
                    <p class="lg-txt">에듀넷 회원 아이디와 비밀번호를 입력하세요.</p>
                    <div class="lg-form-wrap">
                        <input type="text" id="loginId" name="loginId" placeholder="아이디" class="loginId" v-model="email"/>
                        <input type="password" id="loginPw" name="loginPw" placeholder="비밀번호" class="loginPw" v-model="password"/>
                        <span class="login-check">
                                        <input type="checkbox" name="lCheck" id="lCheck" value="">
                                        <label for="lCheck"><span>아이디 저장</span></label>
                                    </span>
                        <button class="login-btn" type="submit">
                            로그인
                        </button>
                        
                        <div class="of-hd mgt20">
                            <ul class="find-menu tal ftl">
                                <li>
                                    <a href="#" target="_blank" title="에듀넷 아이디 찾기">에듀넷 아이디 찾기</a>
                                </li>
                                <li>
                                    <a href="#" target="_blank" title="비밀번호 찾기">비밀번호 찾기</a>
                                </li>
                            </ul>
                            <a href="#" class="join-btn ftr" target="_blank" title="에듀넷 회원가입">에듀넷 회원가입</a>
                        </div>
                    </div>
                    <ul class="sns-login">
                        <li>
                            <a href="#" target="_blank" title="네이버"><img src="${IMG}/login/icon-sns-naver.png" alt="네이버" /></a>
                        </li>
                        <li>
                            <a href="#" target="_blank" title="구글"><img src="${IMG}/login/icon-sns-google.png" alt="구글" /></a>
                        </li>
                        <li>
                            <a href="#" target="_blank" title="카카오"><img src="${IMG}/login/icon-sns-kakao.png" alt="카카오" /></a>
                        </li>
                    </ul>
                </form>
                
                <div class="login-link ">
                    <dl class="lg-link-wrap">
                        <dt class="uk-width-1-1@s">
                            <p>에듀넷 회원가입</p>
                            <a href="#" target="_blank" title="에듀넷 회원가입">GO</a>
                        </dt>
                        <dd>
                            회원가입 시 교과학습 자료, 멀티미디어 자료, 학습<br>
                            커뮤니티, 연수·연구 및 교육 정보 등 한국교육학술<br>
                            정보원에서 제공하는 다양한 교육 콘텐츠를 무료로<br>
                            이용하실 수 있습니다.
                        </dd>
                    </dl>
                    <dl class="lg-link-wrap">
                        <dt class="uk-width-1-1@s">
                            <p>에듀넷 아이디 찾기</p>
                            <a href="#" target="_blank" title="에듀넷 아이디 찾기">GO</a>
                        </dt>
                        <dd>
                            기본 정보를 입력하시면 아이디를 찾을 수 있으며,<br>
                            소셜로그인 이용자는 소셜로그인으로 확인 가능<br>
                            합니다.
                        </dd>
                    </dl>
                    <dl class="lg-link-wrap">
                        <dt class="uk-width-1-1@s">
                            <p>에듀넷 비밀번호 찾기</p>
                            <a href="#" target="_blank" title="에듀넷 비밀번호 찾기">GO</a>
                        </dt>
                        <dd>
                            회원님의 아이디와 이름을 입력하시면 비밀번호를<br>
                            찾을 수 있으며, 소셜로그인 이용자는 소셜로그인<br>
                            으로 확인 가능 합니다.
                        </dd>
                    </dl>
                    <dl class="lg-link-wrap">
                        <dt class="uk-width-1-1@s">
                            <p>에듀넷 소셜 로그인</p>
                            <a href="#" target="_blank" title="에듀넷 소셜 로그인">GO</a>
                        </dt>
                        <dd>
                            네이버, 구글, 카카오톡 아이디로 로그인 하실 수<br>
                            있습니다.
                        </dd>
                    </dl>
                </div>
                
                <div class="lg-copyright">
                    <p>Copyrights© 한국교육학술정보원. All rights reserved.</p>
                </div>
            </section>
        
        </div>
    </body>
</section>
<script type="text/javascript">
    var app = new Vue({
        data: {
            email: "demo@gmail.com",
            password: "123456"
        },
    
        watch: {},
    
        computed: {},
    
        filters: {},
    
        mounted: function () {
            console.log("Login page is running")
        },
        methods: {
            login: function () {
                $.blockUI({message: '<span> Loading...</span>'});
                var _this = this;
                var _$ = $;
                axios.post('${BASEURL}/auth/signin', {
                    usernameOrEmail: this.email,
                    password: this.password
                }).then(function (response) {
                    _$.unblockUI
                    // console.log(response.data);
                    localStorage.setItem('userData', JSON.stringify(response.data));
                    // _this.$cookies.set('userData', JSON.stringify(response.data))
                    // console.log("login data  " + response.data.accessToken);
                    // const userData = JSON.parse(_this.$cookies.get('userData'));
                    const userData = JSON.parse(localStorage.getItem('userData'));
                    console.log(userData.accessToken);
                    console.log("localstorage");
                    _this.me();
                }, function (error) {
                    console.log(error);
                    _$.unblockUI
                });
    
            },
            me: function () {
                const userData = JSON.parse(localStorage.getItem('userData'));
                const headers = {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer ' + userData.accessToken
                }
                axios.get('${BASEURL}/user/me', {headers: headers})
                    .then(function (response) {
                        if (response.status == 200) {
    
                            if (response.data.authorities[0].authority === 'ROLE_PROFESSOR' || response.data.authorities[0].authority === 'ROLE_ADMIN') {
                                localStorage.setItem('proData', JSON.stringify(response.data));
                                const proData = JSON.parse(localStorage.getItem('proData'));
                                console.log("this is ProData")
                                console.log(proData)
                                
                                window.location.href = "${HOME}/teacher_home"
                            } else {
                                window.location.href = "${HOME}/student_home"
                                localStorage.setItem('users', JSON.stringify(response.data));
                                const users = JSON.parse(localStorage.getItem('users'));
                                console.log("this is users")
                                console.log(users)
                            }
                        } else {
                            alert("your email and password !!!");
                        }
                    });
            }
        }
    });
    
    app.$mount('#login')
</script>

</body>
</html>

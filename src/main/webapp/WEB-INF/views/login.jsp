<%@ page import="java.util.Enumeration" %>
<%@ page import="com.nets.sso.common.AgentExceptionCode" %>
<%@ page import="com.nets.sso.common.Utility" %>
<%@ page import="com.nets.sso.common.enums.AuthStatus" %>
<%@ page import="com.nets.sso.agent.AuthUtil" %>
<%@ page import="com.nets.sso.agent.authcheck.AuthCheck" %>
<%@ page import="com.nets.sso.agent.configuration.SSOConfig" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	//	request.getSession().setAttribute("loginId", "teacher1");
//	request.getSession().setAttribute("logoffUrl", "");
//	request.getSession().setAttribute("userInfo", "");
//	String redirectURL = request.getContextPath() + "/main";
//	response.sendRedirect(redirectURL);
	
	String role = "";
	String logonUrl = "";        // 로그온 URL
	String logoffUrl = "";        // 로그오프 URL
	String returnUrl = "";        // 되돌아 올 URL
	boolean isLogon = false;    // 로그온 여부
	String logonId = "";        // 로그온 된 사용자 아이디
	String userInfo = "";        // 로그온 된 사용자 추가정보
	String errorMsg = "";        // 에러 메시지
	String idTagName = "";            // 아이디 태그명
	String pwdTagName = "";            // 비밀번호 태그명
	String credTagName = "";        // CredentialType 태그명
	String returnUrlTagName = "";    // 되돌아갈 URL 태그명
	
	try {
		System.out.println("ServerName:" + request.getServerName());
		//인증객체생성 및 인증확인
		AuthCheck auth = new AuthCheck(request, response);
		System.out.println("checkLogon");
		//인증확인
		AuthStatus status = auth.checkLogon();
		
		//일반 설정값들
		try {

// 		 if ( Utility.isNullOrEmpty(request.getParameter(auth.getSsoProvider().getReturnUrlTagName())) == false ){
// 				returnUrl = request.getParameter(auth.getSsoProvider().getReturnUrlTagName());
// 			 } else {
// 				 returnUrl = auth.getThisUrl();
// 			 }
			if (Utility.isNullOrEmpty(request.getParameter(auth.getSsoProvider().getReturnUrlTagName())) == false) {
				//returnUrl = request.getParameter(auth.getSsoProvider().getReturnUrlTagName());
				String queryStr = request.getQueryString();
				if (Utility.isNullOrEmpty(queryStr)) {
					returnUrl = request.getParameter(auth.getSsoProvider().getReturnUrlTagName());
				} else {
					returnUrl = queryStr.substring(10, queryStr.length());
				}
			} else {
				returnUrl = auth.getThisUrl() + "?returnURL=";
				auth.getSsoSite().getDefaultReturnUrl();
			}
			
			
			//로그오프 URL
		/* logoffUrl = auth.getSsoProvider().getLogoffUrl() + "?" +
			auth.getSsoProvider().getRequestSSOSiteParam() + "=" + auth.getSsoSite().getSiteDNS() + "&" +
			auth.getSsoProvider().getReturnUrlTagName() + "=" + Utility.uRLEncode(auth.getThisUrl(), "UTF-8");
		
		//로그온 URL
		logonUrl = auth.getSsoProvider().getLogonUrl() + "?" +
				auth.getSsoProvider().getRequestSSOSiteParam() + "=" + auth.getSsoSite().getSiteDNS();
		 */
			logoffUrl = auth.getSsoProvider().getLogoffUrl(request, auth.getSsoSite().getSiteDNS()) + "?" +
					auth.getSsoProvider().getRequestSSOSiteParam() + "=" + auth.getSsoSite().getSiteDNS() + "&" +
					auth.getSsoProvider().getReturnUrlTagName() + "=" + Utility.uRLEncode(auth.getThisUrl(), "UTF-8");
			
			//로그온 URL
			logonUrl = auth.getSsoProvider().getLogonUrl(request, auth.getSsoSite().getSiteDNS()) + "?" +
					auth.getSsoProvider().getRequestSSOSiteParam() + "=" + auth.getSsoSite().getSiteDNS();
			
			
			idTagName = auth.getSsoProvider().getIdTagName();
			pwdTagName = auth.getSsoProvider().getPwdTagName();
			credTagName = auth.getSsoProvider().getCredTypeTagName();
			returnUrlTagName = auth.getSsoProvider().getReturnUrlTagName();
		} catch (Exception e) {
			out.print(e.toString());
		}
		
		//인증상태별 처리
		if (status == AuthStatus.SSOFirstAccess) {
			//최초 접속
			auth.trySSO();
		} else if (status == AuthStatus.SSOSuccess) {
			//인증성공
			//returnUrl = request.getParameter(auth.getSsoProvider().getReturnUrlTagName());
		/*
		if (Utility.isNullOrEmpty(returnUrl) == false) {
		    response.sendRedirect(returnUrl);
		} else if(Utility.isNullOrEmpty(request.getParameter(auth.getSsoProvider().getReturnUrlTagName()))==false) {
			response.sendRedirect(request.getParameter(auth.getSsoProvider().getReturnUrlTagName()));
		}
		*/
			isLogon = true;
			
			//하기 인증정보를 이용하여, 내부인증을 만들어 사용하세요.
			//로그인 아이디
			logonId = auth.getUserID();
			
			//인증정보 모두 보기(화면에서 보고 싶을 때 주석을 제거 하세요)
			if (auth.getUserInfoCollection() != null && auth.getUserInfoCollection().size() > 0) {
				for (Enumeration<String> e = auth.getUserInfoCollection().keys(); e.hasMoreElements(); ) {
					if (Utility.isNullOrEmpty(userInfo) == false)
						userInfo += "<br />";
					String key = (String) e.nextElement();
					userInfo += key + ":" + auth.getUserInfoCollection().get(key);
					userInfo += ", length :" + auth.getUserInfoCollection().get(key).length();
					
					if (key.contains("ex_type")) {
						role = auth.getUserInfoCollection().get(key);
					}
					
				}
			}
			
			//선입자를 끊고, 내가 인증 성공했을 경우, 선입자의 정보를 보여준다.
			if (Utility.isNullOrEmpty(auth.getDuplicationIP()) == false) {
				String dupInfo = "(끊어진 사용자정보)\\nIP:" + auth.getDuplicationIP() + "\\nTime:" + auth.getDuplicationTime();
				errorMsg = "alertError('" + dupInfo + "', '');";
			}
			
			//사용자정보 조회 샘플
			//String somethingUserInfo = auth.getUserInfo("조회할이름");	//조회할 이름은 프로젝트 시, 정해지면 전달해드립니다.
		} else if (status == AuthStatus.SSOFail) {
			//인증실패
			if (auth.getErrCode() != AgentExceptionCode.NoException) {
				errorMsg = "alertError('" + auth.getErrCode().toString() + "', '');";
			}
			if (auth.getErrCode() == AgentExceptionCode.SessionDuplicationCheckedFirstPriority ||
					auth.getErrCode() == AgentExceptionCode.SessionDuplicationCheckedLastPriority) {
				errorMsg = "alertError('중복로그인 정보 IP:" + auth.getDuplicationIP() + " TIME:" + auth.getDuplicationTime() + "', '');";
			}
			//로그오프를 해야하는 상황
			if (auth.getErrCode() == AgentExceptionCode.SessionDuplicationCheckedLastPriority ||
					auth.getErrCode() == AgentExceptionCode.TokenIdleTimeout ||
					auth.getErrCode() == AgentExceptionCode.TokenExpired ||
					auth.getErrCode() == AgentExceptionCode.NoExistUserIDSessionValue) {
				errorMsg += "OnLogoff();";
			}
			
			//리턴 URL 설정
			returnUrl = request.getParameter(auth.getSsoProvider().getReturnUrlTagName());
			if (Utility.isNullOrEmpty(returnUrl) == false) {
				returnUrl = Utility.uRLEncode(returnUrl, "UTF-8");
			} else {
				returnUrl = Utility.uRLEncode(auth.getThisUrl(), "UTF-8");
			}
			//SSO 실패 시 정책에 따라 자체 로그인 페이지로 이동 시키거나, SSO 인증을 위한 포탈 로그인 페이지로 이동
			//response.sendRedirect("이동할 URL");
		} else if (status == AuthStatus.SSOUnAvailable) {
			//SSO장애
			//SSO 장애 시 정책에 따라 자체 로그인 페이지로 이동 시키거나, SSO 인증을 위한 포탈 로그인 페이지로 이동
			//response.sendRedirect("이동할 URL");
			errorMsg = "alertError('현재 통합인증 서비스가 불가합니다.', '');";
		} else if (status == AuthStatus.SSOAccessDenied) {
			errorMsg = "alertError('인증은 되었지만, 현재 사이트에 접근 거부상태입니다', '');";
		}
%>
<!DOCTYPE html>
<head>
	<title>에듀포탈</title>
	<meta charset="UTF-8">
	<meta name="Subject" content="">
	<meta name="Title" content="">
	<meta name="Description" content="">
	<meta name="Keywords" content="">
	<meta name="author" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:type" content="article"/>
	<meta property="og:title" content=""/>
	<meta property="og:description" content=""/>
	<meta property="og:image" content=""/>
	<meta property="fb:app_id" content=""/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport"
		  content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes"/>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon.ico">
	<link rel="stylesheet" type="text/css" href="${ASSETS}/css/login.css"/>
	<%--<script type="text/javascript" src="${ASSETS}/script/jquery-1.11.1.min.js"></script>--%>
	<script type="text/javascript" src="${ASSETS}/script/ui.js"></script>
	
	
	<script language="javascript" type="text/javascript">
        //로그온
        function OnLogon() {
            if (document.forms["loginForm"].txtUserID.value == "") {
                alert("사용자 ID를 입력하세요");
                return;
            }
            if (document.forms["loginForm"].txtPwd.value == "") {
                alert("사용자의 로그온 비밀번호를 입력하세요");
                return;
            }
            document.forms["loginForm"].action = "<%=logonUrl%>";
            document.forms["loginForm"].target = "_top";
            document.forms["loginForm"].submit();
        }

        //에러 메시지
        function alertError(msg, url) {
            if (msg != "")
                alert(msg);
            if (url != "")
                document.location.href = url;
        }

        //로그오프
        function OnLogoff() {
            document.location.href = "<%=logoffUrl%>";
        }

        function OnInit() {
        }
	</script>
	<%--    <!--[if lt IE 9]>--%>
	<%--    <script src="${ASSETS}/script/html5shiv.min.js"></script>--%>
	<%--    <script src="${ASSETS}/script/respond.min.js"></script>--%>
	<%--    <![endif]-->--%>
</head>

<body class="login-back" onLoad="OnInit();">

<%if (isLogon == false) { %>

<div id="login-wrapper">
	
	<section class="login-wrap" id="login">
		<div class="login-form">
			<h1 class="lg-title">Login</h1>
			<p class="lg-txt">에듀넷 회원 아이디와 비밀번호를 입력하세요.</p>
			<form class="lg-form-wrap" name="loginForm" method="post">
				<input type="text" id="txtUserID" placeholder="아이디" class="loginId" name="<%=idTagName%>"/>
				<input type="password" id="txtPwd" placeholder="비밀번호" class="loginPw" name="<%=pwdTagName%>"/>
				<span class="login-check">
						<input type="checkbox" name="lCheck" id="lCheck" value="">
						<label for="lCheck"><span>아이디 저장</span></label>
					</span>
				<button class="login-btn" type="button" onclick="OnLogon();">로그인</button>
				<div class="of-hd mgt20">
					<ul class="find-menu tal ftl">
						<li>
							<a href="https://st4.edunet.net/member/findPwd?in_div=nedu" target="_blank"
							   title="에듀넷 아이디 찾기">에듀넷 아이디 찾기</a>
						</li>
						<li>
							<a href="https://st4.edunet.net/member/memberJoin?in_div=nedu" target="_blank"
							   title="비밀번호 찾기">비밀번호 찾기</a>
						</li>
					</ul>
					<a href="https://st4.edunet.net/member/findMyId?in_div=nedu" class="join-btn ftr" target="_blank"
					   title="에듀넷 회원가입">에듀넷 회원가입</a>
				</div>
				
				<input type="hidden" id="credType" name="<%=credTagName%>" value="BASIC"/>
				<input type="hidden" name="<%=returnUrlTagName%>" value="<%=returnUrl%>"/>
			</form>
			<%--            <ul class="sns-login">--%>
			<%--                <li>--%>
			<%--                    <a href="#" target="_blank" title="네이버"><img src="${ASSETS}/img/login/icon-sns-naver.png" alt="네이버" /></a>--%>
			<%--                </li>--%>
			<%--                <li>--%>
			<%--                    <a href="#" target="_blank" title="구글"><img src="${ASSETS}/img/login/icon-sns-google.png" alt="구글" /></a>--%>
			<%--                </li>--%>
			<%--                <li>--%>
			<%--                    <a href="#" target="_blank" title="카카오"><img src="${ASSETS}/img/login/icon-sns-kakao.png" alt="카카오" /></a>--%>
			<%--                </li>--%>
			<%--            </ul>--%>
		</div><!--// 폼 -->
		
		<div class="login-link">
			<dl class="lg-link-wrap">
				<dt>
					<p>에듀넷 회원가입</p>
					<a href="https://st4.edunet.net/member/findMyId?in_div=nedu" target="_blank" title="에듀넷 회원가입">GO</a>
				</dt>
				<dd>
					회원가입 시 교과학습 자료, 멀티미디어 자료, 학습<br>
					커뮤니티, 연수·연구 및 교육 정보 등 한국교육학술<br>
					정보원에서 제공하는 다양한 교육 콘텐츠를 무료로<br>
					이용하실 수 있습니다.
				</dd>
			</dl>
			<dl class="lg-link-wrap">
				<dt>
					<p>에듀넷 아이디 찾기</p>
					<a href="https://st4.edunet.net/member/findPwd?in_div=nedu" target="_blank"
					   title="에듀넷 아이디 찾기">GO</a>
				</dt>
				<dd>
					기본 정보를 입력하시면 아이디를 찾을 수 있으며,<br>
					소셜로그인 이용자는 소셜로그인으로 확인 가능<br>
					합니다.
				</dd>
			</dl>
			<dl class="lg-link-wrap">
				<dt>
					<p>에듀넷 비밀번호 찾기</p>
					<a href="https://st4.edunet.net/member/memberJoin?in_div=nedu" target="_blank" title="에듀넷 비밀번호 찾기">GO</a>
				</dt>
				<dd>
					회원님의 아이디와 이름을 입력하시면 비밀번호를<br>
					찾을 수 있으며, 소셜로그인 이용자는 소셜로그인<br>
					으로 확인 가능 합니다.
				</dd>
			</dl>
			<%--            <dl class="lg-link-wrap">--%>
			<%--                <dt>--%>
			<%--                    <p>에듀넷 소셜 로그인</p>--%>
			<%--                    <a href="#" target="_blank" title="에듀넷 소셜 로그인">GO</a>--%>
			<%--                </dt>--%>
			<%--                <dd>--%>
			<%--                    네이버, 구글, 카카오톡 아이디로 로그인 하실 수<br>--%>
			<%--                    있습니다.--%>
			<%--                </dd>--%>
			<%--            </dl>--%>
		</div><!--// 링크 -->
		
		<div class="lg-copyright">
			<p>Copyrights©한국교육학술정보원. All rights reserved.</p>
		</div><!--// 카피라이트 -->
	</section>
	<!--// 로그인 -->

</div>
<!--// container -->

<%
} else {
	request.getSession().setAttribute("loginId", logonId);
	request.getSession().setAttribute("logoffUrl", logoffUrl);
	request.getSession().setAttribute("userInfo", userInfo);
	
	if (role.equals("02")) {
		String redirectURL = request.getContextPath() + "/teacher_home";
		response.sendRedirect(redirectURL);
	}
	if (role.equals("08") || role.equals("01")) {
		String redirectURL = request.getContextPath() + "/student_home";
		response.sendRedirect(redirectURL);
	}
%>
로그인 사용자 : <%=logonId %><br/><br/>
사용자 정보 : <br/><%=userInfo%><br/><br/>

<input type="button" value="로그오프" onclick="OnLogoff();"/>


<%} %>

<script language="javascript">
    <%=errorMsg%>
</script>
</body>
</html>

<%
	} catch (Exception ex) {
		ex.printStackTrace();
		out.print(ex.toString());
	}
%>


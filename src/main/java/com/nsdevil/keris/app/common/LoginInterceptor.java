package com.nsdevil.keris.app.common;

import com.nets.sso.agent.authcheck.AuthCheck;
import com.nets.sso.common.Utility;
import com.nets.sso.common.enums.AuthStatus;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //인증객체생성 및 인증확인
        AuthCheck auth = new AuthCheck(request, response);
        //인증확인
        AuthStatus status = auth.checkLogon();

        if (status == AuthStatus.SSOFirstAccess) {
            System.out.println("SSOFirstAccess");
            //최초 접속
            auth.trySSO();
        } else if (status == AuthStatus.SSOSuccess) {
            request.getSession().setAttribute("loginId", auth.getUserID());

            String logoffUrl = auth.getSsoProvider().getLogoffUrl(request, auth.getSsoSite().getSiteDNS()) + "?" +
                    auth.getSsoProvider().getRequestSSOSiteParam() + "=" + auth.getSsoSite().getSiteDNS() + "&" +
                    auth.getSsoProvider().getReturnUrlTagName() + "=" + Utility.uRLEncode(auth.getThisUrl(), "UTF-8");

            request.getSession().setAttribute("logoffUrl", logoffUrl);
            request.getSession().setAttribute("userInfo", "");
            System.out.println("SSOSuccess");
            return true;
        } else if (status == AuthStatus.SSOFail) {
            System.out.println("SSOFail");

            clearSession(request);
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        } else if (status == AuthStatus.SSOUnAvailable) {
            System.out.println("SSOUnAvailable");
            clearSession(request);
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        } else if (status == AuthStatus.SSOAccessDenied) {
            System.out.println("SSOAccessDenied");
            clearSession(request);
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        return true;
    }

    private void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("loginId") != null) {
            request.getSession().invalidate();
        }

    }
}

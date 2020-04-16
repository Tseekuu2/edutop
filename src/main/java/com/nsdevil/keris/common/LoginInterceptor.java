package com.nsdevil.keris.common;

import com.nets.sso.agent.authcheck.AuthCheck;
import com.nets.sso.common.Utility;
import com.nets.sso.common.enums.AuthStatus;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

//        System.err.println("qqqqqqqqqqqqqqqexam");
//        //인증객체생성 및 인증확인
//        AuthCheck auth = new AuthCheck(request, response);
//        //인증확인
//        AuthStatus status = auth.checkLogon();
//
//        if (status == AuthStatus.SSOFirstAccess) {
//            System.out.println("SSOFirstAccess");
//            //최초 접속
//            auth.trySSO();
//        } else if (status == AuthStatus.SSOSuccess) {
//            String logonId = auth.getUserID();
//
//            if (auth.getUserInfoCollection() != null && auth.getUserInfoCollection().size() > 0) {
//                for (Enumeration<String> e = auth.getUserInfoCollection().keys(); e.hasMoreElements(); ) {
//                    String key = (String) e.nextElement();
//                    request.getSession().setAttribute(key, auth.getUserInfoCollection().get(key));
//                    System.out.println(key +"  :   "+auth.getUserInfoCollection().get(key) +"\n\n");
//                }
//            }
//            request.getSession().setAttribute("loginId", logonId);
//
//            String logoffUrl = auth.getSsoProvider().getLogoffUrl(request, auth.getSsoSite().getSiteDNS()) + "?" +
//                    auth.getSsoProvider().getRequestSSOSiteParam() + "=" + auth.getSsoSite().getSiteDNS() + "&" +
//                    auth.getSsoProvider().getReturnUrlTagName() + "=" + Utility.uRLEncode(auth.getThisUrl(), "UTF-8");
//
//            request.getSession().setAttribute("logoffUrl", logoffUrl);
//
//
//            System.out.println("SSOSuccess");
//            return true;
//        } else if (status == AuthStatus.SSOFail) {
//            System.out.println("SSOFail");
//            request.getSession().invalidate();
//            response.sendRedirect(request.getContextPath() + "/");
//            return false;
//        } else if (status == AuthStatus.SSOUnAvailable) {
//            System.out.println("SSOUnAvailable");
//            request.getSession().invalidate();
//            response.sendRedirect(request.getContextPath() + "/");
//            return false;
//        } else if (status == AuthStatus.SSOAccessDenied) {
//            System.out.println("SSOAccessDenied");
//            request.getSession().invalidate();
//            response.sendRedirect(request.getContextPath() + "/");
//            return false;
//        }

        return true;
    }


}

package com.yaa.interceptor;

import com.yaa.constant.WebConst;
import com.yaa.extension.Commons;
import com.yaa.model.Users;
import com.yaa.service.UserService;
import com.yaa.util.BlogUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义拦截器
 */
@Component
public class BaseInterceptor implements HandlerInterceptor {
    private static final Logger LOGGE = LoggerFactory.getLogger(BaseInterceptor.class);
    private static final String USER_AGENT = "user-agent";

    @Resource
    private UserService userService;

    @Resource
    private Commons commons;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String contextPath = request.getContextPath();
        String uri = request.getRequestURI();
        Users user = BlogUtils.getLoginUser(request);
        if (null == user) {
            Integer uid = BlogUtils.getCookieUid(request);
            if (null != uid) {
                user = userService.getUsers(uid);
                request.getSession().setAttribute(WebConst.LOGIN_SESSION_KEY, user);
            }
        }
//        //静态资源不拦截
//        if(uri.contains("css") || uri.contains("js") || uri.contains("fonts")){
//            return true;
//        }
        if("0".equals(WebConst.initConfig.get("allow_install")) && !uri.startsWith(contextPath+"/install")){
            response.sendRedirect(request.getContextPath() + "/install");
            return false;
        }
        //请求拦截处理(后台)
        if (uri.startsWith(contextPath + "/admin")) {
            if(user == null && !uri.equals("/admin/login")){
                response.sendRedirect(request.getContextPath() + "/admin/login");
                return false;
            }
            if(user != null && (uri.equals("/admin") || uri.equals("/admin/"))){
                response.sendRedirect(request.getContextPath() + "/admin/index");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        httpServletRequest.setAttribute("commons", commons);//一些工具类和公共方法
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

package com.yaa.controller.admin;

import com.yaa.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller("adminIndexController")
@RequestMapping(value = "/admin")
public class IndexController extends BaseController {


    /**
     * 登录页
     * @return
     */
    @GetMapping(value = "/login")
    public String login() {
        return "admin/login";
    }

    /**
     * 首页
     * @return
     */
    @GetMapping(value = "/index")
    public String adminHome(HttpServletRequest request) {
        request.setAttribute("active","index");
        return "admin/index";
    }

}

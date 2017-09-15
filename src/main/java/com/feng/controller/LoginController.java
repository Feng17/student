package com.feng.controller;

import com.feng.model.HostHolder;
import com.feng.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;


@Controller
public class LoginController {

    @Autowired
    LoginService loginService;

    @Autowired
    HostHolder hostHolder;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model model, String username, String password) {
        Map<String, Object> map = loginService.register(username, password);
        model.addAttribute("msg", map.get("msg"));
        return "login";
    }

    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public String signin(Model model, String username, String password,
                         @CookieValue(value = "token", defaultValue = "") String token,
                         HttpServletResponse response) {
        if (!token.isEmpty() && loginService.isOnline(token)) {
            model.addAttribute("msg", "你已经登录");
            return "error";
        }
        Map<String, Object> map = loginService.login(username, password);
        if (map.containsKey("token")) {
            Cookie cookie = new Cookie("token", map.get("token").toString());
            cookie.setPath("/");
            response.addCookie(cookie);
            return "redirect:/main";
        } else {
            model.addAttribute("msg", map.get("msg"));
            return "login";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout() {
        loginService.logout(hostHolder.getUser().getId(), 1); //登出时将对应LoginToken的status设为1
        return "redirect:/login";
    }

}

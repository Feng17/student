package com.feng.controller;

import com.feng.model.HostHolder;
import com.feng.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;


@Controller
public class LoginController {

    @Autowired
    LoginService loginService;

    @Autowired
    HostHolder hostHolder;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> register(String username,String email, String password) {
        Map<String, Object> map = loginService.register(username,email, password);
        return map;
    }

    @RequestMapping(value = "/activate",method = RequestMethod.GET)
    public String activate(@RequestParam("code") String code, Model model) {
        Map<String,Object> map =  loginService.activate(code);
        model.addAttribute("msg", map.get("msg"));
        return "login";
    }

    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> signin(Model model, String username, String password, HttpServletResponse response) {
        Map<String, Object> map = loginService.login(username, password, response);
        return map;
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

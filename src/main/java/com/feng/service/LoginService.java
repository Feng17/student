package com.feng.service;

import com.feng.dao.LoginTokenDao;
import com.feng.dao.UserDao;
import com.feng.model.LoginToken;
import com.feng.model.User;
import com.feng.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class LoginService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private LoginTokenDao loginTokenDao;

    public Map<String, Object> register(String username, String password) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = userDao.selectUserByName(username);
        if (user != null) {
            map.put("msg", "用户名已存在");
            return map;
        }

        user = new User();
        user.setName(username);
        user.setSalt(UUID.randomUUID().toString().substring(0, 5));
        user.setPassword(MD5Util.MD5(password + user.getSalt()));
        userDao.addUser(user);
        return map;

    }

    public Map<String, Object> login(String username, String password) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = userDao.selectUserByName(username);
        if (user == null) {
            map.put("msg", "用户名不存在");
            return map;
        }
        if (!MD5Util.MD5(password + user.getSalt()).equals(user.getPassword())) {
            map.put("msg", "密码错误");
            return map;
        }

        //登录成功 添加一个token
        String token = addLoginToken(user.getId());
        map.put("token", token);
        return map;
    }

    private String addLoginToken(Integer userId) {
        LoginToken token = new LoginToken();
        token.setUserId(userId);
        Date date = new Date();
        date.setTime(date.getTime() + 1000 * 3600 * 24);
        token.setExpired(date);
        token.setStatus(0);
        token.setToken(UUID.randomUUID().toString().replaceAll("-", ""));
        loginTokenDao.addLoginToken(token);
        return token.getToken();
    }

    public boolean isOnline(String token) {
        LoginToken loginToken = loginTokenDao.selectLoginTokenByToken(token);
        if (loginToken != null && loginToken.getStatus() == 0 && loginToken.getExpired().after(new Date())) {
            return true;
        } else {
            return false;
        }
    }

    public void logout(Integer userId, Integer status) {
        loginTokenDao.updateStatus(userId, status);
    }

}

package com.feng.dao;

import com.feng.model.LoginToken;
import org.apache.ibatis.annotations.Param;


public interface LoginTokenDao {

    void addLoginToken(LoginToken token);

    LoginToken selectLoginTokenByToken(String token);

    void updateStatus(@Param("userId") Integer userId, @Param("status") Integer status);

}

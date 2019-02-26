package com.feng.dao;

import com.feng.model.User;

public interface UserDao {

    User selectUserByName(String name);

    void addUser(User user);

    User selectUserById(Integer id);

    void updateStateByCode(String code);

    int selectEmailCount(String email);

    int selectStateByUsername(String name);

    User selectUserByCode(String code);
}

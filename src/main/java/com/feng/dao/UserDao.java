package com.feng.dao;

import com.feng.model.User;

public interface UserDao {

    User selectUserByName(String name);

    void addUser(User user);

    User selectUserById(Integer id);

}

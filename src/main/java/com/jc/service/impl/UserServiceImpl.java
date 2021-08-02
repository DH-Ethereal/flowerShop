package com.jc.service.impl;

import com.jc.dao.UserDao;
import com.jc.pojo.Admin;
import com.jc.pojo.User;
import com.jc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: flowerShop
 * @description: userService实现
 * @author: hjc
 * @create: 2021-06-19 16:45
 **/
public class UserServiceImpl implements UserService {

    //dao层的Mapper接口对象
    private UserDao userDao;

    @Autowired
    //set方法，为后续的spring注入准备
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public Admin aLogin(String adminId, String adminPwd) {
        return userDao.aLogin(adminId,adminPwd);
    }

    @Override
    public User login(String login_name, String pwd) {
        return userDao.login(login_name,pwd);
    }

    @Override
    public int signUp(User user) {
        return userDao.signUp(user);
    }

    @Override
    public int deleteUser(Integer user_id) {
        return userDao.deleteUser(user_id);
    }

    @Override
    public int updateUserinfo(User user) {
        return userDao.updateUserinfo(user);
    }

    @Override
    public User selectOne(Integer user_id) {
        return userDao.selectOne(user_id);
    }

    @Override
    public List<User> selectAll() {
        return userDao.selectAll();
    }
}

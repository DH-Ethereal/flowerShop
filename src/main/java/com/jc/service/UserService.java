package com.jc.service;

import com.jc.pojo.Admin;
import com.jc.pojo.User;

import java.util.List;

/**
 * @program: flowerShop
 * @description: user的service层
 * @author: hjc
 * @create: 2021-06-19 16:43
 **/
public interface UserService {
    //管理员登录
    public Admin aLogin(String adminId, String adminPwd);
    //用户登录
    public User login(String login_name, String pwd);
    //用户注册
    public int signUp(User user);
    //注销用户
    public int deleteUser(Integer user_id);
    //修改用户信息
    public int updateUserinfo(User user);
    //查询一个用户
    public User selectOne(Integer user_id);
    //查询所有用户
    public List<User> selectAll();
}

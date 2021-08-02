package com.jc.dao;

import com.jc.pojo.Admin;
import com.jc.pojo.User;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface UserDao {
    //管理员登录
    public Admin aLogin(@Param("adminId") String adminId,@Param("adminPwd") String adminPwd);
    //用户登录
    public User login(@Param("login_name") String login_name, @Param("pwd") String pwd);
    //用户注册
    public int signUp(User user);
    //注销用户
    public int deleteUser(@Param("user_id") Integer user_id);
    //修改用户信息
    public int updateUserinfo(User user);
    //查询一个用户
    public User selectOne(@Param("user_id") Integer user_id);
    //查询所有用户
    public List<User> selectAll();
}

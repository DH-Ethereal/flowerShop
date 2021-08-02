package com.jc.controller;

import com.jc.pojo.Admin;
import com.jc.pojo.Flower;
import com.jc.pojo.User;
import com.jc.service.FlowerService;
import com.jc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @program: flowerShop
 * @description: 用户信息
 * @author: hjc
 * @create: 2021-06-19 20:32
 **/
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserService")
    private UserService userService;
    @Autowired
    @Qualifier("FlowerService")
    private FlowerService flowerService;

    //后台数据
    public void bgData(Model model){
        List<User> userList = userService.selectAll();
        List<Flower> flowerList = flowerService.selectSort(null,null);
        model.addAttribute("userList",userList);
        model.addAttribute("flowerList",flowerList);
    }

    //后台登录
    @RequestMapping(value = "bgLogin",method = RequestMethod.POST)
    public String bgLogin(Admin admin,HttpSession session,Model model){
        Admin ad = userService.aLogin(admin.getAd_name(),admin.getAd_pwd());
        if (ad != null){
            session.setAttribute("admin",admin);
            bgData(model);
            return "bms";
        }
        model.addAttribute("info","登录失败!");
        model.addAttribute("img","/img/false.png");
        return "redirect:/bgLogin.jsp";
    }

    //登录
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(Model model, HttpSession session, @RequestParam("login_name") String login_name,@RequestParam("password") String password){
        User user = userService.login(login_name,password);
        if (user != null){
            session.setAttribute("user",user);
            return "forward:/index.jsp";
        }
        model.addAttribute("info","登录失败!");
        model.addAttribute("img","/img/false.png");
        return "login";
    }

    //注册
    @RequestMapping(value = "sign",method = RequestMethod.POST)
    public String sign(Model model,User user,@RequestParam(value = "it",required = true,defaultValue = "99") String it,@RequestParam(value = "p",required = true,defaultValue = "") String p){
        model.addAttribute("it",it);
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        user.setRecord_date(date);
        int num = 0;
        try {
            num = userService.signUp(user);
        }catch (Exception e){
            num = 0;
        }
        if (num == 1){
            model.addAttribute("info","注册成功!");
            model.addAttribute("img","/img/true.png");
            if (p.equals("reg")){
                bgData(model);
                return "bms";
            }
            return "sign";
        }
        model.addAttribute("info","注册失败!");
        model.addAttribute("img","/img/false.png");
        if (p.equals("reg")){
            bgData(model);
            return "bms";
        }
        return "sign";
    }

    //删除账号
    @RequestMapping("remove")
    public String remove(Model model,@RequestParam("user_id") int user_id){
        int num = 0;
        try {
            num = userService.deleteUser(user_id);
        }catch (Exception e){
            num = 0;
        }
        bgData(model);
        if (num == 1){
            model.addAttribute("info","注销成功!");
            model.addAttribute("img","/img/true.png");
            return "bms";
        }
        model.addAttribute("info","注销失败!");
        model.addAttribute("img","/img/false.png");
        return "bms";
    }

    //修改
    @RequestMapping("updateUserInfo")
    public String updateUserInfo(Model model,User user){
        int num = 0;
        try {
            num = userService.updateUserinfo(user);
        }catch (Exception e){
            num = 0;
        }
        bgData(model);
        if (num == 1){
            model.addAttribute("info","修改成功!");
            model.addAttribute("img","/img/true.png");
            return "bms";
        }
        model.addAttribute("info","修改失败!");
        model.addAttribute("img","/img/false.png");
        return "bms";
    }

    //注销
    @RequestMapping("xh")
    public String xh(@RequestParam(value = "p",required = true,defaultValue = "") String p, HttpSession session){
        session.invalidate();
        if (p.equals("reg")){
            return "redirect:/bgLogin.jsp";
        }
        return "login";
    }
}

package com.jc.controller;

import com.jc.pojo.Cart;
import com.jc.pojo.Flower;
import com.jc.pojo.Order;
import com.jc.pojo.User;
import com.jc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @program: flowerShop
 * @description: 打开页面
 * @author: hjc
 * @create: 2021-06-21 22:44
 **/
@Controller
@RequestMapping("/open")
public class OpenController {
    @Autowired
    @Qualifier("CartService")
    private CartService cartService;
    @Autowired
    @Qualifier("UserService")
    private UserService userService;
    @Autowired
    @Qualifier("FlowerService")
    private FlowerService flowerService;
    @Autowired
    @Qualifier("OrderService")
    private OrderService orderService;
    @Autowired
    @Qualifier("OrderListService")
    private OrderListService orderListService;

    //登录界面
    @RequestMapping("openLogin")
    public String openLogin(){
        return "login";
    }

    //注册界面
    @RequestMapping("openSign")
    public String openSign(){
        return "sign";
    }

    //首页
    @RequestMapping("index")
    public String index(Model model,HttpSession session, @RequestParam(value = "user_id",required = true,defaultValue = "0") int user_id){
        User user = userService.selectOne(user_id);
        if (user != null){
            session.setAttribute("user",user);
        }
        List<Flower> hfList = flowerService.selectSort("专业手工花束",null);
        List<Flower> lfList = flowerService.selectSort("信箱的花",null);
        List<Flower> lfsList = flowerService.selectSort("豪华的花",null);
        List<Flower> dkList = flowerService.selectSort("情人节鲜花",null);
        List<Flower> ssList = flowerService.selectSort("特别供应",null);
        model.addAttribute("hfList",hfList);
        model.addAttribute("lfList",lfList);
        model.addAttribute("lfsList",lfsList);
        model.addAttribute("dkList",dkList);
        model.addAttribute("ssList",ssList);
        return "index";
    }

    //user_center数据
    public void user_centerData(Model model,HttpSession session){
        model.addAttribute("ols",orderListService);
        User user = (User) session.getAttribute("user");
        List<Cart> cartList = cartService.getSelfCart(user.getUser_id());
        model.addAttribute("cartList",cartList);
        List<Order> orders = orderService.selectAll(user.getUser_id());
        model.addAttribute("orders",orders);
    }

    //user_center跳转
    @RequestMapping("jump")
    public String jump(@RequestParam("it") String it, Model model, HttpSession session){
        model.addAttribute("it",it);
        User user = (User) session.getAttribute("user");
        if (user == null){
            return "login";
        }
        user_centerData(model,session);
        return "user_center";
    }
}

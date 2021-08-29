package com.jc.controller;

import com.jc.pojo.Cart;
import com.jc.pojo.Flower;
import com.jc.pojo.Order;
import com.jc.pojo.User;
import com.jc.service.CartService;
import com.jc.service.FlowerService;
import com.jc.service.OrderListService;
import com.jc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: flowerShop
 * @description: 购物车
 * @author: hjc
 * @create: 2021-06-23 09:37
 **/
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    @Qualifier("CartService")
    private CartService cartService;
    @Autowired
    @Qualifier("FlowerService")
    private FlowerService flowerService;
    @Autowired
    @Qualifier("OrderService")
    private OrderService orderService;
    @Autowired
    @Qualifier("OrderListService")
    private OrderListService orderListService;

    //user_center数据
    public void user_centerData(Model model,HttpSession session){
        model.addAttribute("ols",orderListService);
        User user = (User) session.getAttribute("user");
        List<Cart> cartList = cartService.getSelfCart(user.getUser_id());
        model.addAttribute("cartList",cartList);
        List<Order> orders = orderService.selectAll(user.getUser_id());
        model.addAttribute("orders",orders);
    }

    //添加购物车
    @RequestMapping("addCart")
    public String addCart(Model model, HttpSession session,String flowercode){
        Flower flower = flowerService.selectOne(flowercode);
        model.addAttribute("flower",flower);
        //声明一个购物车
        Cart cart = null;
        User user = (User) session.getAttribute("user");
        //判断用户是否登录
        if (user == null){
            return "login";
        }
        //获取本人购物车
        List<Cart> myselfCarts = cartService.getSelfCart(user.getUser_id());
        //存入map,键为商品编号，值为此编号的购物车
        Map<String,Cart> cartMap = new HashMap<>();
        for(Cart c : myselfCarts){
            cartMap.put(c.getFlower().getFlowercode(),c);
        }
        int num = 0;
        //判断购物车是否存在该商品
        if (cartMap.containsKey(flowercode)){//修改数量
            Integer amount = cartMap.get(flowercode).getCount();//获取其数量
            amount++;
            cart = new Cart();
            cart.setUser(cartMap.get(flowercode).getUser());
            cart.setFlower(cartMap.get(flowercode).getFlower());
            cart.setCount(amount);
            cart.setCart_id(cartMap.get(flowercode).getCart_id());
            try {
                num = cartService.updateCart(cart);
            }catch (Exception e){
                num = 0;
            }
        }else {
            cart = new Cart();
            cart.setUser(user);
            cart.setFlower(flowerService.selectOne(flowercode));
            cart.setCount(1);
            try {
                num = cartService.addCart(cart);
            }catch (Exception e){
                num = 0;
            }
        }
        if (num != 0){
            model.addAttribute("info","成功加入购物车!");
            model.addAttribute("img","/img/true.png");
            return "detail";
        }else {
            model.addAttribute("info","添加失败");
            model.addAttribute("img","/img/true.png");
            return "detail";
        }
    }

    //删除指定商品购物车
    @RequestMapping("deleteCart")
    public String deleteCart(Model model,HttpSession session,Integer cart_id,String it){
        model.addAttribute("it",it);
        int num = 0;
        try {
            num = cartService.deleteCart(cart_id);
        }catch (Exception e){
            num = 0;
        }
        user_centerData(model,session);
        if (num != 0){
            model.addAttribute("info","已移出购物车!");
            model.addAttribute("img","/img/true.png");
            return "user_center";
        }else {
            model.addAttribute("info","移出失败!");
            model.addAttribute("img","/img/false.png");
            return "user_center";
        }
    }

    //清空购物车
    @RequestMapping("deleteCarts")
    public String deleteCarts(Model model,HttpSession session,String it){
        User user = (User) session.getAttribute("user");
        model.addAttribute("it",it);
        int num = 0;
        try {
            num = cartService.deleteCart(user.getUser_id());
        }catch (Exception e){
            num = 0;
        }
        user_centerData(model,session);
        if (num != 0){
            model.addAttribute("info","已清空购物车!");
            model.addAttribute("img","/img/true.png");
            return "user_center";
        }else {
            model.addAttribute("info","清空失败!");
            model.addAttribute("img","/img/false.png");
            return "user_center";
        }
    }

    //修改数量
    @RequestMapping("updateCart")
    public String updateCart(Model model,Integer cart_id,Integer count,String it,HttpSession session){
        model.addAttribute("it",it);
        Cart cart = cartService.getOneCart(cart_id);
        cart.setCount(count);
        int num = 0;
        try {
            num = cartService.updateCart(cart);
        }catch (Exception e){
            num = 0;
        }
        user_centerData(model,session);
        return "user_center";
    }
}

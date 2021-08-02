package com.jc.controller;

import com.jc.pojo.Cart;
import com.jc.pojo.Order;
import com.jc.pojo.OrderList;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @program: flowerShop
 * @description: 订单
 * @author: hjc
 * @create: 2021-06-23 10:44
 **/
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    @Qualifier("OrderService")
    private OrderService orderService;
    @Autowired
    @Qualifier("OrderListService")
    private OrderListService orderListService;
    @Autowired
    @Qualifier("CartService")
    private CartService cartService;
    @Autowired
    @Qualifier("FlowerService")
    private FlowerService flowerService;

    //user_center数据
    public void user_centerData(Model model,HttpSession session){
        model.addAttribute("ols",orderListService);
        User user = (User) session.getAttribute("user");
        List<Cart> cartList = cartService.getSelfCart(user.getUser_id());
        model.addAttribute("cartList",cartList);
        List<Order> orders = orderService.selectAll(user.getUser_id());
        model.addAttribute("orders",orders);
    }

    //下订单
    @RequestMapping("addOrder")
    public String addOrder(Model model, HttpSession session, Order order, String it){
        boolean flag = true;
        model.addAttribute("it",it);
        User user = (User) session.getAttribute("user");
        String order_id = orderId();
        order.setOrder_id(order_id);
        String od_createtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        order.setOd_createtime(od_createtime);
        order.setUser(user);
        int n = 0,m = 0;
        //创建一个订单
        try {
            n = orderService.addOrder(order);
        }catch (Exception e){
            n = 0;
        }
        //获取购物车,做订单详情，且改变商品数量
        List<Cart> cartList = cartService.getSelfCart(user.getUser_id());
        if (n == 1){
            for (Cart cart : cartList){
                OrderList orderList = new OrderList();
                orderList.setOrder(orderService.selectOne(order_id));
                orderList.setFlower(cart.getFlower());
                orderList.setCount(cart.getCount());
                orderList.setSummary(cart.getTotalprice());
                int i = 0,j = 0;
                try {
                    i = orderListService.addOrderList(orderList);
                    //减少商品数量
                    j = flowerService.cull(cart.getCount(),cart.getFlower().getFlowercode());
                }catch (Exception e){
                    i = 0;
                    j = 0;
                }
                if (i==0||j==0){
                    flag = false;
                    break;
                }
            }
            //清空购物车
            if(flag){
                try {
                    m = cartService.deleteAllCart(user.getUser_id());
                }catch (Exception e){
                    m = 0;
                }
            }
        }
        user_centerData(model,session);
        if (n == 1&&flag&&m == 1){
            model.addAttribute("info","订购成功!");
            model.addAttribute("img","/img/true.png");
            return "user_center";
        }else {
            model.addAttribute("info","订购失败!");
            model.addAttribute("img","/img/false.png");
            return "user_center";
        }
    }

    //取消订单
    @RequestMapping("deleteOrder")
    public String deleteOrder(Model model,HttpSession session,String it,String order_id){
        boolean flag = true;
        model.addAttribute("it",it);
        List<OrderList> orderLists = orderListService.selectAll(order_id);
        for (OrderList orderList : orderLists) {
            //商品数量增加
            int n = 0,m = 0;
            try {
                n = flowerService.increase(orderList.getCount(),orderList.getFlower().getFlowercode());
                m = orderListService.deleteOrderList(orderList.getOd_id());
            }catch (Exception e){
                n = 0;
                m = 0;
            }
            if (n == 0 || m == 0){
                flag = false;
                break;
            }
        }
        int j = 0;
        if (flag){
            //删除订单
            try {
                j = orderService.deleteOrder(order_id);
            }catch (Exception e){
                j = 0;
            }
        }
        user_centerData(model,session);
        if (j == 1){
            model.addAttribute("info","取消成功!");
            model.addAttribute("img","/img/true.png");
            return "user_center";
        }else {
            model.addAttribute("info","取消失败!");
            model.addAttribute("img","/img/false.png");
            return "user_center";
        }
    }

    //生成订单号
    public String orderId(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return sdf.format(new Date());
    }
}

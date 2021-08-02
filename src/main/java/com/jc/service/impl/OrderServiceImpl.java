package com.jc.service.impl;

import com.jc.dao.OrderDao;
import com.jc.pojo.Order;
import com.jc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: flowerShop
 * @description: OrderService实现
 * @author: hjc
 * @create: 2021-06-21 23:41
 **/
public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao;

    @Autowired
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    public int addOrder(Order order) {
        return orderDao.addOrder(order);
    }

    @Override
    public int deleteOrder(String order_id) {
        return orderDao.deleteOrder(order_id);
    }

    @Override
    public int updateOrder(Order order) {
        return orderDao.updateOrder(order);
    }

    @Override
    public Order selectOne(String order_id) {
        return orderDao.selectOne(order_id);
    }

    @Override
    public List<Order> selectAll(Integer user_id) {
        return orderDao.selectAll(user_id);
    }
}

package com.jc.service;

import com.jc.pojo.Order;

import java.util.List;

public interface OrderService {
    public int addOrder(Order order);//增
    public int deleteOrder(String order_id);//删
    public int updateOrder(Order order);//改
    public Order selectOne(String order_id);//查一个
    public List<Order> selectAll(Integer user_id);//查
}

package com.jc.dao;

import com.jc.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    public int addOrder(Order order);//增
    public int deleteOrder(@Param("order_id") String order_id);//删
    public int updateOrder(Order order);//改
    public Order selectOne(@Param("order_id") String order_id);//查一个
    public List<Order> selectAll(@Param("user_id") Integer user_id);//查
}

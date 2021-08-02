package com.jc.service;

import com.jc.pojo.OrderList;

import java.util.List;

public interface OrderListService {
    public int addOrderList(OrderList orderList);//增
    public int deleteOrderList(Integer od_id);//删
    public int updateOrderList(OrderList orderList);//改
    public OrderList selectOne(Integer od_id);//查一个
    public List<OrderList> selectAll(String order_id);//查
}

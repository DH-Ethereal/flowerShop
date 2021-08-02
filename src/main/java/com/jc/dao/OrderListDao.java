package com.jc.dao;

import com.jc.pojo.OrderList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderListDao {
    public int addOrderList(OrderList orderList);//增
    public int deleteOrderList(@Param("od_id") Integer od_id);//删
    public int updateOrderList(OrderList orderList);//改
    public OrderList selectOne(@Param("od_id") Integer od_id);//查一个
    public List<OrderList> selectAll(@Param("order_id") String order_id);//查
}

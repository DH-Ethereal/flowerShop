package com.jc.service.impl;

import com.jc.dao.OrderListDao;
import com.jc.pojo.OrderList;
import com.jc.service.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: flowerShop
 * @description: OrderListService实现
 * @author: hjc
 * @create: 2021-06-21 23:44
 **/
public class OrderListServiceImpl implements OrderListService {

    private OrderListDao orderListDao;

    @Autowired
    public void setOrderListDao(OrderListDao orderListDao) {
        this.orderListDao = orderListDao;
    }

    @Override
    public int addOrderList(OrderList orderList) {
        return orderListDao.addOrderList(orderList);
    }

    @Override
    public int deleteOrderList(Integer od_id) {
        return orderListDao.deleteOrderList(od_id);
    }

    @Override
    public int updateOrderList(OrderList orderList) {
        return orderListDao.updateOrderList(orderList);
    }

    @Override
    public OrderList selectOne(Integer od_id) {
        return orderListDao.selectOne(od_id);
    }

    @Override
    public List<OrderList> selectAll(String order_id) {
        return orderListDao.selectAll(order_id);
    }
}

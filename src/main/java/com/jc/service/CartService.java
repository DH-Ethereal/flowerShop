package com.jc.service;

import com.jc.pojo.Cart;

import java.util.List;

public interface CartService {
    public int addCart(Cart cart);//增
    public int updateCart(Cart cart);//修改
    public int deleteCart(Integer cart_id);//删除一件商品
    //清空本人购物车
    public int deleteAllCart(Integer user_id);
    //查询一个购物车
    public Cart getOneCart(Integer cart_id);
    //查询本人购物车
    public List<Cart> getSelfCart(Integer user_id);
}

package com.jc.dao;

import com.jc.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartDao {
    public int addCart(Cart cart);//增
    public int updateCart(Cart cart);//修改
    public int deleteCart(@Param("cart_id") Integer cart_id);//删除一件商品
    //清空本人购物车
    public int deleteAllCart(@Param("user_id") Integer user_id);
    //查询一个购物车
    public Cart getOneCart(@Param("cart_id") Integer cart_id);
    //查询本人购物车
    public List<Cart> getSelfCart(@Param("user_id") Integer user_id);
}

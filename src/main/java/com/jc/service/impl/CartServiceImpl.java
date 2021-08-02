package com.jc.service.impl;

import com.jc.dao.CartDao;
import com.jc.pojo.Cart;
import com.jc.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: flowerShop
 * @description: CartService实现
 * @author: hjc
 * @create: 2021-06-21 23:37
 **/
public class CartServiceImpl implements CartService {

    private CartDao cartDao;

    @Autowired
    public void setCartDao(CartDao cartDao) {
        this.cartDao = cartDao;
    }

    @Override
    public int addCart(Cart cart) {
        return cartDao.addCart(cart);
    }

    @Override
    public int updateCart(Cart cart) {
        return cartDao.updateCart(cart);
    }

    @Override
    public int deleteCart(Integer cart_id) {
        return cartDao.deleteCart(cart_id);
    }

    @Override
    public int deleteAllCart(Integer user_id) {
        return cartDao.deleteAllCart(user_id);
    }

    @Override
    public Cart getOneCart(Integer cart_id) {
        return cartDao.getOneCart(cart_id);
    }

    @Override
    public List<Cart> getSelfCart(Integer user_id) {
        return cartDao.getSelfCart(user_id);
    }
}

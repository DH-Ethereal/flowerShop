package com.jc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @program: flowerShop
 * @description: 购物车实体类
 * @author: hjc
 * @create: 2021-06-19 15:01
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Integer cart_id;
    private User user;
    private Flower flower;
    private Integer count;
    private Double totalprice;

    public Double getTotalprice() {
        String price1=Double.toString(this.getFlower().getPrice());
        String count1=Integer.toString(this.getCount());
        BigDecimal price=new BigDecimal(price1);
        BigDecimal count=new BigDecimal(count1);
        double totalprice=price.multiply(count).doubleValue();
        return totalprice;
    }
}

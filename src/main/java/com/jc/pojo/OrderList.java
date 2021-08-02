package com.jc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: flowerShop
 * @description: 订单详情实体类
 * @author: hjc
 * @create: 2021-06-19 15:04
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderList {
    private Integer od_id;//订单明细id
    private Order order;//订单
    private Flower flower;//商品
    private Integer count;//商品数量
    private Double summary;//商品小计
}

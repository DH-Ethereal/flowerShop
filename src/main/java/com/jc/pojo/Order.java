package com.jc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: flowerShop
 * @description: 订单实体类
 * @author: hjc
 * @create: 2021-06-19 15:03
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private String order_id;//订单编号
    private String touser_name;//收货人姓名
    private String touser_tel;//收货人电话
    private String touser_address;//收货人地址
    private Double totalprice;//总金额
    private String od_createtime;//创建时期
    private Integer status=0;//0.未完成，1.已完成
    private String od_remark;//备注
    private User user;
}

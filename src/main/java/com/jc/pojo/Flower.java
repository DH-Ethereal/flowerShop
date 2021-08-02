package com.jc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: flowerShop
 * @description: 商品花的实体类
 * @author: hjc
 * @create: 2021-06-19 15:00
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Flower {
    private String flowercode;//商品编号
    private String type;//商品类别
    private String flower_name;//商品名称
    private String material;//材料
    private String pack;//包装
    private String descs;//花语
    private Double price;//价格
    private Double discount=1.00;//折扣
    private String image;//图片
    private String deliverarea;//配送范围
    private Integer amount;//数量
    private String createtime;//创建时间
    private String remark;//商品说明
}

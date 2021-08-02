package com.jc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: flowerShop
 * @description: 管理员实体类
 * @author: hjc
 * @create: 2021-06-19 14:55
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private String ad_id;
    private String ad_name;
    private String ad_pwd;
    private String end_time;
}

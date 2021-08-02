package com.jc.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: flowerShop
 * @description: 用户实体类
 * @author: hjc
 * @create: 2021-06-19 14:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer user_id;
    private String user_name;
    private String password;
    private String sex;
    private String birthday;
    private String tel;
    private String mail;
    private Integer grade;
    private String record_date;
}

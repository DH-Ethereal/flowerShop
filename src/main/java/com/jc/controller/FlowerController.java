package com.jc.controller;

import com.jc.pojo.Flower;
import com.jc.pojo.User;
import com.jc.service.FlowerService;
import com.jc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringJoiner;

/**
 * @program: flowerShop
 * @description: 商品信息
 * @author: hjc
 * @create: 2021-06-23 00:22
 **/
@Controller
@RequestMapping("/flower")
public class FlowerController {
    @Autowired
    @Qualifier("UserService")
    private UserService userService;
    @Autowired
    @Qualifier("FlowerService")
    private FlowerService flowerService;

    //后台数据
    public void bgData(Model model){
        List<User> userList = userService.selectAll();
        List<Flower> flowerList = flowerService.selectSort(null,null);
        model.addAttribute("userList",userList);
        model.addAttribute("flowerList",flowerList);
    }

    //查一些花
    @RequestMapping("findFlowers")
    public String findFlowers(Model model, @RequestParam(value = "type",required = true ,defaultValue = "null") String type,@RequestParam(value = "sort",required = true ,defaultValue = "null") String sort){
        if (type.equals("null")){
            type = null;
        }
        if (sort.equals("null")){
            sort = null;
        }
        if (sort == null){
            sort = "精选";
        }
        model.addAttribute("sort",sort);
        List<Flower> flowerList = flowerService.selectSort(type,sort);
        model.addAttribute("flowerList",flowerList);
        model.addAttribute("type",type);
        return "kind";
    }

    //查一个花
    @RequestMapping("findOne")
    public String findOne(Model model,@RequestParam("flowercode") String flowercode){
        Flower flower = flowerService.selectOne(flowercode);
        model.addAttribute("flower",flower);
        return "detail";
    }

    //下架商品
    @RequestMapping("removeOne")
    public String removeOne(Model model,@RequestParam("flowercode") String flowercode,@RequestParam("it") String it){
        model.addAttribute("it",it);
        int num = 0;
        try {
            num = flowerService.deleteFlower(flowercode);
        }catch (Exception e){
            num = 0;
        }
        bgData(model);
        if (num != 0){
            model.addAttribute("info","下架成功!");
            model.addAttribute("img","/img/true.png");
            return "bms";
        }
        model.addAttribute("info","下架失败!");
        model.addAttribute("img","/img/false.png");
        return "bms";
    }

    //新增、修改花
    @RequestMapping("setFlower")
    public String setFlower(Model model,Flower flower,String img01,String img02,String img03,String img04,String img05,String img06,String it,String get){
        //拼接字符串
        StringJoiner image = new StringJoiner(",");
        String img[] = {img01,img02,img03,img04,img05,img06};
        for (String s:img) {
            image.add(s);
        }
        flower.setImage(image.toString());
        model.addAttribute("it",it);
        //是否成功
        int num = 0;
        if (get.equals("add")){
            String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            flower.setCreatetime(createTime);
            try {
                num = flowerService.addFlower(flower);
            }catch (Exception e){
                num = 0;
            }
            bgData(model);
            if (num != 0){
                model.addAttribute("info","上架成功!");
                model.addAttribute("img","/img/true.png");
                return "bms";
            }
            model.addAttribute("info","上架失败!");
            model.addAttribute("img","/img/false.png");
            return "bms";
        }else {
            //修改商品信息
            try {
                num = flowerService.updateFlower(flower);
            }catch (Exception e){
                num = 0;
            }
        }
        bgData(model);
        if (num != 0){
            model.addAttribute("info","修改成功!");
            model.addAttribute("img","/img/true.png");
            return "bms";
        }
        model.addAttribute("info","修改失败!");
        model.addAttribute("img","/img/false.png");
        return "bms";
    }
}

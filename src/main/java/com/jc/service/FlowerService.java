package com.jc.service;

import com.jc.pojo.Flower;

import java.util.List;

public interface FlowerService {
    public int addFlower(Flower flower);//增
    public int deleteFlower(String flowercode);//删
    public int updateFlower(Flower flower);//改
    public Flower selectOne(String flowercode);//查一个
    public List<Flower> selectSort(String type, String sort);//查一类
    public int cull(Integer amount,String flowercode);//售卖商品
    public int increase(Integer amount,String flowercode);//用户取消订单后，增加商品
}

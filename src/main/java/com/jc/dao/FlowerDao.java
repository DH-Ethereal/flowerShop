package com.jc.dao;

import com.jc.pojo.Flower;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FlowerDao {
    public int addFlower(Flower flower);//增
    public int deleteFlower(@Param("flowercode") String flowercode);//删
    public int updateFlower(Flower flower);//改
    public Flower selectOne(@Param("flowercode") String flowercode);//查一个
    public List<Flower> selectSort(@Param("type") String type,@Param("sort") String sort);//查一类
    public int cull(@Param("amount") Integer amount,@Param("flowercode") String flowercode);//售卖商品
    public int increase(@Param("amount") Integer amount,@Param("flowercode") String flowercode);//用户取消订单后，增加商品
}

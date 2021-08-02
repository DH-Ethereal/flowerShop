package com.jc.service.impl;

import com.jc.dao.FlowerDao;
import com.jc.pojo.Flower;
import com.jc.service.FlowerService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: flowerShop
 * @description: FlowerService实现
 * @author: hjc
 * @create: 2021-06-21 23:34
 **/
public class FlowerServiceImpl implements FlowerService {

    private FlowerDao flowerDao;

    @Autowired
    public void setFlowerDao(FlowerDao flowerDao) {
        this.flowerDao = flowerDao;
    }

    @Override
    public int addFlower(Flower flower) {
        return flowerDao.addFlower(flower);
    }

    @Override
    public int deleteFlower(String flowercode) {
        return flowerDao.deleteFlower(flowercode);
    }

    @Override
    public int updateFlower(Flower flower) {
        return flowerDao.updateFlower(flower);
    }

    @Override
    public Flower selectOne(String flowercode) {
        return flowerDao.selectOne(flowercode);
    }

    @Override
    public List<Flower> selectSort(String type, String sort) {
        return flowerDao.selectSort(type,sort);
    }

    @Override
    public int cull(Integer amount, String flowercode) {
        return flowerDao.cull(amount,flowercode);
    }

    @Override
    public int increase(Integer amount, String flowercode) {
        return flowerDao.increase(amount,flowercode);
    }
}

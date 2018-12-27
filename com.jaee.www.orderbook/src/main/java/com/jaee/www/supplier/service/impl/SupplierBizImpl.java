package com.jaee.www.supplier.service.impl;

import com.jaee.www.college.dao.OrderBookDao;
import com.jaee.www.college.dao.TakesDao;
import com.jaee.www.entity.custom.OrderBookReviewVo;
import com.jaee.www.entity.custom.OrderBookVo;
import com.jaee.www.entity.custom.ReviewedBookVo;
import com.jaee.www.supplier.service.SupplierBiz;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;


@Service
public class SupplierBizImpl implements SupplierBiz {

    @Resource
    private OrderBookDao orderBookDao;


    //直接拷贝
    public List<ReviewedBookVo> findAllReviewedBook() {
        List<ReviewedBookVo> reviewedBookVoList = orderBookDao.findAllReviewedBook();
        return reviewedBookVoList;
    }

}

package com.jaee.www.supplier.service;

import java.util.List;

import com.jaee.www.entity.custom.ReviewedBookVo;


public interface SupplierBiz {
    public List<ReviewedBookVo> findAllReviewedBook();
}

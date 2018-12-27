package com.jaee.www.supplier.service;

import java.util.List;

import com.jaee.www.entity.custom.ReviewedBookVo;

/**
 * Created by c0de8ug on 16-2-16.
 */
public interface SupplierBiz {
    public List<ReviewedBookVo> findAllReviewedBook();
}

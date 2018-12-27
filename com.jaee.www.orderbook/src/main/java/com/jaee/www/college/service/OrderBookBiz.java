package com.jaee.www.college.service;

import java.util.List;

import com.jaee.www.entity.Section;
import com.jaee.www.entity.custom.AddedBookVo;
import com.jaee.www.entity.custom.ChangedItems;
import com.jaee.www.entity.custom.OrderBookReviewVo;
import com.jaee.www.entity.custom.OrderBookVo;

/**
 * Created by c0de8ug on 16-2-13.
 */
public interface OrderBookBiz {
    public List<Section> findSelectedSection(String staffId, String year);

    public void add(OrderBookVo orderBookVo);

    public List<AddedBookVo> findAddedBookInfoList(String staffId);

    public void update(ChangedItems changedItems, String staffId);

    public void audit(List<OrderBookReviewVo> orderBookReviewVoList);

    public List<OrderBookReviewVo> findAllNotReviewedBook();
}

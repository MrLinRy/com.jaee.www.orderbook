package com.jaee.www.student.service.Impl;

import com.jaee.www.college.dao.SectionDao;
import com.jaee.www.college.dao.TakesDao;
import com.jaee.www.entity.Section;
import com.jaee.www.entity.custom.SectionCustom;
import com.jaee.www.student.service.ElectiveBiz;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class ElectiveBizImpl implements ElectiveBiz {

    @Resource
    private TakesDao takesDao;

    @Resource
    private SectionDao sectionDao;

    public void add(int secId, String stdId) {
        takesDao.add(secId, stdId);
    }

    @Override
    public List<SectionCustom> findAllSection() {
        return sectionDao.findAllCustom();
    }

    @Override
    public void delete(int secId, String stdId) {
        takesDao.delete(secId,stdId);
    }
}

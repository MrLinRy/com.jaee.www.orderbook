package com.jaee.www.college.service.impl;

import com.jaee.www.college.dao.DeptDao;
import com.jaee.www.college.dao.SpecDao;
import com.jaee.www.college.service.SpecBiz;
import com.jaee.www.entity.Spec;
import com.jaee.www.entity.custom.DeptAndSpec;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by c0de8ug on 16-2-11.
 */
@Service
public class SpecBizImpl implements SpecBiz {

    @Resource
    private SpecDao specDao;

    @Resource
    private DeptDao deptDao;

    public List<DeptAndSpec> findDeptAndSpec() {
        return specDao.findDeptAndSpec();
    }

    @Override
    public void update(String specName, String newSpecName) {
        specDao.update(specName, newSpecName);
    }

    @Override
    public void add(Spec spec) {
        specDao.add(spec);
    }

    @Override
    public void delete(String specName) {
        specDao.delete(specName);
    }

    @Override
    public List<String> findDpet() {
        return deptDao.findAllDeptName();
    }
}

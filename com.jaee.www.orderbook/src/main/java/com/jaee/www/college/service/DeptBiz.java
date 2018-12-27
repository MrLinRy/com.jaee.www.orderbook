package com.jaee.www.college.service;

import java.util.List;

import com.jaee.www.entity.Dept;
import com.jaee.www.entity.custom.DeptAndSpec;

/**
 * Created by c0de8ug on 16-2-11.
 */
public interface DeptBiz {
    public List<Dept> findAll();

    public void add(String deptName);

    public void update(Dept dept);

    public void delete(int deptId);

}

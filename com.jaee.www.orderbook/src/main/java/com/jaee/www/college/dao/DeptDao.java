package com.jaee.www.college.dao;

import java.util.List;

import com.jaee.www.entity.Dept;
import com.jaee.www.entity.custom.DeptAndSpec;


public interface DeptDao {
    public List<Dept> findAll();

    public void add(String deptName);

    public String findIdByName(String deptName);

    public void update(Dept dept);

    public void delete(int deptId);

    public List<String> findAllDeptName();

}

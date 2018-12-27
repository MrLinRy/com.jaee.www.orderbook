package com.jaee.www.college.dao;

import org.apache.ibatis.annotations.Param;

import com.jaee.www.entity.Spec;
import com.jaee.www.entity.custom.DeptAndSpec;

import java.util.List;


public interface SpecDao {
    public List<Spec> findAll();

    public void update(@Param("specName") String specName, @Param("newSpecName") String newSpecName);

    public void add(Spec spec);

    public void delete(String specName);

    public List<DeptAndSpec> findDeptAndSpec();

    public String findIdByName(String specName);

    public List<String> findAllSpecName();
}

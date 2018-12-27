package com.jaee.www.college.dao;

import java.util.List;

import com.jaee.www.entity.Staff;


public interface StaffDao {
    public List<String> findAllName();

    public String findIdByName(String staffId);

    public List<Staff> findAll();

    void add(Staff staff);
}

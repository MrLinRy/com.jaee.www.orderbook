package com.jaee.www.college.dao;

import java.util.List;

import com.jaee.www.entity.Staff;

/**
 * Created by c0de8ug on 16-2-12.
 */
public interface StaffDao {
    public List<String> findAllName();

    public String findIdByName(String staffId);

    public List<Staff> findAll();

    void add(Staff staff);
}

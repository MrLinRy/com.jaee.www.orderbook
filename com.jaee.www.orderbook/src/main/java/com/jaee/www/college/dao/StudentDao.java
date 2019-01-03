package com.jaee.www.college.dao;

import java.util.List;

import com.jaee.www.entity.Student;


public interface StudentDao {
    public List<Student> findAll();

    public void add(Student student);

    public void update(Student student);

    public void delete(String studentId);
}

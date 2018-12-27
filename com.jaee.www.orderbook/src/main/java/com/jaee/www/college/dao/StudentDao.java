package com.jaee.www.college.dao;

import java.util.List;

import com.jaee.www.entity.Student;

/**
 * Created by c0de8ug on 16-2-12.
 */
public interface StudentDao {
    public List<Student> findAll();

    public void add(Student student);

    public void update(Student student);

    public void delete(int studentId);
}

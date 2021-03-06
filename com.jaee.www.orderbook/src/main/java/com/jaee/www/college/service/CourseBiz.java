package com.jaee.www.college.service;

import org.springframework.ui.Model;

import com.jaee.www.entity.Course;

import java.util.List;

/**
 * Created by c0de8ug on 16-2-12.
 */
public interface CourseBiz {
    public List<Course> findAll();

    public List<String> findAllSpecName();

    public void add(Course course);

    public void delete(String courseTitle);
}

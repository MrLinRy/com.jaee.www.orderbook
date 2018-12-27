package com.jaee.www.college.dao;

import java.util.List;

import com.jaee.www.entity.Course;


public interface CourseDao {
    public List<Course> findAll();

    public void add(Course course);

    public void delete(String courseTitle);

    public List<String> findAllCourseTitle();
}

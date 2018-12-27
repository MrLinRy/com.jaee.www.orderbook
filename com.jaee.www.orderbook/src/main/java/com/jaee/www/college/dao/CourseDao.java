package com.jaee.www.college.dao;

import java.util.List;

import com.jaee.www.entity.Course;

/**
 * Created by c0de8ug on 16-2-12.
 */
public interface CourseDao {
    public List<Course> findAll();

    public void add(Course course);

    public void delete(String courseTitle);

    public List<String> findAllCourseTitle();
}

package com.jaee.www.college.service.impl;

import com.jaee.www.college.dao.CourseDao;
import com.jaee.www.college.dao.SpecDao;
import com.jaee.www.college.service.CourseBiz;
import com.jaee.www.entity.Course;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by c0de8ug on 16-2-12.
 */
@Service
public class CourseBizImpl implements CourseBiz {

    @Resource
    private CourseDao courseDao;

    @Resource
    private SpecDao specDao;

    @Override
    public List<Course> findAll() {
        return courseDao.findAll();
    }

    @Override
    public List<String> findAllSpecName() {
        return specDao.findAllSpecName();
    }

    @Override
    public void add(Course course) {
        courseDao.add(course);
    }

    @Override
    public void delete(String courseTitle) {
        courseDao.delete(courseTitle);
    }
}

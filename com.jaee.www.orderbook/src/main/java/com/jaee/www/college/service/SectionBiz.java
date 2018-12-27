package com.jaee.www.college.service;

import java.util.List;

import com.jaee.www.entity.Section;
import com.jaee.www.entity.Staff;
import com.jaee.www.entity.Timetable;
import com.jaee.www.entity.custom.SectionCustom;

/**
 * Created by c0de8ug on 16-2-12.
 */
public interface SectionBiz {
    public void delete(int sectionId);

    public void add(Section section);

    public List<SectionCustom> findAllCustom();

    public List<String> findAllCourseTitle();

    public List<Staff> findAllStaff();

    public void addTimetable(Timetable timetable);
}

package com.jaee.www.entity.custom;

import java.util.List;

import com.jaee.www.entity.Section;
import com.jaee.www.entity.Timetable;


//TODO 对于这些满足业务需求的pojo自定义名字定义感觉不太会
public class SectionCustom extends Section {
    String teacher;
    List<Timetable> timetableList;

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public List<Timetable> getTimetableList() {
        return timetableList;
    }

    public void setTimetableList(List<Timetable> timetableList) {
        this.timetableList = timetableList;
    }
}

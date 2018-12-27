package com.jaee.www.student.service;

import java.util.List;

import com.jaee.www.entity.Section;
import com.jaee.www.entity.custom.SectionCustom;

/**
 * Created by c0de8ug on 16-2-16.
 */
public interface ElectiveBiz {
    public void add(int secId, String stdId);

    public List<SectionCustom> findAllSection();

    public void delete(int secId, String stdId);
}

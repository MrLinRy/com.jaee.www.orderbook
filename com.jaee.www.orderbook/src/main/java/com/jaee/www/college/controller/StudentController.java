package com.jaee.www.college.controller;

import com.jaee.www.college.service.StudentBiz;
import com.jaee.www.entity.Student;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import java.io.IOException;


@Controller
@RequestMapping("student.do")
public class StudentController {

    @Resource(name = "studentBizImpl")
    StudentBiz studentBiz;

    @RequiresRoles("admin")
    @RequestMapping("student.view")
    public String studentView(Model m) {
        //TODO 将biz命名为和业务有关的函数方法,不知道是否正确留个吭
        m.addAttribute("studentList", studentBiz.studentView());
        System.out.println(studentBiz.studentView().get(0).getClassName());
        return "/admin/college/student";
    }

    @RequiresRoles("admin")
    @RequestMapping("student_add.view")
    public String studentAddView(Model m) {

        return "/admin/college/student_add";
    }

    @RequiresRoles("admin")
    @RequestMapping("student_update.view")
    public String studentUpdateView(Model m) {

        return "/admin/college/student_update";
    }

    @RequiresRoles("admin")
    @RequestMapping("add")
    public String add(Model m, MultipartFile pic, Student student) throws IOException {
        studentBiz.add(student, pic);
        return "redirect:/student.do/student.view";
    }
    
    @RequiresRoles("admin")
    @RequestMapping("update")
    public String update(Student student) throws IOException {
        studentBiz.update(student);
        return "redirect:/student.do/student.view";
    }

    @RequiresRoles("admin")
    @RequestMapping("delete")
    public String delete(Model m, String studentId) {
        studentBiz.delete(studentId);
        return "redirect:/student.do/student.view";
    }

}

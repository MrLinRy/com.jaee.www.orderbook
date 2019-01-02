package com.jaee.www.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("main.do")
public class MainController {

    @RequestMapping("admin")
    public String adminMainView() {
        return "/admin/main";
    }

    @RequestMapping("student")
    public String studentMainView() {
        return "/student/main";
    }

    @RequestMapping("teacher")
    public String teacherMainView() {
        return "/teacher/main";
    }
}

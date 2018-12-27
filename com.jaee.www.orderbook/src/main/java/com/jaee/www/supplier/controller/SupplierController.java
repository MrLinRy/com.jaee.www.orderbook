package com.jaee.www.supplier.controller;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jaee.www.supplier.service.SupplierBiz;

import java.io.IOException;

import javax.annotation.Resource;

/**
 * Created by c0de8ug on 16-2-16.
 */

@Controller

@RequestMapping("supplier.do")
public class SupplierController {

    @Resource(name = "supplierBizImpl")
    SupplierBiz supplierBiz;

    @RequiresRoles(value = {"admin", "supplier","student"}, logical = Logical.OR)
    @RequestMapping("supplier.view")
    public String supplierView(Model m) {
        m.addAttribute("reviewedBookList", supplierBiz.findAllReviewedBook());
        return "/supplier/supplier";
    }
    
    @RequiresRoles(value = {"admin", "supplier","student"}, logical = Logical.OR)
    @RequestMapping("office.view")
    public String office(Model m) {
    	try {
			OfficeController.createExcel(supplierBiz.findAllReviewedBook());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        m.addAttribute("reviewedBookList", supplierBiz.findAllReviewedBook());
        return "/supplier/supplier";
    }
}

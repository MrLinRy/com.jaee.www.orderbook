package com.jaee.www.college.controller;

import com.jaee.www.college.service.OrderBookBiz;
import com.jaee.www.entity.Section;
import com.jaee.www.entity.custom.ChangedItems;
import com.jaee.www.entity.custom.OrderBookReviewVo;
import com.jaee.www.entity.custom.OrderBookVo;
import com.jaee.www.util.TermContainer;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("orderbook.do")

public class OrderBookController {
    @Resource(name = "orderBookBizImpl")
    private OrderBookBiz orderBookBiz;

    @RequiresRoles(value = {"admin", "teacher","student"}, logical = Logical.OR)
    @RequestMapping("orderbook.view")
    public String orderBookView(Model m, HttpSession httpSession) {
        String staffId = (String) httpSession.getAttribute("username");

        List<Section> sectionList = orderBookBiz.findSelectedSection(staffId, TermContainer.now());
        int courseCount = sectionList.size();
        m.addAttribute("selectedSectionList", sectionList);
        m.addAttribute("courseCount", courseCount);
        return "/teacher/orderbook";
    }

    @RequiresRoles(value = {"admin", "teacher","student"}, logical = Logical.OR)
    @RequestMapping("orderbook_review.view")
    public String orderBookReviewView(Model m, HttpSession session) {
        //TODO 放到SESSION方便处理
        session.setAttribute("notReviewedBookList", orderBookBiz.findAllNotReviewedBook());
        return "/teacher/orderbook_review";
    }

    @RequiresRoles(value = {"admin", "teacher","student"}, logical = Logical.OR)
    @RequestMapping("orderbook_add.view")
    public String orderBookAddView(Model m, HttpSession session) {
    	String staffId = (String) session.getAttribute("username");
        m.addAttribute("selectedSectionList", orderBookBiz.findSelectedSection(staffId, TermContainer.now()));
        return "/teacher/orderbook_add";
    }

    @RequiresRoles(value = {"admin", "teacher","student"}, logical = Logical.OR)
    @RequestMapping("orderbook_added.view")
    public String orderBookAddedView(Model m, HttpSession session) {
        String staffId = (String) session.getAttribute("username");
        m.addAttribute("addedBookInfoList", orderBookBiz.findAddedBookInfoList(staffId));
        return "/teacher/orderbook_added";
    }

    @RequiresRoles(value = {"admin", "teacher","student"}, logical = Logical.OR)
    @RequestMapping("add")
    public String add(HttpServletRequest request, HttpSession session) {
        Map map = request.getParameterMap();
        OrderBookVo orderBookVo = new OrderBookVo();
        orderBookVo.setStaffId((String) session.getAttribute("username"));
        orderBookVo.setMap(map);
        orderBookBiz.add(orderBookVo);
        return "redirect:/orderbook.do/orderbook.view";
    }

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("update")
    @ResponseStatus(value = HttpStatus.OK)
    public void update(@RequestBody ChangedItems changedItems, HttpSession session) {
        orderBookBiz.update(changedItems, (String) session.getAttribute("username"));
    }

    @RequiresRoles(value = {"admin", "teacher","student"}, logical = Logical.OR)
    @RequestMapping("audit")
    public String audit(HttpSession session) {
        List<OrderBookReviewVo> orderBookReviewVoList = (List<OrderBookReviewVo>) session.getAttribute("notReviewedBookList");
        orderBookBiz.audit(orderBookReviewVoList);
        return "redirect:/orderbook.do/orderbook_review.view";
    }
    
    @RequiresRoles(value = {"admin", "teacher","student"}, logical = Logical.OR)
    @RequestMapping("office")
    public String office(HttpSession session) {
        List<OrderBookReviewVo> orderBookReviewVoList = (List<OrderBookReviewVo>) session.getAttribute("notReviewedBookList");
        orderBookBiz.audit(orderBookReviewVoList);
        try {
			OfficeController.createExcel(orderBookReviewVoList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "redirect:/orderbook.do/orderbook_review.view";
		
    }
}

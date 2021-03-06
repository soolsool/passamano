package com.example.demo.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DisplayProductDao;
import com.example.demo.dao.OrderDao;
import com.example.demo.dao.ProductDao;
import com.example.demo.db.DBManager;
import com.example.demo.vo.OrderCommand;
import com.example.demo.vo.OrderDeliveryVo;
import com.example.demo.vo.OrderPayVo;
import com.example.demo.vo.OrdersVo;
import com.example.demo.vo.ProductsVo;
import com.example.demo.vo.UserVo;

@Controller
@RequestMapping("/mypage/orderinsert.do")
public class OrdersController {

	@Autowired
	private OrderDao dao;
	
	
	public void setDao(OrderDao dao) {
		this.dao = dao;
	}	

	@RequestMapping(method=RequestMethod.GET)
	public void form(HttpServletRequest request, Model model) {

	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView inserOdrer(HttpSession session, OrderCommand oc ) {
		ModelAndView mav = new ModelAndView("redirect:/mypage/home.do");

		
		int re = dao.inserOrder(oc);
			
		if(re != 1) {
			mav.addObject("msg", "정상적으로 완료되지 못했습니다.");
		}else {
			System.out.println("주문완료");
		}
		
		return mav;
		
				
	}
}

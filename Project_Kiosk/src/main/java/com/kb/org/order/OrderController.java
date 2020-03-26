package com.kb.org.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kb.org.order.OrderDTO;

@Controller
public class OrderController {
	
	@Autowired
	SqlSession ss;
	

	// 주문하기
	@RequestMapping(value = "/insertOrder.do")
	public String insertProc(Model model, 
			String[] ordername,
			String[] ordercount,
			String[] orderprice,
			String[] ordertotal,
			String totalprice){
		
		for(int i = 0; i< ordername.length; i++) {
			OrderDTO od = new OrderDTO();
			od.setOrder_name(ordername[i]);
			od.setOrder_count(ordercount[i]);
			od.setOrder_price(orderprice[i]);
			od.setOrder_total(ordertotal[i]);
			od.setTotalprice(totalprice);
			
			ss.insert("order.insertOrder", od);
		}
		
		
		return "redirect:index.do";
	}
	
	// 주문목록
	@RequestMapping(value = "/order/orderList.do")
	public String orderlist(Model model){
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		list = ss.selectList("order.selectOrderList");
		model.addAttribute("orderList",list);
		return "order/orderList";
	}
}

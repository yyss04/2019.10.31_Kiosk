package com.kb.org.main;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kb.org.product.ProductDTO;

@Controller
public class MainController {
	
	@Autowired
	SqlSession ss;
	
	// 첫 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}	
	
	
	// 상품페이지 리스트 불러오기
	@RequestMapping(value = "/index.do")
	public String index(Model model, String select, String recommend) {
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		list = ss.selectList("product.spreadRecommend", recommend="o");
		model.addAttribute("RecommendList", list);
		
		list = ss.selectList("product.spreadProduct", select="B%");
		model.addAttribute("BurgerList", list);
		
		list = ss.selectList("product.spreadProduct", select="S%");
		model.addAttribute("SideList", list);
		
		list = ss.selectList("product.spreadProduct", select="D%");
		model.addAttribute("DrinkList", list);
		
		return "/index";
	}
}
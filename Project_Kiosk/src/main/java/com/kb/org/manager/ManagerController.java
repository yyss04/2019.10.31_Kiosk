package com.kb.org.manager;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	
	@Autowired
	SqlSession ss;

	// 로그인화면
	@RequestMapping(value = "/manager/loginForm.do")
	public String loginform(Model model, HttpServletRequest request){
			
			return "manager/loginForm";
	}
	
	// 로그인 session
	@RequestMapping(value="/manager/loginProc.do")
	public String loginProc(Model model, ManagerDTO mdto, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		
		String id = request.getParameter("id");
		
		Cookie cookie = new Cookie("cookieId", id);
		String checkValue = request.getParameter("idsave");
		
		if(checkValue != null) {
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		} else {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		ManagerDTO resultmdto = ss.selectOne("manager.selectLogin", mdto);
		if(resultmdto != null) {
			session.setAttribute("sessionId", resultmdto.getId());
			return "manager/managerMode";
		} else {	
			model.addAttribute("msg", "아이디나 비밀번호를 확인해주세요.");
			return "manager/loginForm";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/manager/logOut.do")
	public String logOut(Model model, HttpSession session, HttpServletResponse response){
		model.addAttribute("msg", "로그아웃되었습니다.");
		session.invalidate();
		return "main";
	}
	
	// 관리자페이지(세션있을때 관리자페이지, 세션없으면 로그인페이지출력)
	@RequestMapping(value="/manager/managerMode.do")
	public String managerMode(HttpSession session) {
		Object sessionId = session.getAttribute("sessionId");
		if(sessionId != null)
			return "manager/managerMode";
		else
			return "manager/loginForm";
	}
	
}
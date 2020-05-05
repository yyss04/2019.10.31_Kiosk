package com.kb.org.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	
	@Autowired
	SqlSession ss;
	
	// 추천메뉴 화면출력
	@RequestMapping(value = "/product/recommend.do")
	public String recommendProduct(Model model, String recommend) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		list = ss.selectList("product.spreadRecommend", recommend="o");
		model.addAttribute("RecommendList", list);
		list = ss.selectList("product.spreadRecommend", recommend="x");
		model.addAttribute("ProductList", list);
		
		return "product/recommend";
	}
	
	// 추천메뉴 DB저장
	@RequestMapping(value = "/product/success.do")
	public String success(HttpServletRequest request) {
		
		// oracle은 배열로 받아올때 hashmap과 foreach문사용
		String[] seqs = request.getParameterValues("seq");
		
		Map<String, String[]> hm = new HashMap<String, String[]>();
		
		hm.put("recommendSeq", seqs);
		
		if(seqs == null) {
			ss.update("product.recommend_submit");
		}else {
			ss.update("product.recommend_update", hm);
			ss.delete("product.recommend_delete", hm);
		}
		return "redirect:recommend.do";
	}
	
	// 상품 등록/삭제 화면
	@RequestMapping(value = "/product/productManager.do")
	public String productManager(Model model){
	
		List<ProductDTO> list = ss.selectList("product.selectAll");
		model.addAttribute("ManagerList", list);
		return "product/productManager";
	
	}
	
	// 상품 등록 페이지이동
	@RequestMapping(value = "/product/productAdd.do")
	public String insert(Model model){
		return "product/productAdd";
		
	}
	
	// 상품 등록 DB저장
	@RequestMapping(value = "/product/productAddProc.do")
	public String insertProc(ProductDTO pdto, 
						HttpServletRequest request,
						HttpServletResponse response){
		
		ProductAddCmd padd = new ProductAddCmd();
		pdto = padd.excute(request, response); 
		ss.insert("product.insertrow", pdto);
		return "redirect:productManager.do";
	}
	
	// 상품 삭제 DB저장
	@RequestMapping(value = "/product/productDel.do")
	public String delete(HttpServletRequest request){
		String[] seq = request.getParameterValues("seq");
		Map<String, String[]> hm = new HashMap<String, String[]>();
		
		hm.put("deleteSeq", seq);
		ss.delete("product.deleterows", hm);
		return "redirect:productManager.do";
	}
	
	// 상품 수정 페이지화면
	@RequestMapping(value = "/product/productUpdate.do")
	public String update(Model model, String seq){
		ProductDTO returnpd = ss.selectOne("product.selectrow", seq);
		System.out.println("returnpd : "+returnpd);
		model.addAttribute("row", returnpd);
		return "product/productUpdate";
	}
	
	// 상품 수정 DB저장
	@RequestMapping(value = "/product/productUpdateProc.do")
	public String updateProc(ProductDTO pd, String imagelink){
		imagelink = "menu/" + imagelink;
		pd.setImagelink(imagelink);
		ss.update("product.updaterow", pd);
		return "redirect:productManager.do";
	}
}



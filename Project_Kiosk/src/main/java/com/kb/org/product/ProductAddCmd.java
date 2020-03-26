package com.kb.org.product;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class ProductAddCmd {
	
	private ProductDTO pd;
	
	public ProductAddCmd(ProductDTO pd) {
		this.pd = pd;
	}

	public void excute(HttpServletRequest request, HttpServletResponse response) {
//		String PK = "";
//		String name = "";
//		String price = "";
//		String pcomment = "";
//		String imagelink = "";
//		String imagefile = "";

//		String savefolder = "D:\\springsource1\\kiosk1\\src\\main\\webapp\\WEB-INF\\views\\menu";

		System.out.println("폴더 만들기 전");
		String savefolder = request.getSession().getServletContext().getRealPath("\\menu");
		
		File folder = new File(savefolder);
		folder.mkdir();
		System.out.println("폴더 만든 후");
		
		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy frp = new DefaultFileRenamePolicy();

		MultipartRequest mr;
		System.out.println("일로 오나");
		try {
			mr = new MultipartRequest(request, savefolder, maxPostSize, encoding, frp);
			
			System.out.println("파일 저장 완료");
			String imagefile = mr.getFilesystemName("imagelink");
			System.out.println("imagefile = "+ imagefile);
//			PK = mr.getParameter("PK");
//			name = mr.getParameter("name");
//			price = mr.getParameter("price");
//			pcomment = mr.getParameter("pcomment");
//			imagelink = "menu/" + (String) imagefile;
//			System.out.println("pk =" + mr.getParameter("PK"));
		} catch (IOException e) {
			e.printStackTrace();
		}

//		ProductDTO list = new ProductDTO(PK, name, price, pcomment, imagelink);

//		return list;
	}
}

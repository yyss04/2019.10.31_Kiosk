package com.kb.org.product;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class ProductAddCmd {
	public ProductDTO excute(HttpServletRequest request, HttpServletResponse response) {
		String PK="";
		String name=""; 
		String price=""; 
		String pcomment=""; 
		String imagelink="";
		String imagefile="";
			
		String savefolder = "E:\\spring_source\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project_Kiosk\\resources\\menu"; 
		File folder = new File(savefolder);
		folder.mkdir();
		int maxPostSize = 10 * 1024 * 1024 ;
		String encoding = "utf-8";
		FileRenamePolicy frp = new DefaultFileRenamePolicy();
		
		MultipartRequest mr;
		try {
			mr = new MultipartRequest(request, savefolder, maxPostSize , encoding, frp);
			imagefile = mr.getFilesystemName("imagelink");
			PK = mr.getParameter("PK");
			name = mr.getParameter("name");
			price = mr.getParameter("price");
			pcomment = mr.getParameter("pcomment");
			imagelink = "menu/" + (String)imagefile; 
		} catch (IOException e) {
			e.printStackTrace();
		}
		ProductDTO list = new ProductDTO(PK, name, price, pcomment, imagelink);
		return list;
	}
}

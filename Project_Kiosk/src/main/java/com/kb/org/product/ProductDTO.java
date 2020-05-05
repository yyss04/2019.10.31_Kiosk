package com.kb.org.product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data	
@RequiredArgsConstructor 
@AllArgsConstructor	
public class ProductDTO {
	
	private String PK;
	private String name;
	private String price;
	private String pcomment;
	private String imagelink;
	
	
	
	
}

package com.kb.org.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class OrderDTO {
	private String seq;
	private String order_name; /*상품명*/
	private String order_count; /*주문수량*/
	private String order_price; /*상품단가*/
	private String order_total; /*수량*단가*/
	private String totalprice; /*주문총가격*/
	private String order_date; /*주문일자*/
}

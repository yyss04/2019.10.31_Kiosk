package com.kb.org.manager;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data	// toString getter setter 생성
@RequiredArgsConstructor // 필수 인자 생성
@AllArgsConstructor	// 모든 필드를 인자로 받는 생성자
public class ManagerDTO {
	
	private String id;
	private String pw;
	private String commentA;
	
	
	
}

package com.everydang.everything.controller;

import java.util.List;

import com.everydang.everything.service.EverythingService;
import com.everydang.everything.service.IEverythingService;
import com.everydang.vo.CartVO;

public class test {
	public static void main(String[] args) {
		EverythingService service = EverythingService.getInstance();
		List<CartVO> list = service.selectAll();
		for (CartVO vo : list) {
			System.out.print(vo.toString());
		}
		
	}

}
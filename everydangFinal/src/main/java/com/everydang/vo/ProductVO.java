package com.everydang.vo;

public class ProductVO {
	private String pr_code;
	private String pr_name;
	private int pr_price;

	
	public ProductVO() {
		
	}
	
	public ProductVO(String pr_code, String pr_name, int pr_price, String pr_file) {
		super();
		this.pr_code = pr_code;
		this.pr_name = pr_name;
		this.pr_price = pr_price;
	}

	public String getPr_code() {
		return pr_code;
	}

	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getPr_price() {
		return pr_price;
	}

	public void setPr_price(int pr_price) {
		this.pr_price = pr_price;
	}


}

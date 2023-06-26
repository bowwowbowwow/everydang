package com.everydang.vo;

public class CartVO {
	private int cr_no;
	private String pr_code;
	private String mm_id;
	private int cr_count;
	private String cr_selop;
	
	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public String getCr_selop() {
		return cr_selop;
	}

	public void setCr_selop(String cr_selop) {
		this.cr_selop = cr_selop;
	}

	public String getPr_code() {
		return pr_code;
	}

	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}

	public String getMm_id() {
		return mm_id;
	}

	public void setMm_id(String mm_id) {
		this.mm_id = mm_id;
	}

	public int getCr_count() {
		return cr_count;
	}

	public void setCr_count(int cr_count) {
		this.cr_count = cr_count;
	}

	@Override
	public String toString() {
		return "CartVO [cr_no=" + cr_no + ", pr_code=" + pr_code + ", mm_id=" + mm_id + ", cr_count=" + cr_count
				+ ", cr_selop=" + cr_selop + "]";
	}

}

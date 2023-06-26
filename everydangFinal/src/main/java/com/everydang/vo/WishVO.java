package com.everydang.vo;

public class WishVO {
	private String mm_id   ;
	private String pr_code ;
	private int ws_like ;
	
	public WishVO(String memId, String prCode, int i) {
		// TODO Auto-generated constructor stub
	}
	public WishVO() {
		// TODO Auto-generated constructor stub
	}
	public String getMm_id() {
		return mm_id;
	}
	public void setMm_id(String mm_id) {
		this.mm_id = mm_id;
	}
	public String getPr_code() {
		return pr_code;
	}
	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}
	public int getWs_like() {
		return ws_like;
	}
	public void setWs_like(int ws_like) {
		this.ws_like = ws_like;
	}
	@Override
	public String toString() {
		return "WishVO [mm_id=" + mm_id + ", pr_code=" + pr_code + ", ws_like=" + ws_like + "]";
	}	
	
	
}

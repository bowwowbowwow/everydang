package com.everydang.vo;

public class AdminVO {
	//MEMBER
	private String mm_id;
	private String mm_password;
	private String mm_nickname;
	private String mm_name;
	private String mm_mail;
	private String mm_tel;
	private String mm_zip;
	private String mm_addr1;
	private String mm_addr2;
	private String gr_no;
	private String mm_join_date;
	//REPORT
	private String rp_reporter;
	private String rp_defendent;
	private String rp_reason1;
	private String rp_reason2;
	private int rp_blacklist;
	private String rp_date;
	private String rp_file;	
	private String rp_no;
	//BOARD
	private String br_code;
	private String br_name;
	//POST
	private String ps_no;
	private String ps_subject;
	private String ps_content;
	private String ps_file;
	private String ps_date;
	//COMMENT
	private String cm_no;
	private String cm_content;
	private String cm_date;
	//LIKE
	private int lk_like;
	//GRADE
	private String gr_name;
	//COUNT
	private int comment_count;
	private int like_count;
	private int post_count;
	//PRODUCT
	private String pr_code;
	private String pr_name;
	private int pr_price;
	//OPTION
	private String op_name;
	private String op_file;
	//REVIEW
	private String rv_no;
	private String rv_content;
	private int rv_star;
	private String rv_date;
	private String py_no;
	
	
	// MemberVO Getter Setter
	public String getMm_id() {
		return mm_id;
	}
	public void setMm_id(String mm_id) {
		this.mm_id = mm_id;
	}
	public String getMm_password() {
		return mm_password;
	}
	public void setMm_password(String mm_password) {
		this.mm_password = mm_password;
	}
	public String getMm_nickname() {
		return mm_nickname;
	}
	public void setMm_nickname(String mm_nickname) {
		this.mm_nickname = mm_nickname;
	}
	public String getMm_name() {
		return mm_name;
	}
	public void setMm_name(String mm_name) {
		this.mm_name = mm_name;
	}
	public String getMm_mail() {
		return mm_mail;
	}
	public void setMm_mail(String mm_mail) {
		this.mm_mail = mm_mail;
	}
	public String getMm_tel() {
		return mm_tel;
	}
	public void setMm_tel(String mm_tel) {
		this.mm_tel = mm_tel;
	}
	public String getMm_zip() {
		return mm_zip;
	}
	public void setMm_zip(String mm_zip) {
		this.mm_zip = mm_zip;
	}
	public String getMm_addr1() {
		return mm_addr1;
	}
	public void setMm_addr1(String mm_addr1) {
		this.mm_addr1 = mm_addr1;
	}
	public String getMm_addr2() {
		return mm_addr2;
	}
	public void setMm_addr2(String mm_addr2) {
		this.mm_addr2 = mm_addr2;
	}
	public String getGr_no() {
		return gr_no;
	}
	public void setGr_no(String gr_no) {
		this.gr_no = gr_no;
	}
	public String getMm_join_date() {
		return mm_join_date;
	}
	public void setMm_join_date(String mm_join_date) {
		this.mm_join_date = mm_join_date;
	}
	
	// ReportVO Getter Setter
	public String getRp_reporter() {
		return rp_reporter;
	}

	public void setRp_reporter(String rp_reporter) {
		this.rp_reporter = rp_reporter;
	}

	public String getRp_defendent() {
		return rp_defendent;
	}

	public void setRp_defendent(String rp_defendent) {
		this.rp_defendent = rp_defendent;
	}

	public String getRp_reason1() {
		return rp_reason1;
	}

	public void setRp_reason1(String rp_reason1) {
		this.rp_reason1 = rp_reason1;
	}

	public String getRp_reason2() {
		return rp_reason2;
	}

	public void setRp_reason2(String rp_reason2) {
		this.rp_reason2 = rp_reason2;
	}

	public int getRp_blacklist() {
		return rp_blacklist;
	}

	public void setRp_blacklist(int rp_blacklist) {
		this.rp_blacklist = rp_blacklist;
	}

	public String getRp_date() {
		return rp_date;
	}

	public void setRp_date(String rp_date) {
		this.rp_date = rp_date;
	}

	public String getRp_file() {
		return rp_file;
	}

	public void setRp_file(String rp_file) {
		this.rp_file = rp_file;
	}
	
	public String getRp_no() {
		return rp_no;
	}
	public void setRp_no(String rp_no) {
		this.rp_no = rp_no;
	}
	
	
	//Board Getter Setter
	public String getBr_code() {
		return br_code;
	}
	public void setBr_code(String br_code) {
		this.br_code = br_code;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}
	public String getPs_no() {
		return ps_no;
	}
	public void setPs_no(String ps_no) {
		this.ps_no = ps_no;
	}
	public String getPs_subject() {
		return ps_subject;
	}
	public void setPs_subject(String ps_subject) {
		this.ps_subject = ps_subject;
	}
	public String getPs_content() {
		return ps_content;
	}
	public void setPs_content(String ps_content) {
		this.ps_content = ps_content;
	}
	public String getPs_file() {
		return ps_file;
	}
	public void setPs_file(String ps_file) {
		this.ps_file = ps_file;
	}
	public String getPs_date() {
		return ps_date;
	}
	public void setPs_date(String ps_date) {
		this.ps_date = ps_date;
	}
	
	//Comment Getter Setter
	public String getCm_no() {
		return cm_no;
	}
	public void setCm_no(String cm_no) {
		this.cm_no = cm_no;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}
	
	//Like Getter Setter
	public int getLk_like() {
		return lk_like;
	}
	public void setLk_like(int lk_like) {
		this.lk_like = lk_like;
	}
	
	//Grade Getter Setter
	public String getGr_name() {
		return gr_name;
	}
	public void setGr_name(String gr_name) {
		this.gr_name = gr_name;
	}
	
	//ETC Getter Setter
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getPost_count() {
		return post_count;
	}
	public void setPost_count(int post_count) {
		this.post_count = post_count;
	}
	
	// Product Getter Setter
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
	public String getOp_name() {
		return op_name;
	}
	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}
	public String getOp_file() {
		return op_file;
	}
	public void setOp_file(String op_file) {
		this.op_file = op_file;
	}
	
	// Review Getter Setter
	public String getRv_no() {
		return rv_no;
	}
	public void setRv_no(String rv_no) {
		this.rv_no = rv_no;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public int getRv_star() {
		return rv_star;
	}
	public void setRv_star(int rv_star) {
		this.rv_star = rv_star;
	}
	public String getRv_date() {
		return rv_date;
	}
	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}
	public String getPy_no() {
		return py_no;
	}
	public void setPy_no(String py_no) {
		this.py_no = py_no;
	}
	
	
}

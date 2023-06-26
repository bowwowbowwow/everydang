package com.everydang.vo;

public class PostVO {
	private int ps_no;
	private String br_code;
	private String mm_id;
	private String ps_subject;
	private String ps_content;
	private String ps_file;
	private String ps_date;
	private String mm_nickname;
	private String mm_profile;
	private int gr_no;
	private int ps_hit;
	private int lk_like;
	private int cm_no;
	private int sc_scrap;
	private String tg_tag;
	private int ps_noti;
	private String ps_thumbnail;
	private String ps_sido;
	private String ps_gugun;
	private String ps_tag;

	public String getMm_profile() {
		return mm_profile;
	}

	public void setMm_profile(String mm_profile) {
		this.mm_profile = mm_profile;
	}

	public int getGr_no() {
		return gr_no;
	}

	public void setGr_no(int gr_no) {
		this.gr_no = gr_no;
	}

	public String getPs_tag() {
		return ps_tag;
	}

	public void setPs_tag(String ps_tag) {
		this.ps_tag = ps_tag;
	}

	public int getPs_no() {
		return ps_no;
	}

	public void setPs_no(int ps_no) {
		this.ps_no = ps_no;
	}

	public String getBr_code() {
		return br_code;
	}

	public void setBr_code(String br_code) {
		this.br_code = br_code;
	}

	public String getMm_id() {
		return mm_id;
	}

	public void setMm_id(String mm_id) {
		this.mm_id = mm_id;
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

	public String getMm_nickname() {
		return mm_nickname;
	}

	public void setMm_nickname(String mm_nickname) {
		this.mm_nickname = mm_nickname;
	}

	public int getPs_hit() {
		return ps_hit;
	}

	public void setPs_hit(int ps_hit) {
		this.ps_hit = ps_hit;
	}

	public int getLk_like() {
		return lk_like;
	}

	public void setLk_like(int lk_like) {
		this.lk_like = lk_like;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public int getSc_scrap() {
		return sc_scrap;
	}

	public void setSc_scrap(int sc_scrap) {
		this.sc_scrap = sc_scrap;
	}

	public String getTg_tag() {
		return tg_tag;
	}

	public void setTg_tag(String tg_tag) {
		this.tg_tag = tg_tag;
	}

	public int getPs_noti() {
		return ps_noti;
	}

	public void setPs_noti(int ps_noti) {
		this.ps_noti = ps_noti;
	}

	public String getPs_thumbnail() {
		return ps_thumbnail;
	}

	public void setPs_thumbnail(String ps_thumbnail) {
		this.ps_thumbnail = ps_thumbnail;
	}

	public String getPs_sido() {
		return ps_sido;
	}

	public void setPs_sido(String ps_sido) {
		this.ps_sido = ps_sido;
	}

	public String getPs_gugun() {
		return ps_gugun;
	}

	public void setPs_gugun(String ps_gugun) {
		this.ps_gugun = ps_gugun;
	}

	@Override
	public String toString() {
		return "PostVO [ps_no=" + ps_no + ", br_code=" + br_code + ", mm_id=" + mm_id + ", ps_subject=" + ps_subject
				+ ", ps_content=" + ps_content + ", ps_file=" + ps_file + ", ps_date=" + ps_date + ", mm_nickname="
				+ mm_nickname + ", ps_hit=" + ps_hit + ", lk_like=" + lk_like + ", cm_no=" + cm_no + ", sc_scrap="
				+ sc_scrap + ", tg_tag=" + tg_tag + ", ps_noti=" + ps_noti + ", ps_thumbnail=" + ps_thumbnail
				+ ", ps_sido=" + ps_sido + ", ps_gugun=" + ps_gugun + "]";
	}

}

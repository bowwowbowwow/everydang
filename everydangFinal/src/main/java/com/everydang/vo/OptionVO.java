package com.everydang.vo;

public class OptionVO {
	private String pr_code;
	private String op_name;
	private String op_file;
	
	public OptionVO() {
		// TODO Auto-generated constructor stub
	}
	
	public OptionVO(String pr_code, String op_name, String op_file) {
		super();
		this.pr_code = pr_code;
		this.op_name = op_name;
		this.op_file = op_file;
	}

	public String getOp_file() {
		return op_file;
	}

	public void setOp_file(String op_file) {
		this.op_file = op_file;
	}

	public String getPr_code() {
		return pr_code;
	}

	public void setPr_code(String pr_code) {
		this.pr_code = pr_code;
	}

	public String getOp_name() {
		return op_name;
	}

	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}

	@Override
	public String toString() {
		return "OptionVO [pr_code=" + pr_code + ", op_name=" + op_name + ", op_file=" + op_file + "]";
	}
	
}

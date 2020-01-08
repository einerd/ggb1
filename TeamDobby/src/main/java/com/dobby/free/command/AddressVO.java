package com.dobby.free.command;

public class AddressVO {

	private int post_order_no;
	private int uno;
	private String post_name;
	private String post_phone_1;
	private String post_phone_2;
	private String post_mobile_1;
	private String post_mobile_2;
	private String post_address_1;
	private String post_address_2;
	private String post_post_no;
	public int getPost_order_no() {
		return post_order_no;
	}
	public void setPost_order_no(int post_order_no) {
		this.post_order_no = post_order_no;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getPost_name() {
		return post_name;
	}
	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}
	public String getPost_phone_1() {
		return post_phone_1;
	}
	public void setPost_phone_1(String post_phone_1) {
		this.post_phone_1 = post_phone_1;
	}
	public String getPost_phone_2() {
		return post_phone_2;
	}
	public void setPost_phone_2(String post_phone_2) {
		this.post_phone_2 = post_phone_2;
	}
	public String getPost_mobile_1() {
		return post_mobile_1;
	}
	public void setPost_mobile_1(String post_mobile_1) {
		this.post_mobile_1 = post_mobile_1;
	}
	public String getPost_mobile_2() {
		return post_mobile_2;
	}
	public void setPost_mobile_2(String post_mobile_2) {
		this.post_mobile_2 = post_mobile_2;
	}
	public String getPost_address_1() {
		return post_address_1;
	}
	public void setPost_address_1(String post_address_1) {
		this.post_address_1 = post_address_1;
	}
	public String getPost_address_2() {
		return post_address_2;
	}
	public void setPost_address_2(String post_address_2) {
		this.post_address_2 = post_address_2;
	}
	public String getPost_post_no() {
		return post_post_no;
	}
	public void setPost_post_no(String post_post_no) {
		this.post_post_no = post_post_no;
	}
	@Override
	public String toString() {
		return "AddressVO [post_order_no=" + post_order_no + ", uno=" + uno + ", post_name=" + post_name
				+ ", post_phone_1=" + post_phone_1 + ", post_phone_2=" + post_phone_2 + ", post_mobile_1="
				+ post_mobile_1 + ", post_mobile_2=" + post_mobile_2 + ", post_address_1=" + post_address_1
				+ ", post_address_2=" + post_address_2 + ", post_post_no=" + post_post_no + "]";
	}
	public AddressVO(int post_order_no, int uno, String post_name, String post_phone_1, String post_phone_2,
			String post_mobile_1, String post_mobile_2, String post_address_1, String post_address_2,
			String post_post_no) {
		super();
		this.post_order_no = post_order_no;
		this.uno = uno;
		this.post_name = post_name;
		this.post_phone_1 = post_phone_1;
		this.post_phone_2 = post_phone_2;
		this.post_mobile_1 = post_mobile_1;
		this.post_mobile_2 = post_mobile_2;
		this.post_address_1 = post_address_1;
		this.post_address_2 = post_address_2;
		this.post_post_no = post_post_no;
	}
	
	public AddressVO() {}
}

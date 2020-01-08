package com.dobby.free.command;

import java.sql.Timestamp;

public class ProductDetailVO {

	private int pno;
	private String p_name;
	private String p_item;
	private String p_price;
	private int p_quantity;
	private int p_b_quantity;
	private String p_detail;
	private String p_manufac;
	private String p_img_names;
	private String p_img_exts;
	private String p_uploadpath;
	private String p_fileloca;
	private String p_option_1;
	private String p_option_2;
	private Timestamp p_regdate;
	
	private int sno;
	private String seller_id;
	private String seller_name;
	private String seller_nick;
	private String s_phone_1;
	private String s_phone_2;
	private String s_address_1;
	private String s_address_2;
	private String s_post_no;
	private String s_email_1;
	private String s_email_2;
	private String business_no;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_item() {
		return p_item;
	}
	public void setP_item(String p_item) {
		this.p_item = p_item;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public int getP_quantity() {
		return p_quantity;
	}
	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}
	public int getP_b_quantity() {
		return p_b_quantity;
	}
	public void setP_b_quantity(int p_b_quantity) {
		this.p_b_quantity = p_b_quantity;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public String getP_manufac() {
		return p_manufac;
	}
	public void setP_manufac(String p_manufac) {
		this.p_manufac = p_manufac;
	}
	public String getP_img_names() {
		return p_img_names;
	}
	public void setP_img_names(String p_img_names) {
		this.p_img_names = p_img_names;
	}
	public String getP_img_exts() {
		return p_img_exts;
	}
	public void setP_img_exts(String p_img_exts) {
		this.p_img_exts = p_img_exts;
	}
	public String getP_uploadpath() {
		return p_uploadpath;
	}
	public void setP_uploadpath(String p_uploadpath) {
		this.p_uploadpath = p_uploadpath;
	}
	public String getP_fileloca() {
		return p_fileloca;
	}
	public void setP_fileloca(String p_fileloca) {
		this.p_fileloca = p_fileloca;
	}
	public String getP_option_1() {
		return p_option_1;
	}
	public void setP_option_1(String p_option_1) {
		this.p_option_1 = p_option_1;
	}
	public String getP_option_2() {
		return p_option_2;
	}
	public void setP_option_2(String p_option_2) {
		this.p_option_2 = p_option_2;
	}
	public Timestamp getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Timestamp p_regdate) {
		this.p_regdate = p_regdate;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getSeller_nick() {
		return seller_nick;
	}
	public void setSeller_nick(String seller_nick) {
		this.seller_nick = seller_nick;
	}
	public String getS_phone_1() {
		return s_phone_1;
	}
	public void setS_phone_1(String s_phone_1) {
		this.s_phone_1 = s_phone_1;
	}
	public String getS_phone_2() {
		return s_phone_2;
	}
	public void setS_phone_2(String s_phone_2) {
		this.s_phone_2 = s_phone_2;
	}
	public String getS_address_1() {
		return s_address_1;
	}
	public void setS_address_1(String s_address_1) {
		this.s_address_1 = s_address_1;
	}
	public String getS_address_2() {
		return s_address_2;
	}
	public void setS_address_2(String s_address_2) {
		this.s_address_2 = s_address_2;
	}
	public String getS_post_no() {
		return s_post_no;
	}
	public void setS_post_no(String s_post_no) {
		this.s_post_no = s_post_no;
	}
	public String getS_email_1() {
		return s_email_1;
	}
	public void setS_email_1(String s_email_1) {
		this.s_email_1 = s_email_1;
	}
	public String getS_email_2() {
		return s_email_2;
	}
	public void setS_email_2(String s_email_2) {
		this.s_email_2 = s_email_2;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public ProductDetailVO(int pno, String p_name, String p_item, String p_price, int p_quantity, int p_b_quantity,
			String p_detail, String p_manufac, String p_img_names, String p_img_exts, String p_uploadpath,
			String p_fileloca, String p_option_1, String p_option_2, Timestamp p_regdate, int sno, String seller_id,
			String seller_name, String seller_nick, String s_phone_1, String s_phone_2, String s_address_1,
			String s_address_2, String s_post_no, String s_email_1, String s_email_2, String business_no) {
		super();
		this.pno = pno;
		this.p_name = p_name;
		this.p_item = p_item;
		this.p_price = p_price;
		this.p_quantity = p_quantity;
		this.p_b_quantity = p_b_quantity;
		this.p_detail = p_detail;
		this.p_manufac = p_manufac;
		this.p_img_names = p_img_names;
		this.p_img_exts = p_img_exts;
		this.p_uploadpath = p_uploadpath;
		this.p_fileloca = p_fileloca;
		this.p_option_1 = p_option_1;
		this.p_option_2 = p_option_2;
		this.p_regdate = p_regdate;
		this.sno = sno;
		this.seller_id = seller_id;
		this.seller_name = seller_name;
		this.seller_nick = seller_nick;
		this.s_phone_1 = s_phone_1;
		this.s_phone_2 = s_phone_2;
		this.s_address_1 = s_address_1;
		this.s_address_2 = s_address_2;
		this.s_post_no = s_post_no;
		this.s_email_1 = s_email_1;
		this.s_email_2 = s_email_2;
		this.business_no = business_no;
	}
	
	public ProductDetailVO() {}
	@Override
	public String toString() {
		return "ProductDetailVO [pno=" + pno + ", p_name=" + p_name + ", p_item=" + p_item + ", p_price=" + p_price
				+ ", p_quantity=" + p_quantity + ", p_b_quantity=" + p_b_quantity + ", p_detail=" + p_detail
				+ ", p_manufac=" + p_manufac + ", p_img_names=" + p_img_names + ", p_img_exts=" + p_img_exts
				+ ", p_uploadpath=" + p_uploadpath + ", p_fileloca=" + p_fileloca + ", p_option_1=" + p_option_1
				+ ", p_option_2=" + p_option_2 + ", p_regdate=" + p_regdate + ", sno=" + sno + ", seller_id="
				+ seller_id + ", seller_name=" + seller_name + ", seller_nick=" + seller_nick + ", s_phone_1="
				+ s_phone_1 + ", s_phone_2=" + s_phone_2 + ", s_address_1=" + s_address_1 + ", s_address_2="
				+ s_address_2 + ", s_post_no=" + s_post_no + ", s_email_1=" + s_email_1 + ", s_email_2=" + s_email_2
				+ ", business_no=" + business_no + "]";
	}
	
	
	
	
	
	
}

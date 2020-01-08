package com.dobby.free.command;

public class BasketVO {

	private int basket_list;
	private int uno;
	private int pno;
	private String p_price;
	private String p_name;
	private String p_option_1;
	private String p_option_2;
	private int quantity;
	private int p_b_quantity;
	public int getBasket_list() {
		return basket_list;
	}
	public void setBasket_list(int basket_list) {
		this.basket_list = basket_list;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getP_b_quantity() {
		return p_b_quantity;
	}
	public void setP_b_quantity(int p_b_quantity) {
		this.p_b_quantity = p_b_quantity;
	}
	public BasketVO(int basket_list, int uno, int pno, String p_price, String p_name, String p_option_1,
			String p_option_2, int quantity, int p_b_quantity) {
		super();
		this.basket_list = basket_list;
		this.uno = uno;
		this.pno = pno;
		this.p_price = p_price;
		this.p_name = p_name;
		this.p_option_1 = p_option_1;
		this.p_option_2 = p_option_2;
		this.quantity = quantity;
		this.p_b_quantity = p_b_quantity;
	}
	
	public BasketVO() {}
	@Override
	public String toString() {
		return "BasketVO [basket_list=" + basket_list + ", uno=" + uno + ", pno=" + pno + ", p_price=" + p_price
				+ ", p_name=" + p_name + ", p_option_1=" + p_option_1 + ", p_option_2=" + p_option_2 + ", quantity="
				+ quantity + ", p_b_quantity=" + p_b_quantity + "]";
	}
	
	
}

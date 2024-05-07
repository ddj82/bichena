package com.drink.ko.vo;

public class CartVO {
	
	private int p_no; // 상품번호
	private String p_name; //  상품이름
	private int c_stock; // 주문수량(개수)
	private String u_id; //회원번호
	private int c_total; // 장바구니 총 가격
	private String p_img; // 상품테이블의 이미지
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getC_stock() {
		return c_stock;
	}
	public void setC_stock(int c_stock) {
		this.c_stock = c_stock;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getC_total() {
		return c_total;
	}
	public void setC_total(int c_total) {
		this.c_total = c_total;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	@Override
	public String toString() {
		return "CartVO [p_no=" + p_no + ", p_name=" + p_name + ", c_stock=" + c_stock + ", u_id=" + u_id + ", c_total="
				+ c_total + ", p_img=" + p_img + "]";
	}
	

	
}
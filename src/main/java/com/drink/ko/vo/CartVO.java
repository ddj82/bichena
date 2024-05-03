package com.drink.ko.vo;

public class CartVO {
	private int p_no;
	private String p_name;
	private int c_stock;
	private String u_id;
	private int c_total;
	
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
	
	@Override
	public String toString() {
		return "CartVO [p_no=" + p_no + ", p_name=" + p_name + ", c_stock=" + c_stock + ", u_id=" + u_id + ", c_total="
				+ c_total + "]";
	}
	
}

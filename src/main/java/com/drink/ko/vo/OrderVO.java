package com.drink.ko.vo;

public class OrderVO {
	private String o_no;
	private int u_no;
	private String u_name;
	private int p_no;
	private String p_name;
	private int o_stock;
	private int o_total;
	private String o_addr;
	private String u_tel;
	private String o_date;
	private String o_state;
	private String o_revstate;
	
	private String p_desc;
	private String p_price;
	private String p_img;
	
	
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getO_stock() {
		return o_stock;
	}
	public void setO_stock(int o_stock) {
		this.o_stock = o_stock;
	}
	public int getO_total() {
		return o_total;
	}
	public void setO_total(int o_total) {
		this.o_total = o_total;
	}
	public String getO_addr() {
		return o_addr;
	}
	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_desc() {
		return p_desc;
	}
	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}
	
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getO_revstate() {
		return o_revstate;
	}
	public void setO_revstate(String o_revstate) {
		this.o_revstate = o_revstate;
	}
	
	@Override
	public String toString() {
		return "OrderVO [o_no=" + o_no + ", u_no=" + u_no + ", u_name=" + u_name + ", p_no=" + p_no + ", o_stock="
				+ o_stock + ", o_total=" + o_total + ", o_addr=" + o_addr + ", o_date=" + o_date + ", o_state="
				+ o_state + "]";
	}
	
}

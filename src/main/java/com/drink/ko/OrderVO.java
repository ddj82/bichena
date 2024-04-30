package com.drink.ko;

import java.util.Date;

public class OrderVO {
	private String o_no;
	private int u_no;
	private String u_name;
	private int p_no;
	private int o_stock;
	private int o_total;
	private String o_addr;
	private Date o_date;
	private String o_state;
	
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
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	
	@Override
	public String toString() {
		return "OrderVO [o_no=" + o_no + ", u_no=" + u_no + ", u_name=" + u_name + ", p_no=" + p_no + ", o_stock="
				+ o_stock + ", o_total=" + o_total + ", o_addr=" + o_addr + ", o_date=" + o_date + ", o_state="
				+ o_state + "]";
	}
	
}

package com.drink.ko;

public class ProdVO {
	private int p_no;
	private String p_name;
	private String p_desc;
	private int p_price;
	private String p_made;
	private String p_type;
	private int p_dgr;
	private String p_sw;
	private String p_su;
	private String p_sp;
	private String p_mat;
	private String p_cap;
	private int p_stock;
	private String p_img;
	
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
	public String getP_desc() {
		return p_desc;
	}
	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_made() {
		return p_made;
	}
	public void setP_made(String p_made) {
		this.p_made = p_made;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public int getP_dgr() {
		return p_dgr;
	}
	public void setP_dgr(int p_dgr) {
		this.p_dgr = p_dgr;
	}
	public String getP_sw() {
		return p_sw;
	}
	public void setP_sw(String p_sw) {
		this.p_sw = p_sw;
	}
	public String getP_su() {
		return p_su;
	}
	public void setP_su(String p_su) {
		this.p_su = p_su;
	}
	public String getP_sp() {
		return p_sp;
	}
	public void setP_sp(String p_sp) {
		this.p_sp = p_sp;
	}
	public String getP_mat() {
		return p_mat;
	}
	public void setP_mat(String p_mat) {
		this.p_mat = p_mat;
	}
	public String getP_cap() {
		return p_cap;
	}
	public void setP_cap(String p_cap) {
		this.p_cap = p_cap;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	
	@Override
	public String toString() {
		return "ProdVO [p_no=" + p_no + ", p_name=" + p_name + ", p_desc=" + p_desc + ", p_price=" + p_price
				+ ", p_made=" + p_made + ", p_type=" + p_type + ", p_dgr=" + p_dgr + ", p_sw=" + p_sw + ", p_su=" + p_su
				+ ", p_sp=" + p_sp + ", p_mat=" + p_mat + ", p_cap=" + p_cap + ", p_stock=" + p_stock + ", p_img="
				+ p_img + "]";
	}
		
}

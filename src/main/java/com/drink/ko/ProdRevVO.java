package com.drink.ko;

import java.util.*;

public class ProdRevVO {
	private int pr_no;
	private int u_no;
	private String u_nick;
	private int p_no;
	private String p_name;
	private String pr_content;
	private int pr_star;
	private Date pr_date;
	private String pr_img;
	
	public int getPr_no() {
		return pr_no;
	}
	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
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
	public String getPr_content() {
		return pr_content;
	}
	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}
	public int getPr_star() {
		return pr_star;
	}
	public void setPr_star(int pr_star) {
		this.pr_star = pr_star;
	}
	public Date getPr_date() {
		return pr_date;
	}
	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	public String getPr_img() {
		return pr_img;
	}
	public void setPr_img(String pr_img) {
		this.pr_img = pr_img;
	}
	
	@Override
	public String toString() {
		return "ProdRevVO [pr_no=" + pr_no + ", u_no=" + u_no + ", u_nick=" + u_nick + ", p_no=" + p_no + ", p_name="
				+ p_name + ", pr_content=" + pr_content + ", pr_star=" + pr_star + ", pr_date=" + pr_date + ", pr_img="
				+ pr_img + "]";
	}
	
}

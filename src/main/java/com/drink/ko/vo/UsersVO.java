package com.drink.ko.vo;

public class UsersVO {
	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_nick;
	private String u_gen;
	private String u_birth;
	private String u_tel;
	private String u_email;
	private String addr1;
	private String addr2;
	private String addr3;
	private String u_lev;
	private int u_state;
	private String n_pw;

	private String searchVoca;
	private String searchWord;

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public String getU_gen() {
		return u_gen;
	}

	public void setU_gen(String u_gen) {
		this.u_gen = u_gen;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getU_lev() {
		return u_lev;
	}

	public void setU_lev(String u_lev) {
		this.u_lev = u_lev;
	}

	public int getU_state() {
		return u_state;
	}

	public void setU_state(int u_state) {
		this.u_state = u_state;
	}

	public String getN_pw() {
		return n_pw;
	}

	public void setN_pw(String n_pw) {
		this.n_pw = n_pw;
	}

	public String getSearchVoca() {
		return searchVoca;
	}

	public void setSearchVoca(String searchVoca) {
		this.searchVoca = searchVoca;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	@Override
	public String toString() {
		return "UsersVO [u_no=" + u_no + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_nick="
				+ u_nick + ", u_gen=" + u_gen + ", u_birth=" + u_birth + ", u_tel=" + u_tel + ", u_email=" + u_email
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", u_lev=" + u_lev + ", u_state="
				+ u_state + ", n_pw=" + n_pw + "]";
	}

}

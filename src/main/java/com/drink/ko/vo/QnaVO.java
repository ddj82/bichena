package com.drink.ko.vo;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
	private int q_no;
	private String q_cate;
	private String q_title;
	private String q_content;
	private String q_writer;
	private String q_date;
	private String q_state;
	private String q_img;
	private String a_content;
	
	private MultipartFile uploadFile;
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_cate() {
		return q_cate;
	}
	public void setQ_cate(String q_cate) {
		this.q_cate = q_cate;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public String getQ_state() {
		return q_state;
	}
	public void setQ_state(String q_state) {
		this.q_state = q_state;
	}
	public String getQ_img() {
		return q_img;
	}
	public void setQ_img(String q_img) {
		this.q_img = q_img;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	@Override
	public String toString() {
		return "QnaVO [q_no=" + q_no + ", q_cate=" + q_cate + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_writer=" + q_writer + ", q_date=" + q_date + ", q_state=" + q_state + ", q_img=" + q_img
				+ ", a_content=" + a_content + "]";
	}
	
}

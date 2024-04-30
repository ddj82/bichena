package com.drink.ko;

public class FaqVO {
	private int faq_no;
	private String faq_title;
	private String faq_content;
	
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_content=" + faq_content + "]";
	}
	
}

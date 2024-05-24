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
	private String a_content;

	private int rnum;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	// 검색을 위한 변수
	private String searchCondition;
	private String searchKeyword;

	// 페이징 처리를 위한 변수
	private int currPageNo; // 현재 페이지 번호
	private int sizePerPage = 10; // 한 페이지당 보여질 리스트 개수
	private int totalCnt; // 전체 목록 개수
	private int pageCnt; // 전체 페이지 개수

	private int startList; // 게시판 시작 번호
	private int range = 1; // 페이지 범위. 1 : 1~5 2: 6~10 ...
	private int pageSize = 5; // 한 페이지 범위에 보여질 페이지 개수
	private int startPage; // 각 페이지 범위의 시작 번호
	private int endPage; // 각 페이지 범위 끝 번호

	private boolean prev; // 이전 페이지 여부
	private boolean next; // 다음 페이지 여부

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

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	@Override
	public String toString() {
		return "QnaVO [q_no=" + q_no + ", q_cate=" + q_cate + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_writer=" + q_writer + ", q_date=" + q_date + ", q_state=" + q_state + ", a_content=" + a_content + "]";
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getCurrPageNo() {
		return currPageNo;
	}

	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}

	public int getSizePerPage() {
		return sizePerPage;
	}

	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	// 페이지 정보 설정 메서드
	public void pageInfo(int currPageNo, int range, int totalCnt) { // 2, 1, 52
		this.currPageNo = currPageNo;
		this.range = range;
		this.totalCnt = totalCnt;

		// 전체 페이지 수
		if (totalCnt % sizePerPage == 0) {
			this.pageCnt = totalCnt / sizePerPage;
		} else {
			this.pageCnt = totalCnt / sizePerPage + 1;
		}
		// 시작 페이지
		this.startPage = (range - 1) * pageSize + 1;
		// 끝 페이지
		this.endPage = range * pageSize;
		// 게시판 시작 번호
		this.startList = (currPageNo - 1) * sizePerPage;
		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;
		// 다음 버튼 상태
		this.next = endPage >= pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}

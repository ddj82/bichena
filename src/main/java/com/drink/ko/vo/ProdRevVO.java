package com.drink.ko.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProdRevVO {
	private int pr_no;
	private int u_no;
	private String u_nick;
	private int p_no;
	private String p_name;
	private String pr_content;
	private int pr_star;
	private String pr_date;
	private String pr_img;
	
	private String o_no;

	private MultipartFile uploadFile;
	
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

	public String getPr_date() {
		return pr_date;
	}

	public void setPr_date(String pr_date) {
		this.pr_date = pr_date;
	}

	public String getPr_img() {
		return pr_img;
	}

	public void setPr_img(String pr_img) {
		this.pr_img = pr_img;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String getO_no() {
		return o_no;
	}

	public void setO_no(String o_no) {
		this.o_no = o_no;
	}

	@Override
	public String toString() {
		return "ProdRevVO [pr_no=" + pr_no + ", u_no=" + u_no + ", u_nick=" + u_nick + ", p_no=" + p_no + ", p_name="
				+ p_name + ", pr_content=" + pr_content + ", pr_star=" + pr_star + ", pr_date=" + pr_date + ", pr_img="
				+ pr_img + ", o_no=" + o_no + "]";
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

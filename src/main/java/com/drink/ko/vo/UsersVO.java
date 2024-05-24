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
	private int u_total;

	// 검색
	private String searchVoca;
	private String searchWord;

	// 회원 상태 콤보박스
	private String orderBy;
	private String selectedStateValue;

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

	@Override
	public String toString() {
		return "유저페이징 [searchVoca=" + searchVoca + ", searchWord=" + searchWord + ", currPageNo=" + currPageNo
				+ ", sizePerPage=" + sizePerPage + ", totalCnt=" + totalCnt + ", pageCnt=" + pageCnt + ", startList="
				+ startList + ", range=" + range + ", pageSize=" + pageSize + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

	public int getU_total() {
		return u_total;
	}

	public void setU_total(int u_total) {
		this.u_total = u_total;
	}

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

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getSelectedStateValue() {
		return selectedStateValue;
	}

	public void setSelectedStateValue(String selectedStateValue) {
		this.selectedStateValue = selectedStateValue;
	}

}

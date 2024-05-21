package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.ProdRevVO;

public interface ProdRevService {
	List<ProdRevVO> prodOneRev(String p_no);
	int prodRevInsert(ProdRevVO vo);
	List<ProdRevVO> myRevList(int u_no);
	List<ProdRevVO> adminRevList(ProdRevVO vo);
	int revTotalCnt(ProdRevVO vo);// 전체 글 수 조회
	int prodRevDelete(ProdRevVO vo);
	ProdRevVO revDelSelect(ProdRevVO vo);
	
	List<ProdRevVO> mainRevList(ProdRevVO vo);
}

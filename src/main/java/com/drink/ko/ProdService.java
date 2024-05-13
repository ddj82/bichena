package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.ProdVO;

public interface ProdService {
	ProdVO prodOne(String p_no);
	List<ProdVO> prodList();
	List<ProdVO> prodList(ProdVO vo);
	int prodTotalCnt(ProdVO vo);// 전체 글 수 조회
	
	int getPnoMaxNum();
	int insertProduct(ProdVO vo);
	int updateProduct(ProdVO vo);
}

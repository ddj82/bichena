package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.ProdVO;

public interface ProdService {
	ProdVO prodOne(String p_no);
	List<ProdVO> prodList(ProdVO vo);
	int prodTotalCnt(ProdVO vo);// 글 수 조회
	ProdVO prodStock(int p_no); // 재고조회
	
	int getPnoMaxNum();
	int insertProduct(ProdVO vo);
	int updateProduct(ProdVO vo);
	int deleteProduct(String p_no);
}

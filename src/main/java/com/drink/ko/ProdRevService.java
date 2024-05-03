package com.drink.ko;

import java.util.List;

import com.drink.ko.vo.ProdRevVO;

public interface ProdRevService {
	List<ProdRevVO> prodOneRev(String p_no);
	int prodRevInsert(ProdRevVO vo);
}

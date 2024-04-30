package com.drink.ko;

import java.util.List;

public interface ProdService {
	ProdVO prodOne(String pno);
	List<ProdVO> prodList();
}

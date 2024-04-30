package com.drink.view;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drink.ko.ProdRevService;
import com.drink.ko.ProdRevVO;
import com.drink.ko.ProdService;
import com.drink.ko.ProdVO;

@Controller
public class BichenaController {
	
	@Autowired
	ProdService prodService;
	
	@Autowired
	ProdRevService prodRevService;
	

	@GetMapping("prodList.ko")
	public String prodList(Model model) {
		List<ProdVO> prodList = prodService.prodList();
		model.addAttribute("prodList", prodList);
		return "/WEB-INF/user/prodView.jsp";
	}
	
	@GetMapping("prodOne.ko")
	public String prodOne(@RequestParam(value="p_no") String pno, Model model) {
		ProdVO prodOne = prodService.prodOne(pno);
		model.addAttribute("prodOne", prodOne);
		return "/WEB-INF/user/prodOneView.jsp";
	}
	
	
	@PostMapping("prodOneRev.ko")
	@ResponseBody
	public Object prodOneNotice(@RequestParam(value="p_no") String pno, Model model) {
		List<ProdRevVO> prodOneRev = prodRevService.prodOneRev(pno);
		model.addAttribute("prodNotice", prodOneRev);
		
		Map<String, Object> prodOneRevMap = new HashMap<>();
		prodOneRevMap.put("code", "OK");
		prodOneRevMap.put("prodOneRev", prodOneRev);
		return prodOneRevMap;
	}
	
	
}

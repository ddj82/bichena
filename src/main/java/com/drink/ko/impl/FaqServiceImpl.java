package com.drink.ko.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.FaqService;
import com.drink.ko.impl.dao.FaqDAO;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqDAO dao;
}

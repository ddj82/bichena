package com.drink.ko.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.FaqService;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	FaqDAO dao;
}

package com.drink.ko.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeDAO dao;
}

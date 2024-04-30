package com.drink.ko.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.QnaService;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	QnaDAO dao;
}

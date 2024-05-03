package com.drink.ko.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.CartService;
import com.drink.ko.impl.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO dao;
}

package com.drink.ko.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drink.ko.CartService;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartDAO dao;
}

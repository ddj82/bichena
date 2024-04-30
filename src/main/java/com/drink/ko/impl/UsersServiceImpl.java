package com.drink.ko.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.drink.ko.UsersService;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	UsersDAO dao;
}

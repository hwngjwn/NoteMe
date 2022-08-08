package com.noteme.ex.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noteme.ex.common.EncryptUtils;
import com.noteme.ex.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	public int addUser(String userId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.insertUser(userId, encryptPassword);
	}
}

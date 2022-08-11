package com.noteme.ex.user.bo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noteme.ex.common.EncryptUtils;
import com.noteme.ex.user.dao.UserDAO;
import com.noteme.ex.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	public int addUser(String userId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.insertUser(userId, encryptPassword);
	}
	public int selectCount(String loginId) {
		return userDAO.selectCountLoginId(loginId);
	}
	
	public User login(String userId, String password) {
		User user = userDAO.getUser(userId);
		User returnUser;
		String encryptPassword = EncryptUtils.md5(password);
		if(encryptPassword.equals(user.getPassword())) {
			returnUser = user;
		} else {
			returnUser = null;
		}
		return returnUser;
	}
}

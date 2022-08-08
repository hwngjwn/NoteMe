package com.noteme.ex.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.noteme.ex.user.model.User;

@Repository
public interface UserDAO {

	public List<User> selectUser();
	
	public int insertUser(
		@Param("userId") String userId
		,@Param("password") String password
	);
}

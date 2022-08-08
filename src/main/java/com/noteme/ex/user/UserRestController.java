package com.noteme.ex.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noteme.ex.user.bo.UserBO;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	//회원 가입 api
	public Map<String, String> signUp(
			@RequestParam("userId") String userId
			, @RequestParam("password") String password
			){
		
		int count = userBO.addUser(userId, password);
		Map<String, String> result = new HashMap();
		
		if(count==1) {
			result.put("result", "failed");
		}else {
			result.put("result", "success");
		}
		return result;
	}
}

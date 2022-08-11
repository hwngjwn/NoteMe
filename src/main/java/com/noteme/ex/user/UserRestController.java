package com.noteme.ex.user;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noteme.ex.user.bo.UserBO;
import com.noteme.ex.user.model.User;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	//회원 가입 api
	@PostMapping("/user/signup")
	public Map<String, String> signUp(
			@RequestParam("userId") String userId
			, @RequestParam("password") String password
			){
		
		int count = userBO.addUser(userId, password);
		Map<String, String> result = new HashMap<>();
		
		if(count==1) {
			result.put("result", "success");
		}else {
			result.put("result", "failed");
		}
		return result;
	}
	
	@GetMapping("/user/duplicate_id")
	public Map<String, Boolean> isDuplicate(String userId) {
		int count = userBO.selectCount(userId);
		Map<String, Boolean> result = new HashMap<>();
		if(count == 0) {
			result.put("result", false); //중복 아님
		}else {
			result.put("result", true); //중복 있음
		}
		return result;
	}
	
	@PostMapping("/user/login")
	public Map<String, Boolean> login(String userId, String password, HttpServletRequest request){
		Map<String, Boolean> result = new HashMap<>();
		User user = userBO.login(userId, password);
		HttpSession session = request.getSession();
		if (user != null) {
			result.put("result", true);
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("id", user.getId());
			session.setAttribute("createdAt", user.getCreatedAt());
			session.setAttribute("password", user.getPassword());
		} else {
			result.put("result", false);
		}
		return result;
	}
	
	/*
	@PostMapping("/user/signin")
	public Map<String, String> login(String loginId, String password, HttpServletRequest request){
		Map<String, String> result = new HashMap<>();
		
		User user = userBO.getUser(loginId, password);
		if(user!=null) {
			result.put("result", "success");
			
			HttpSession session = request.getSessiont();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			
		} else{
			result.put("result", "failed");
		}
		
		return result;
	}*/
	
	
	
}

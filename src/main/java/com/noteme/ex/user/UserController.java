package com.noteme.ex.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.noteme.ex.memo.bo.MemoBO;
import com.noteme.ex.memo.model.Memo;

@Controller
public class UserController {

	@Autowired
	private MemoBO memoBO;

	@GetMapping("/user/signup/view")
	public String singupView() {
		return "user/signup";
	}
	
	@GetMapping("/user/signin/view")
	public String signinView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("id");
		List<Memo> allMemos = memoBO.getAllMemo(userId);
		model.addAttribute("memos", allMemos);
		return "user/signin";
	}
	
	@GetMapping("/user/login/view")
	public String loginView() {
		return "user/login";
	}
	
	@GetMapping("/user/logout")
	public String lotout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "user/login";
	}
	
	
}

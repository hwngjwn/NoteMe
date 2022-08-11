package com.noteme.ex.memo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noteme.ex.memo.bo.MemoBO;
import com.noteme.ex.memo.model.Memo;

@RestController
public class MemoRestController {

	@Autowired
	private MemoBO memoBO;
	
	@PostMapping("/memo/addMemoEntry")
	public Map<String, String> addMemoEntry(@RequestParam("title") String title, @RequestParam("entry") String entry, HttpServletRequest request){
		Map<String, String> result = new HashMap<>();
		HttpSession session = request.getSession();
		int loginId = (int)session.getAttribute("id"); //다운캐스팅 필요 (obj객체여서)
		
		int count = memoBO.insertMemo(loginId, title, entry);
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failed");
		}
		return result;
	}
	
	@GetMapping("/memo/deleteEntry")
	public Map<String, String> deleteEntry(@RequestParam("id") int id){
		Map<String, String> result = new HashMap<>();
		int count = memoBO.deleteMemo(id);
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "failed");
		}
		return result;
	}
	
	
	
	
}

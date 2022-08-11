package com.noteme.ex.memo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.noteme.ex.memo.bo.MemoBO;
import com.noteme.ex.memo.model.Memo;

@Controller
public class MemoController {
	
	@Autowired
	private MemoBO memoBO;
	
	@GetMapping("/memo/addMemo/view")
	public String newMemo() {
		return "memo/addMemo";
	}

	@GetMapping("/memo/viewMemo/view")
	public String viewMemo(@RequestParam("id") int id, Model model) {
		Memo thisMemo = memoBO.getThisMemo(id);
		model.addAttribute("memo", thisMemo);		
		return "memo/viewMemo";
	}

}

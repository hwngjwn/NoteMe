package com.noteme.ex.memo.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noteme.ex.memo.dao.MemoDAO;
import com.noteme.ex.memo.model.Memo;

@Service
public class MemoBO {
	
	@Autowired
	private MemoDAO memoDAO;
	
	public int insertMemo(int id, String title, String entry) {
		return memoDAO.insertMemo(id, title, entry);
	}
	
	public List<Memo> getAllMemo(int id) {
		return memoDAO.getAllMemo(id);
	}
	
	public Memo getThisMemo(int id) {
		return memoDAO.getThisMemo(id);
	}
	
	public int deleteMemo(int id) {
		return memoDAO.deleteMemo(id);
	}

	
}

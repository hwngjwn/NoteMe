package com.noteme.ex.memo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.noteme.ex.memo.model.Memo;

@Repository
public interface MemoDAO {
	
	public int insertMemo(
			@Param("id") int id
			,@Param("title") String title
			,@Param("entry") String entry);
	public List<Memo> getAllMemo(@Param("id") int id);
	public Memo getThisMemo(@Param("id") int id);
	public int deleteMemo(@Param("id") int id);
}

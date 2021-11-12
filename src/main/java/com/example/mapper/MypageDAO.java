package com.example.mapper;

import java.util.List;

import com.example.domain.MyfeedRefVO;
import com.example.domain.MyfeedVO;

public interface MypageDAO {
	public List<MyfeedVO> myfeedlist(String user_id);
	public void myfeed_insert(MyfeedVO vo);
	public MyfeedRefVO myfeed_ref_list(String tbl_code, int id);
}

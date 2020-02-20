package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.StoreDTO;

public interface MemberDAO {
	public MemberDTO selectId(String mb_name, String mb_email);
	public MemberDTO selectPw(String mb_id, String mb_name, String mb_email);
	public int updatePw(String mb_pw, String mb_id);
	
	// 몇번째 from 부터 몇개 rows 를 SELECT
	public ArrayList<StoreDTO> selectStore(int store_type, int from, int rows);
	
	
}

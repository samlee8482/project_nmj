package qna.project.nmj.beans.dao;

import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.StoreDTO;

public interface MemberDAO {
	public MemberDTO selectId(String mb_name, String mb_email);
	public MemberDTO selectPw(String mb_id, String mb_name, String mb_email);
	public int updatePw(String mb_pw, String mb_id);
	
	public StoreDTO selectStore(int store_type);
}

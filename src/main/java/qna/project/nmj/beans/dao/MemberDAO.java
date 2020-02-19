package qna.project.nmj.beans.dao;

import qna.project.nmj.beans.MemberDTO;

public interface MemberDAO {
	public MemberDTO selectId(String mb_name, String mb_email);
	public MemberDTO selectPw(String mb_id, String mb_name, String mb_email);
}

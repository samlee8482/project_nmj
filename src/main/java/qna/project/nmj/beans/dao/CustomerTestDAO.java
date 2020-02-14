package qna.project.nmj.beans.dao;

import qna.project.nmj.beans.MemberDTO;

public interface CustomerTestDAO {
	public MemberDTO selectMemberByUid(int mb_uid);
}

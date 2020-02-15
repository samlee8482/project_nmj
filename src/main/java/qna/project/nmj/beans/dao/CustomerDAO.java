package qna.project.nmj.beans.dao;

import qna.project.nmj.beans.CusMyPageDTO;
import qna.project.nmj.beans.MemberDTO;

public interface CustomerDAO {
	public MemberDTO selectMemberByUid(int mb_uid);
	public CusMyPageDTO selectReservationByUid(int mb_uid);
	public CusMyPageDTO selectLikeByUid(int mb_uid);
	public CusMyPageDTO selectMyReviewByUid(int mb_uid);
	public CusMyPageDTO selectMyReplyByUid(int mb_uid);
}

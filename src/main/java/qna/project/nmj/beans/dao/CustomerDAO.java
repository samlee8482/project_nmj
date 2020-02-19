package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import qna.project.nmj.beans.CusMyPageDTO;
import qna.project.nmj.beans.MemberDTO;

public interface CustomerDAO {
	public MemberDTO selectMemberByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectReservationByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectLikeByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectMyReviewByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectMyReplyByUid(int mb_uid);
}

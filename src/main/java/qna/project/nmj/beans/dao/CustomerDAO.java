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
	public MemberDTO selectId(String mb_name, String mb_email);
	public MemberDTO selectPw(String mb_id, String mb_name, String mb_email);
}

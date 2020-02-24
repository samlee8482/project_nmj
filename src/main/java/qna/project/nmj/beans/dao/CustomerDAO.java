package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.CusMyPageDTO;
import qna.project.nmj.beans.MemberDTO;

public interface CustomerDAO {
	public MemberDTO selectMemberByUid(int mb_uid);
	public int updateMemberByUid(@Param("dto") MemberDTO dto);
	public ArrayList<CusMyPageDTO> selectReservationByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectLikeByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectMyReviewByUid(int mb_uid);
	public ArrayList<CusMyPageDTO> selectMyReplyByUid(int mb_uid);
}

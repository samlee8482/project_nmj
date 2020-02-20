package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.*;

public interface AdminDAO {
	public ArrayList<MemberDTO> selectAllMember();
	public ArrayList<MemberDTO> selectAllStoreMember();
	public ArrayList<ReviewDTO> selectAllReview();
	public ArrayList<RequestDTO> selectAllRequest();
	public int deleteMember(int mb_uid);
	public MemberDTO selectMemberByUid(int mb_uid);
	public MemberDTO searchMemberByName(String search);
	public MemberDTO searchMemberById(String search);
	public StoreDTO selectStoreByUid(int mb_uid);
	public StoreMemberDTO selectStoreMemberByUid(int store_uid);
	public ReviewJoinDTO selectReviewByUid(int review_uid);
	public int deleteReview(int review_uid);
	public int increaseViewCount(int review_uid);
	public int rejectRequest(int request_uid);
	public int solveRequest(int request_uid);
	public int acceptStore(int store_uid);

}


















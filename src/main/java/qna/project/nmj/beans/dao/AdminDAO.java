package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.*;

public interface AdminDAO {
	public ArrayList<MemberDTO> selectAllMember();
	public ArrayList<MemberDTO> selectAllStoreMember();
	public ArrayList<ReviewDTO> selectAllReview();
	public ArrayList<RequestDTO> selectAllRequest();
	public ArrayList<ReplyDTO> selectAllReply();
	public int deleteMember(int mb_uid);
	public MemberDTO selectMemberByUid(int mb_uid);
	public ArrayList<MemberDTO> searchMemberByName(String search);
	public ArrayList<MemberDTO> searchMemberById(String search);
	public StoreDTO selectStoreByUid(int mb_uid);
	public StoreDTO selectStoreBySUid(int store_uid);
	public ArrayList<StoreMemberDTO> searchStoreByName(String search);
	public ArrayList<StoreMemberDTO> searchStoreById(String search);
	public ArrayList<StoreMemberDTO> selectNStore();
	public ArrayList<StoreMemberDTO> selectMStore();
	public ArrayList<StoreMemberDTO> selectJStore();
	public StoreMemberDTO selectStoreMemberByUid(int store_uid);
	public ReviewJoinDTO selectReviewByUid(int review_uid);
	public ReplyJoinDTO selectReplyByUid(int reply_uid);
	public RequestDTO selectRequestByUid(int request_uid);
	public ArrayList<ReviewJoinDTO> searchReviewByContent(String search);
	public ArrayList<ReplyJoinDTO> searchReplyByContent(String search);
	public ArrayList<ReviewJoinDTO> searchReviewById(String search);
	public ArrayList<ReplyJoinDTO> searchReplyById(String search);
	public int deleteReview(int review_uid);
	public int deleteReply(int review_uid);
	public int increaseViewCount(int review_uid);
	public int rejectRequest(int request_uid);
	public int solveRequest(int request_uid);
	public int acceptStore(int store_uid);
	public int updateStore(int store_uid);

}


















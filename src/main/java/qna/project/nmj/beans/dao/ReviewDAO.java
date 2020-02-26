package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import qna.project.nmj.beans.*;

public interface ReviewDAO {
	
	// 리뷰 삽입
	public int insertReview(int mb_uid, int store_uid, String review_content, int review_rate);
	
	// 리뷰에서 평점 매김과 동시에 매장 평점 업데이트
	public int increaseReviewRate(int review_rate, int store_uid);
	
	// 리뷰 목록
	public ArrayList<ReviewJoinDTO> selectAllReview();
	public ArrayList<ReviewJoinDTO> selectAllReview2();
	
	// 댓글 목록
	public ArrayList<ReplyJoinDTO> selectAllReply(int review_uid);
	
	// 리뷰 1개 불러오기
	public ReviewJoinDTO selectReviewByUid(int review_uid);
	
	// 리뷰 조회수 증가
	public int increaseViewCount(int review_uid);
	
	// 리뷰 신고
	public int reportReview(int review_uid);
	
	// 댓글 신고
	public int reportReply(int reply_uid);
	
	// 리뷰 수정
	public int updateReview(int mb_uid, String review_content);
}

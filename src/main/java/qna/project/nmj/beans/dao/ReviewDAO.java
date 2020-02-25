package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.ReviewDTO;
import qna.project.nmj.beans.ReviewJoinDTO;

public interface ReviewDAO {
	
	// 리뷰 삽입
	public int insertReview(int mb_uid, int store_uid, String review_content, int review_rate);
	
	// 리뷰에서 평점 매김과 동시에 매장 평점 업데이트
	public int increaseReviewRate(int review_rate, int store_uid);
	
	// 리뷰 목록
	public ArrayList<ReviewDTO> selectAllReview();
	
	// 리뷰 1개 불러오기
	public ReviewJoinDTO selectReviewByUid(int review_uid);
	
	// 리뷰 조회수 증가
	public int increaseViewCount(int review_uid);
	
	// 리뷰 수정
	public int updateReview(int mb_uid, String review_content);
}

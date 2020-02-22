package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import qna.project.nmj.beans.ReviewDTO;
import qna.project.nmj.beans.ReviewJoinDTO;

public interface ReviewDAO {
	
	// 리뷰 삽입
	public int insertReview(int mb_uid, String review_content, int review_rate);
	
	// 리뷰 목록
	public ArrayList<ReviewDTO> selectAllReview();
	
	// 리뷰 1개 불러오기
	public ReviewJoinDTO selectReviewByUid(int review_uid);
	
	// 리뷰 조회수 증가
	public int increaseViewCount(int review_uid);
}

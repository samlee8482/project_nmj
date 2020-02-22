package qna.project.nmj.beans.dao;

public interface ReviewDAO {
	
	// 리뷰 삽입
	public int insertReview(int mb_uid, String review_content, int review_rate);
}

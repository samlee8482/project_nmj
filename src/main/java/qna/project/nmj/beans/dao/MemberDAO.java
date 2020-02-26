package qna.project.nmj.beans.dao;

import java.util.ArrayList;


import qna.project.nmj.beans.*;

public interface MemberDAO {
	
	// 아이디 비밀번호 찾기
	// 아이디 찾기
	public MemberDTO selectId(String mb_name, String mb_email);
	// 비밀번호 불러오기
	public MemberDTO selectPw(String mb_id, String mb_name, String mb_email);
	// 비밀번호 수정
	public int updatePw(String mb_pw, String mb_id);
	
	// 매장 찾기 페이지
	// 몇번째 from 부터 몇개 rows 를 SELECT
	public ArrayList<StoreDTO> selectStore(int store_type);
	public ArrayList<StoreTypeDTO> selectStoreType(int store_type);
	// public ArrayList<FindStoreDTO> page(int store_type, @Param("fromRow") int fromRow, @Param("writePages") int writePages);
	public int selectStoreCount(int store_type);
	//	public ArrayList<StoreDTO> selectStore(int store_type, int from, int rows);
	
	// 매장 상세 페이지
	public StoreDetailDTO selectStoreDetail(int store_uid);
	public StoreDetailDTO StoreDetailRestSeat(int store_uid);
	public ArrayList<StoreDetailDTO> selectFood(int store_uid);
	
	// 메인페이지
	public ArrayList<MainDTO> selectHotPlaceNol();
	public ArrayList<MainDTO> selectHotPlaceMuk();
	public ArrayList<MainDTO> selectHotPlaceJa();
	
	public ArrayList<MainDTO> selectCommunity();
	
	
}

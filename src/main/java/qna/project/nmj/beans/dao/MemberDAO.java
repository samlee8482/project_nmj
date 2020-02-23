package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.*;

public interface MemberDAO {
	public MemberDTO selectId(String mb_name, String mb_email);
	public MemberDTO selectPw(String mb_id, String mb_name, String mb_email);
	public int updatePw(String mb_pw, String mb_id);
	
	// 몇번째 from 부터 몇개 rows 를 SELECT
	public ArrayList<StoreDTO> selectStore(int store_type);
	public ArrayList<StoreTypeDTO> selectStoreType(int store_type);
	public ArrayList<FindStoreDTO> page(int store_type, @Param("fromRow") int fromRow, @Param("writePages") int writePages);
	public int selectStoreCount(int store_type);
	//	public ArrayList<StoreDTO> selectStore(int store_type, int from, int rows);
	
	
}

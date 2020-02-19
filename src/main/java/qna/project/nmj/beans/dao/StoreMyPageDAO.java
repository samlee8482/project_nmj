package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.*;

public interface StoreMyPageDAO {

	public ArrayList<ReviewDTO> reviewSelect(int store_uid);
	
	public int spaceInsert(StoreDTO dto);
	
	public int spaceListInsert(String store_dtype);
	
	public int spaceImageInsert(SpaceImgDTO dto);
	
	public int spaceImageUpdate(SpaceImgDTO dto);
	
	public int spaceImageDelete(int space_uid);
	
	/**
	 * select a store by store_uid
	 * @return StoreDTO
	 */
	public StoreDTO selectStoreByUid(int store_uid);
	
	/**
	 * update a store by store_uid w/o image
	 * @param dto
	 * @return success == 1
	 */
	public int updateStoreWOImageByUid(@Param("dto") StoreDTO dto);
	
	/**
	 * update a store by store_uid w/ image
	 * @param dto
	 * @return success == 1
	 */
	public int updateStoreWImageByUid(@Param("dto") StoreDTO dto);
}

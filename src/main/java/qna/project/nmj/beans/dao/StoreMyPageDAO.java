package qna.project.nmj.beans.dao;

import java.util.ArrayList;

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
}

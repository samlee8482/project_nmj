package qna.project.nmj.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.ajax.dto.AjaxStoreDTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypesDTO;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.FoodDTO;
import qna.project.nmj.beans.StoreTypeDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

@RestController
@RequestMapping("/ajax/store")
public class AjaxStoreMyPageController {
	
	// 매장 회원 정보 수정 요청 페이지 (storeSettingsRequest)
	// 매장 상세 종류 불러오기
	@RequestMapping("/dtypeList.ajax")
	public AjaxStoreTypesDTO dtypeList() {
		AjaxStoreTypesDTO ajaxDTO = new AjaxStoreTypesDTO();
		ArrayList<StoreTypeDTO> storeDTO = new ArrayList<>();
		ArrayList<AjaxStoreTypeDTO> store_types = new ArrayList<>();
		ArrayList<AjaxStoreDTypeDTO> store_dtypes = null;
		
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		storeDTO = dao.selectAllStoreDType();
		
		int count = storeDTO.size();
		ajaxDTO.setCount(count);
		
		if(count > 0) {
			ajaxDTO.setStatus("OK");
		} else {
			ajaxDTO.setStatus("FAIL");
		}
		
		
		for (int i = 1; i <= 3; i++) {
			AjaxStoreTypeDTO type = new AjaxStoreTypeDTO();
			type.setStore_type(i);
			
			store_dtypes = new ArrayList<>();
			for (int j = 0; j < storeDTO.size(); j++) {
				if(storeDTO.get(j).getStore_type() == i) {
					AjaxStoreDTypeDTO dtype = new AjaxStoreDTypeDTO(storeDTO.get(j).getStore_dtype(), storeDTO.get(j).getStore_dname());
					store_dtypes.add(dtype);
				}
			}
			type.setStore_dtypes(store_dtypes);
			store_types.add(type);
		}
		
		ajaxDTO.setStore_types(store_types);
		
		
		return ajaxDTO;
	}
	
	@RequestMapping(value = "/foodList.ajax/{store_uid}")
	public ArrayList<FoodDTO> foodList(@PathVariable("store_uid") int store_uid) {
		ArrayList<FoodDTO> dto = new ArrayList<FoodDTO>();
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		dto = dao.selectFoodByStoreUid(store_uid);
		return dto;
	}
}

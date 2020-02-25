package qna.project.nmj.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.ajax.dto.AjaxStoreDTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreFindDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypeDTO;
import qna.project.nmj.ajax.dto.AjaxStoreTypesDTO;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.FindStoreDTO;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.StoreTypeDTO;
import qna.project.nmj.beans.dao.MemberDAO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

@RestController
@RequestMapping("/memberAjax")
public class AjaxMemberController {

	@RequestMapping("/findStore.nmj/{writePages}/{page}")
	public AjaxStoreFindDTO findStore(int store_type, 
			@PathVariable("writePages") int writePages,
			@PathVariable("page") int page) {
		AjaxStoreFindDTO ajax = new AjaxStoreFindDTO();
		ArrayList<FindStoreDTO> list = null;
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		list = dao.page(store_type, writePages*(page-1), writePages);
		ajax.setList(list);
		
		if(list.size() > 0 && list != null) {
			ajax.setStatus("OK");
			ajax.setCount(list.size());
		}else {
			ajax.setStatus("FAIL");
			ajax.setCount(0);
		}
				
		return ajax;
	}
	
	@RequestMapping("/findStoreBtn.nmj/{store_dtype}")
	public AjaxStoreFindDTO findStoreBtn(int store_dtype, 
			@PathVariable("writePages") int writePages,
			@PathVariable("page") int page) {
		AjaxStoreFindDTO ajax = new AjaxStoreFindDTO();
		ArrayList<FindStoreDTO> list = null;
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		list = dao.page(store_dtype, writePages*(page-1), writePages);
		ajax.setList(list);
		
		if(list.size() > 0 && list != null) {
			ajax.setStatus("OK");
			ajax.setCount(list.size());
		}else {
			ajax.setStatus("FAIL");
			ajax.setCount(0);
		}
				
		return ajax;
	}
	
	@RequestMapping("/dtypeList.ajax")
	public AjaxStoreTypesDTO dtypeList() {
		AjaxStoreTypesDTO ajaxDTO = new AjaxStoreTypesDTO();
		ArrayList<StoreTypeDTO> storeDTO = new ArrayList<>();
		ArrayList<AjaxStoreTypeDTO> store_types = new ArrayList<>();
		ArrayList<AjaxStoreDTypeDTO> store_dtypes = null;
		ArrayList<StoreDTO> stores = null;
		ArrayList<StoreDTO> storesPointer = null;
		
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		storeDTO = dao.selectAllStoreDType();
		stores = dao.selectAllStores();
		int count = storeDTO.size();
		ajaxDTO.setCount(count);
		
		if(count > 0) {
			ajaxDTO.setStatus("OK");
		} else {
			ajaxDTO.setStatus("FAIL");
		}
		
		// store_type 별
		for (int i = 1; i <= 3; i++) {
			AjaxStoreTypeDTO type = new AjaxStoreTypeDTO();
			type.setStore_type(i);
			
			// store_type 별 store_dtype담기
			store_dtypes = new ArrayList<>();
			for (int j = 0; j < storeDTO.size(); j++) {
				if(storeDTO.get(j).getStore_type() == i) {
					AjaxStoreDTypeDTO dtype = new AjaxStoreDTypeDTO(storeDTO.get(j).getStore_dtype(), storeDTO.get(j).getStore_dname());
					storesPointer = new ArrayList<StoreDTO>();
					for(int k = 0; k < stores.size(); k++) {
						if(stores.get(k).getStore_dtype() == dtype.getStore_dtype()) {
							storesPointer.add(stores.get(k));
						}
					}
					dtype.setStores(storesPointer);
					store_dtypes.add(dtype);
				}
			}
			type.setStore_dtypes(store_dtypes);
			store_types.add(type);
		}
		
		ajaxDTO.setStore_types(store_types);
		
		
		return ajaxDTO;
	}
	
	
	
	
	
}

package qna.project.nmj.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.ajax.dto.AjaxStoreTypeDTO;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreTypeDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

@RestController
@RequestMapping("/ajax/store")
public class AjaxStoreMyPageController {
	
	// 매장 회원 정보 수정 요청 페이지 (storeSettingsRequest)
	// 매장 상세 종류 불러오기
	@RequestMapping("/dtypeList.ajax")
	public AjaxStoreTypeDTO dtypeList() {
		AjaxStoreTypeDTO ajaxDTO = new AjaxStoreTypeDTO();
		ArrayList<StoreTypeDTO> storeDTO = new ArrayList<>();
		
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		storeDTO = dao.selectAllStoreDType();
		ajaxDTO.setStoreDTO(storeDTO);
		
		int count = storeDTO.size();
		ajaxDTO.setCount(count);
		
		if(count > 0) {
			ajaxDTO.setStatus("OK");
		} else {
			ajaxDTO.setStatus("FAIL");
		}
		
		return ajaxDTO;
	}
}

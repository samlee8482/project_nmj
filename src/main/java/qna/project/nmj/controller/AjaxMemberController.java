package qna.project.nmj.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import qna.project.nmj.ajax.dto.AjaxStoreFindDTO;
import qna.project.nmj.beans.C;
import qna.project.nmj.beans.FindStoreDTO;
import qna.project.nmj.beans.dao.MemberDAO;

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
	
	
}

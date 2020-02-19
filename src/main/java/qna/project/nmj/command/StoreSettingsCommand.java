package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.StoreMyPageDAO;

public class StoreSettingsCommand implements Command {

	@Override
	public void execute(Model model) {
		// 1. parameter 불어오기
		int store_uid = (Integer)model.getAttribute("store_uid");
		
		// 2. dao 생성
		StoreMyPageDAO dao = C.sqlSession.getMapper(StoreMyPageDAO.class);
		
		// 3. dao의  쿼리문 실행
		// mapper xml 적용
		StoreDTO result = dao.selectStoreByUid(store_uid);
		
		model.addAttribute("result", result);
	}
	
}

package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.*;
import qna.project.nmj.beans.dao.AdminDAO;

public class AdminStoreAcceptCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int store_uid = (Integer)map.get("store_uid");

		AdminDAO dao = C.sqlSession.getMapper(AdminDAO.class);

		StoreMemberDTO dto = dao.selectStoreMemberByUid(store_uid);
		model.addAttribute("dto", dto);
	}

}

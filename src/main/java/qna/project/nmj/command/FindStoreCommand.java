package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MemberDAO;

public class FindStoreCommand implements Command {

	@Override
	public void execute(Model model) {
		String store_type = (String)model.getAttribute("store_type");
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		model.addAttribute("list", dao.selectStore(store_type));
		
	}

}

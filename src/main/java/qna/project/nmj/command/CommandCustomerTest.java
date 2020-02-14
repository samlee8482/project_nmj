package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.CustomerTestDAO;

public class CommandCustomerTest implements Command{

	@Override
	public void execute(Model model) {
		
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		CustomerTestDAO dao = C.sqlSession.getMapper(CustomerTestDAO.class);
		MemberDTO myPage = dao.selectMemberByUid(mb_uid);
		model.addAttribute("myPage", myPage);
	}

}

package qna.project.nmj.command;


import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.CustomerDAO;

public class MbFindIdOkCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDTO dto = null;
		CustomerDAO dao = C.sqlSession.getMapper(CustomerDAO.class);
		
		Map<String, Object> map = model.asMap();
		
		String mb_name = (String)map.get("mb_name");
		System.out.println("Command " + mb_name);
		String mb_email = (String)map.get("mb_email");
		System.out.println("Command " + mb_email);
		
//		String mb_name = (String)model.getAttribute("mb_name");
//		System.out.println("Command " + mb_name);
//		String mb_email = (String)model.getAttribute("mb_email");
//		System.out.println("Command " + mb_email);
		
		dto = dao.selectId(mb_name, mb_email);
		model.addAttribute("findIdOk", dto);
	}

}

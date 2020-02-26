package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.MemberDAO;

public class SignUpCustomerOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO)map.get("dto");
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		cnt = dao.insertMember(dto);
		
		model.addAttribute("result", cnt);
	}

}

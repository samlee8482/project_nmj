package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.MemberDAO;

public class SignUpStoreRegOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		Map<String, Object> map = model.asMap();
		StoreDTO dto = (StoreDTO)map.get("dto");
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		cnt = dao.insertStore(dto);
		
		model.addAttribute("result", cnt);
	}

}

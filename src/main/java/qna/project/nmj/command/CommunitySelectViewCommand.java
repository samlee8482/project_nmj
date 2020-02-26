package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewDTO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunitySelectViewCommand implements Command {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mb_uid = (Integer)map.get("mb_uid");
		System.out.println("Command mb_uid : " + mb_uid);
		int review_uid = (Integer)map.get("review_uid");
		System.out.println("Command review_uid : " + review_uid);
		
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		
		ReviewDTO dto = dao.selectReviewByUid2(mb_uid, review_uid);
		model.addAttribute("dto", dto);
	}

}

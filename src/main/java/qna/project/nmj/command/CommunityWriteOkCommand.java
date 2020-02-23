package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewJoinDTO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityWriteOkCommand implements Command {

	@Override
	public void execute(Model model) {
		
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		System.out.println("Command : " + mb_uid);
		String review_content = (String)model.getAttribute("review_content");
		System.out.println("Command : " + review_content);
		review_content = review_content.replace("<p>", "").replace("</p>", "");
		System.out.println("Command : " + review_content);
		int review_rate = (Integer)model.getAttribute("review_rate");
		System.out.println("Command : " + review_rate);

		int cnt = 0;
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		
		cnt = dao.insertReview(mb_uid, review_content, review_rate);
		
		model.addAttribute("result", cnt);
	}

}

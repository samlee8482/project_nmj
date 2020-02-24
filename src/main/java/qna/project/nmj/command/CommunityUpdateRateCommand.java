package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityUpdateRateCommand implements Command {

	@Override
	public void execute(Model model) {
		int review_rate = (Integer)model.getAttribute("review_rate");
		System.out.println("Command review_rate : " + review_rate);
		
		int store_uid = (Integer)model.getAttribute("store_uid");
		System.out.println("Command store_uid : " + store_uid);
		
		int cnt = 0;
		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		
		cnt = dao.increaseReviewRate(review_rate, store_uid);
		
		model.addAttribute("result", cnt);
	}

}

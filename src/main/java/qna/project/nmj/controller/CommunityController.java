package qna.project.nmj.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.beans.C;
import qna.project.nmj.command.Command;
import qna.project.nmj.command.CommunityListCommand;
import qna.project.nmj.command.CommunityUpdateRateCommand;
import qna.project.nmj.command.CommunityViewCommand;
import qna.project.nmj.command.CommunityWriteOkCommand;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	private Command command;

	@RequestMapping("/writeReview.nmj")
	public String insertReview(int mb_uid, int store_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("store_uid", store_uid);
		return "/community/writeReview";
	}
	
	@PostMapping(value = "/writeReviewOk.nmj")
	public String insertReviewOk(int mb_uid, int store_uid, String review_content, int review_rate, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		System.out.println("Controller mb_uid : " + mb_uid);
		model.addAttribute("store_uid", store_uid);
		System.out.println("Controller store_uid : " + store_uid);
		model.addAttribute("review_content", review_content);
		System.out.println("Controller review_content : " + review_content);
		model.addAttribute("review_rate", review_rate);
		System.out.println("Controller review_rate : " + review_rate);
		new CommunityWriteOkCommand().execute(model);
		new CommunityUpdateRateCommand().execute(model);
		return "/community/writeReviewOk";
	}
	
	@RequestMapping("/communityList.nmj")
	public String selectAllReview( Model model) {
		command = new CommunityListCommand();
		command.execute(model);
		return "community/communityList";
	}
	
	@RequestMapping(value = "/communityView.nmj")
	public String communityView(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new CommunityViewCommand().execute(model);
		return "community/communityView";
	}
	
}

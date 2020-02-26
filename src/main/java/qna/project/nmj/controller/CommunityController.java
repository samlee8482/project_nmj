package qna.project.nmj.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewDTO;
import qna.project.nmj.command.*;

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
	public String writeReview(int mb_uid, int store_uid, Model model) {
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
	
	@RequestMapping("/communityList2.nmj")
	public String selectAllReview2( Model model) {
		command = new CommunityListCommand2();
		command.execute(model);
		return "community/communityList2";
	}
	
	@RequestMapping(value = "/communityView.nmj")
	public String communityView(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new CommunityViewCommand().execute(model);
		return "community/communityView";
	}
	
	@RequestMapping("/updateReview.nmj")
	public String updateReview(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new CommunityViewCommand().execute(model);
		return "/community/updateReview";
	}
	
	@RequestMapping("/updateReviewOk.nmj")
	public String updateReviewOk(int mb_uid, String review_content, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_content", review_content);
		command = new CommunityUpdateReviewOkCommand();
		command.execute(model);
		return "/community/updateReviewOk";
	}
	
	@RequestMapping("/reportReview.nmj")
	public String reportReview(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new CommunityReportReviewCommand().execute(model);
		return "/community/reportReview";
	}
	
	@PostMapping(value = "/writeReply.nmj")
	public String insertReply(int mb_uid, String reply_content, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("reply_content", reply_content);
		new CommunityWriteReplyCommand().execute(model);
		return "/community/writeReply";
	}
	
}

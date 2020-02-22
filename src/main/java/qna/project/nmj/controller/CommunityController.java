package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.command.CommunityWriteOkCommand;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@RequestMapping("/writeReview.nmj")
	public String insertReview(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		return "/community/writeReview";
	}
	
	@RequestMapping("/writeReviewOk.nmj")
	public String insertReviewOk(int mb_uid, String review_content, int review_rate, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		System.out.println("Controller : " + mb_uid);
		model.addAttribute("review_content", review_content);
		System.out.println("Controller : " + review_content);
		model.addAttribute("review_rate", review_rate);
		System.out.println("Controller : " + review_rate);
		new CommunityWriteOkCommand().execute(model);
		return "/community/writeReview";
	}
	
}

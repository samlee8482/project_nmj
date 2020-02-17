package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.command.Command;
import qna.project.nmj.command.StoreMyReviewCommand;

@Controller
@RequestMapping(value="/store")
public class ControllerStoreMyPage {

	private Command command;
	
	@RequestMapping(value="/storeMyReview")
	public String storeMyReview(Model model, int store_uid) {
		model.addAttribute("store_uid", store_uid);
		command = new StoreMyReviewCommand();
		command.execute(model);
		
		return "store/storeMyReview";
	}

}

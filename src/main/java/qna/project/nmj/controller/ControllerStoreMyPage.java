package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.command.Command;
import qna.project.nmj.command.StoreSettingsCommand;
import qna.project.nmj.command.StoreMyReviewCommand;

@Controller
@RequestMapping(value="/store")
public class ControllerStoreMyPage {

	private Command command;
	
	
//	0. 매장 회원 마이 페이지
	@RequestMapping(value="/storeMyPage.nmj")
	public String storeMyPage(Model model) {
		// TODO
		// store_uid값 Parameter로 받아오기 (회원 로그인 가능할 때 변경)
		int store_uid = 1;
		model.addAttribute("store_uid", store_uid);
		return "/store/storeMyPage";
	}
	
	
//	1. 회원 정보 수정
	// TODO
	
	
//	2. 매장 정보 수정
	@RequestMapping("/storeSettings.nmj")
	public String storeGeneralSettings(int store_uid, Model model) {
		model.addAttribute("store_uid", store_uid);
		new StoreSettingsCommand().execute(model);
		return "/store/storeSettings";
	}
	
	
//	3. 매장 정보 수정 요청
	// TODO
	
	
//	4. 음식 메뉴 관리
	// TODO
	
	
//	5. 매장 공간 관리
	// TODO
	
	
//	6. 내 매장 리뷰 보기
	@RequestMapping(value="/storeMyReview")
	public String storeMyReview(Model model, int store_uid) {
		model.addAttribute("store_uid", store_uid);
		command = new StoreMyReviewCommand();
		command.execute(model);
		
		return "store/storeMyReview";
	}

	
}

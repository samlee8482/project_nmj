package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.command.Command;
import qna.project.nmj.command.StoreSettingsCommand;
import qna.project.nmj.command.StoreSettingsOkCommand;
import qna.project.nmj.command.StoreMyReviewCommand;

@Controller
@RequestMapping(value="/store")
public class StoreMyPageController {

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
	public String storeSettings(int store_uid, Model model) {
		model.addAttribute("store_uid", store_uid);
		new StoreSettingsCommand().execute(model);
		return "/store/storeSettings";
	}
//	2-2. 매정 정보 수정 ok
	@RequestMapping(value="/storeSettingsOk.nmj", method = RequestMethod.POST)
	public String storeSettingsOk(@RequestParam("upload") MultipartFile upload, StoreDTO dto, Model model) {
		model.addAttribute("dto", dto);
		model.addAttribute("upload", upload);
		new StoreSettingsOkCommand().execute(model);
		return "/store/storeSettingsOk";
	}
	
	
//	3. 매장 정보 수정 요청
	@RequestMapping(value = "/storeSettingsRequest.nmj")
	public String storeSettingsRequest(int store_uid, Model model) {
		model.addAttribute("store_uid", store_uid);
		new StoreSettingsCommand().execute(model);
		return "/store/storeSettingsRequest";
	}
	
	
//	4. 음식 메뉴 관리
	// TODO
	
	
//	5. 매장 공간 관리
	@RequestMapping(value="/storeMySpace.nmj")
	public String storeMySpace(Model model) {
		
		return "/store/storeMySpace";
	}
	
	
//	6. 내 매장 리뷰 보기
	@RequestMapping(value="/storeMyReview.nmj")
	public String storeMyReview(Model model, int store_uid) {
		model.addAttribute("store_uid", store_uid);
		command = new StoreMyReviewCommand();
		command.execute(model);
		
		return "store/storeMyReview";
	}

	
}

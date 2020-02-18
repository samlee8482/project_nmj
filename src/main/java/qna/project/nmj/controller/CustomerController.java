package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.command.CusShowLikeCommand;
import qna.project.nmj.command.CusShowReplyCommand;
import qna.project.nmj.command.CusShowReserveCommand;
import qna.project.nmj.command.CusShowReviewCommand;
import qna.project.nmj.command.CusUpdateInfoCommand;
import qna.project.nmj.command.MbFindIdOkCommand;
import qna.project.nmj.command.MbFindPwOkCommand;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	// 마이페이지 연결 전 세션값 있는지 확인하는 페이지
	@RequestMapping("/cusMyPageAction.nmj")
	public String updateInfoAction() {
		return "/customer/cusMyPageAction";
	}
	
	// 손님회원 - 마이페이지(새힘)
	@RequestMapping("/cusMyPage.nmj")
	public void myPage() {
		
	}
	
	// 마이페이지 - 회원 정보 수정 
	@RequestMapping("/cusUpdateInfo.nmj")
	public String updateInfo(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new CusUpdateInfoCommand().execute(model);
		return "/customer/cusUpdateInfo";
	}
	
	// 마이페이지 - 예약/찜 목록 보기
	@RequestMapping("/cusShowReserve.nmj")
	public String showReserve(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new CusShowReserveCommand().execute(model);
		new CusShowLikeCommand().execute(model);
		return "/customer/cusShowReserve";
	}
	
	// 마이페이지 - 내 리뷰, 댓글 보기
	@RequestMapping("/cusShowReview.nmj")
	public String showReview(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new CusShowReviewCommand().execute(model);
		new CusShowReplyCommand().execute(model);
		return "/customer/cusShowReview";
	}
	
	// 아이디 비밀번호 찾기
	@RequestMapping("/findIdPw.nmj")
	public void findIdPw() {
		
	}
	
	// 아이디 찾기
	@RequestMapping("/findIdOk.nmj")
	public String findIdOk(String mb_name, String mb_email, Model model) {
		model.addAttribute("mb_name", mb_name);
		System.out.println("Controller " + mb_name);
		model.addAttribute("mb_email", mb_email);
		System.out.println("Controller " + mb_email);
		new MbFindIdOkCommand().execute(model);
		return "/customer/findIdOk";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findPwOk.nmj")
	public String findPwOk(String mb_id, String mb_name, String mb_email, Model model) {
		model.addAttribute("mb_id", mb_id);
		System.out.println("Controller " + mb_id);
		model.addAttribute("mb_name", mb_name);
		System.out.println("Controller " + mb_name);
		model.addAttribute("mb_email", mb_email);
		System.out.println("Controller " + mb_email);
		new MbFindPwOkCommand().execute(model);
		return "/customer/findPwOk";
	}
	
}

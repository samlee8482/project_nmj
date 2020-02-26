package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.command.*;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	// 아이디 비밀번호 찾기
	@RequestMapping("/findIdPw.nmj")
	public void findIdPw() {
		
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/findIdOk.nmj", method = RequestMethod.POST)
	public String findIdOk(String mb_name, String mb_email, Model model) {
		model.addAttribute("mb_name", mb_name);
		System.out.println("Controller " + mb_name);
		model.addAttribute("mb_email", mb_email);
		System.out.println("Controller " + mb_email);
		new MbFindIdOkCommand().execute(model);
		return "/member/findIdOk";
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
		return "/member/findPwOk";
	}
	
	// 매장 찾기 페이지
	@GetMapping("/findStore.nmj")
	public String findStoreGet(int store_type, Model model) {
		model.addAttribute("store_type", store_type);
		// model.addAttribute("page", page);
		new FindStoreGetCommand().execute(model);
		
		return "/member/findStore";
	}
	
	
	
	@RequestMapping("storeDetail.nmj")
	public String storeDetail(int store_uid, Model model) {
		model.addAttribute("store_uid", store_uid);
		new StoreDetailCommand().execute(model);
		return "/member/storeDetail";
	}
	
	
	@RequestMapping("main.nmj")
	public String main(Model model) {
		new MainCommand().execute(model);
		return "/member/main";
	}
	
	
	
	
	
	
	
	
	// 회원가입
	// 약관동의 양식
	@RequestMapping("/signUpTerms.nmj")
	public void signUpTerms() {
		
	}
	
	// 회원가입 양식
	@RequestMapping("/signUpCustomer.nmj")
	public void signUpCustomer() {
		
	}
	
	@RequestMapping("/signUpCustomerOk.nmj")
	public String signUpCustomerOk(MemberDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new SignUpCustomerOkCommand().execute(model);
		return "/member/signUpCustomerOk";
	}
	
}

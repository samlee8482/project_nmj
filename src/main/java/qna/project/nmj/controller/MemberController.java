package qna.project.nmj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.command.FindStoreGetCommand;
import qna.project.nmj.command.LoginCommand;
import qna.project.nmj.command.MainCommand;
import qna.project.nmj.command.MbFindIdOkCommand;
import qna.project.nmj.command.MbFindPwOkCommand;
import qna.project.nmj.command.SignUpCustomerOkCommand;
import qna.project.nmj.command.SignUpStoreRegOkCommand;
import qna.project.nmj.command.StoreDetailCommand;

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
		model.addAttribute("nav", 1);
		return "/member/main";
	}
	
	
	
	
	
	
	
	
	// 회원가입
	// 회원타입 선택
	@RequestMapping("/signUpType.nmj")
	public void signUpType() {
		
	}
	
	// 일반회원 약관동의 양식
	@RequestMapping("/signUpTerms.nmj")
	public void signUpTerms() {
		
	}
	
	// 매장회원 약관동의 양식
	@RequestMapping("/signUpTerms2.nmj")
	public void signUpTerms2() {
		
	}
	
	// 회원가입 양식
	@RequestMapping("/signUpCustomer.nmj")
	public void signUpCustomer() {
		
	}
	
	// 회원가입 양식
	@RequestMapping("/signUpStore.nmj")
	public void signUpStore() {
		
	}
	
	// 일반회원가입
	@RequestMapping("/signUpCustomerOk.nmj")
	public String signUpCustomerOk(MemberDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new SignUpCustomerOkCommand().execute(model);
		return "/member/signUpCustomerOk";
	}
	
	// 매장회원가입
	@RequestMapping("/signUpStoreOk.nmj")
	public String signUpStoreOk(MemberDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new SignUpCustomerOkCommand().execute(model);
		return "/member/signUpStoreOk";
	}
	
	// 매장회원 매장정보 양식
	@RequestMapping("/signUpStoreReg.nmj")
	public void signUpStoreReg() {
		
	}
	
	// 매장회원 매장정보 요청
	@RequestMapping("/signUpStoreRegOk.nmj")
	public String signUpStoreRegOk(String store_name, String store_address, String store_regNum, String store_type, String store_dtype, String store_tel, String store_start, String store_end, String store_content, Model model) {
		model.addAttribute("store_name", store_name);
		model.addAttribute("store_address", store_address);
		model.addAttribute("store_regNum", store_regNum);
		model.addAttribute("store_type", store_type);
		model.addAttribute("store_dtype", store_dtype);
		model.addAttribute("store_tel", store_tel);
		model.addAttribute("store_start", store_start);
		model.addAttribute("store_end", store_end);
		model.addAttribute("store_content", store_content);
		new SignUpStoreRegOkCommand().execute(model);
		return "/member/signUpStoreRegOk";
	}
	
	// 로그인
	@RequestMapping("/login.nmj")
	public String login() {
		return "/member/login";
	}
	
	// 로그인 ok
	@RequestMapping("/loginOk.nmj")
	public String loginOk(Model model, String mb_id, String mb_pw, HttpSession session) {
		model.addAttribute("mb_id", mb_id);
		model.addAttribute("mb_pw", mb_pw);
		new LoginCommand().execute(model);
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		if(mb_uid != 0) {
			session.setAttribute("mb_uid", mb_uid);
		}
		int type = (Integer)model.getAttribute("type");
		session.setAttribute("mb_type", type);
		System.out.println(type);
		if(type == 2) {
			int store_uid = (Integer)model.getAttribute("store_uid");
			session.setAttribute("store_uid", store_uid);
		}
		return "/member/loginOk";
	}
}

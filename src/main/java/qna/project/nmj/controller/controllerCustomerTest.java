package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.command.CommandCustomerTest;

@Controller
@RequestMapping("/customer")
public class controllerCustomerTest {
	
	// 손님회원 - 마이페이지(새힘)
	// 일단 void 로 해둔거임 신경쓰지마셈
	@RequestMapping("/cusMyPage.nmj")
	public void myPage() {
		
	}
	
	// 세션값 있는지 확인해주는 페이지
	@RequestMapping("/cusUpdateInfoAction.nmj")
	public String updateInfoAction() {
		return "/customer/cusUpdateInfoAction";
	}
	
	// 
	@RequestMapping("/cusUpdateInfo.nmj")
	public String updateInfo(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new CommandCustomerTest().execute(model);
		return "/customer/cusUpdateInfo";
	}
	
}

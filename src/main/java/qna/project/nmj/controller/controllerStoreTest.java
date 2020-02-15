package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.command.CommandStoreTest;

@Controller
@RequestMapping("/store")
public class controllerStoreTest {
	
	@RequestMapping("/storeGeneralSettings.nmj")
	public String storeGeneralSettings(int store_uid, Model model) {
		model.addAttribute("store_uid", store_uid);
		new CommandStoreTest().execute(model);
		return "/store/storeGeneralSettings";
	}
}

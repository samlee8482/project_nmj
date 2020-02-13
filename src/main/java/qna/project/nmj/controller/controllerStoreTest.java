package qna.project.nmj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class controllerStoreTest {
	@RequestMapping("/storeGeneralSettings.nmj")
	public String storeGeneralSettings() {
		
		return "/store/storeGeneralSettings";
	}
}

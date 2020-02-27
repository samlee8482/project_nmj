package qna.project.nmj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import qna.project.nmj.command.UserRegServiceCommand;

@Controller
public class AjaxUserRegController {
	@Autowired
	private UserRegServiceCommand reg_service;

		// id 중복 체크 컨트롤러
		@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
		@ResponseBody
		public int idCheck(@RequestParam("mb_id") String mb_id) {

			return reg_service.userIdCheck(mb_id);
		}
}

package qna.project.nmj.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.command.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		C.sqlSession = sqlSession;
	}
	
	private Command command;
	
	@RequestMapping("/adminMember.nmj")
	public String memberlist(Model model) {
		command = new AdminMemberListCommand();
		command.execute(model);
		return "admin/adminMember";	
	}
	
	@RequestMapping(value = "/adminSearchMember.nmj", method = RequestMethod.POST)
	public String memberSearchList(int searchOption, String search, Model model) {
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("search", search);
		command = new AdminMemberSearchListCommand();
		command.execute(model);
		return "admin/adminMember";	
	}
	
	@RequestMapping(value = "/deleteMember.nmj")
	public String deleteMember(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminMemberDeleteCommand().execute(model);
		return "admin/deleteMember";
	}
	
	@RequestMapping(value = "/deleteStoreMember.nmj")
	public String deleteStoreMember(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminMemberDeleteCommand().execute(model);
		return "admin/deleteStoreMember";
	}
	
	@RequestMapping("/adminStore.nmj")
	public String storeMemberlist(Model model) {
		command = new AdminStoreListCommand();
		command.execute(model);
		return "admin/adminStore";	
	}
	
	@RequestMapping(value = "/adminMemberInfo.nmj")
	public String MemberInfo(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminMemberInfoCommand().execute(model);
		return "admin/adminMemberInfo";
	}
	
	@RequestMapping(value = "/adminStoreInfo.nmj")
	public String StoreMemberInfo(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminStoreInfoCommand().execute(model);
		return "admin/adminStoreInfo";
	}
	
	@RequestMapping("/adminCommunity.nmj")
	public String communityList(Model model) {
		command = new AdminCommunityListCommand();
		command.execute(model);
		return "admin/adminCommunity";	
	}
	
	@RequestMapping(value = "/adminCommunityInfo.nmj")
	public String CommunityInfo(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new AdminCommunityInfoCommand().execute(model);
		return "admin/adminCommunityInfo";
	}
	
	@RequestMapping(value = "/deleteReview.nmj")
	public String deleteReview(int review_uid, Model model) {
		model.addAttribute("review_uid", review_uid);
		new AdminReviewDeleteCommand().execute(model);
		return "admin/deleteReview";
	}
	
	@RequestMapping("/adminCS.nmj")
	public String customerServiceList(Model model) {
		command = new AdminCSListCommand();
		command.execute(model);
		return "admin/adminCS";
	}
	
	@RequestMapping(value = "/adminCSreject.nmj")
	public String rejectCS(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminRejectCSCommand().execute(model);
		return "admin/rejectCS";
	}
	
	@RequestMapping(value = "/adminCSsolve.nmj")
	public String solveCS(int request_uid, Model model) {
		model.addAttribute("request_uid", request_uid);
		new AdminSolveCSCommand().execute(model);
		return "admin/solveCS";
	}
	
	@RequestMapping(value = "/adminStoreRQ.nmj")
	public String acceptStore(int store_uid, Model model) {
		model.addAttribute("store_uid", store_uid);
		new AdminStoreAcceptCommand().execute(model);
		return "admin/adminStoreRQ";
	}
	
	@RequestMapping(value = "/adminAccept.nmj")
	public String acceptStoreOk(int mb_uid, Model model) {
		model.addAttribute("mb_uid", mb_uid);
		new AdminStoreAcceptOkCommand().execute(model);
		return "admin/acceptStore";
	}

}

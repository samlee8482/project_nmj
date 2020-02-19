package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.CustomerDAO;

public class CusUpdateInfoOkCommand implements Command {

	@Override
	public void execute(Model model) {
		String mb_name = (String)model.getAttribute("mb_name");
		System.out.println("Command mb_name : " + mb_name);
		String mb_tel = (String)model.getAttribute("mb_tel");
		System.out.println("Command mb_tel : " + mb_tel);
		String mb_pw = (String)model.getAttribute("mb_pw");
		System.out.println("Command mb_pw : " + mb_pw);
		String mb_email = (String)model.getAttribute("mb_email");
		System.out.println("Command mb_email : " + mb_email);
		String mb_img_sav = (String)model.getAttribute("mb_img_sav");
		System.out.println("Command mb_img_sav : " + mb_img_sav);
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		System.out.println("Command mb_uid : " + mb_uid);
		
		CustomerDAO dao = C.sqlSession.getMapper(CustomerDAO.class);
		
		int cnt = 0;
		cnt = dao.updateMemberByUid(mb_name, mb_tel, mb_pw, mb_email, mb_img_sav, mb_uid);
		
		if(cnt == 1) {
			model.addAttribute("result", cnt);
		} else {
			model.addAttribute("result", cnt);
		}
		
	}

}

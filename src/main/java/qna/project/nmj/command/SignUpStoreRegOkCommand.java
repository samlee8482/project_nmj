package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.MemberDAO;

public class SignUpStoreRegOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		
		Map<String, Object> map = model.asMap();
		String store_name = (String)map.get("store_name");
		System.out.println("Command : " + store_name);
		String store_address = (String)map.get("store_address");
		System.out.println("Command : " + store_address);
		String store_regNum = (String)map.get("store_regNum");
		System.out.println("Command : " + store_regNum);
		String store_tel = (String)map.get("store_tel");
		System.out.println("Command : " + store_tel);
		String store_start = (String)map.get("store_start");
		System.out.println("Command : " + store_start);
		String store_end = (String)map.get("store_end");
		System.out.println("Command : " + store_end);
		String store_content = (String)map.get("store_content");
		System.out.println("Command : " + store_content);
		String store_type = (String)map.get("store_type");
		System.out.println("Command : " + store_type);
		String store_dtype = (String)map.get("store_dtype");
		System.out.println("Command : " + store_dtype);
		
		String store_hours = store_start + "~" + store_end;
		
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		cnt = dao.insertStore(store_name, store_address, store_regNum, store_type, store_dtype, store_tel, store_hours, store_content);
		
		model.addAttribute("result", cnt);
	}

}

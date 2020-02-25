package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReservationDTO;
import qna.project.nmj.beans.dao.CustomerDAO;

public class CusReserveOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		Map<String, Object> map = model.asMap();
		ReservationDTO dto = (ReservationDTO)map.get("dto");
		CustomerDAO dao = C.sqlSession.getMapper(CustomerDAO.class);
		cnt = dao.insertReservation(dto);
		
		model.addAttribute("result", cnt);
	}

}

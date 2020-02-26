package qna.project.nmj.command;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.dao.MemberDAO;

@Service
public class UserRegServiceCommand{

	@Autowired
	private SqlSessionTemplate userSqlSessin;
	private MemberDAO dao;

	// 중복 아이디 체크
	public int userIdCheck(String mb_id) {

		dao = userSqlSessin.getMapper(MemberDAO.class);

		return dao.checkOverId(mb_id);
	}
	
}

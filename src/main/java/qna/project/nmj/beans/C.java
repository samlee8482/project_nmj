package  qna.project.nmj.beans;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;

public class C {
	//MyBatis용 SqlSession
	public static SqlSession sqlSession;
	
	public static ServletContext context;
}

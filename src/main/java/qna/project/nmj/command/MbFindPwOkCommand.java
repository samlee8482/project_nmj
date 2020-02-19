package qna.project.nmj.command;

import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.MemberDTO;
import qna.project.nmj.beans.dao.MemberDAO;

public class MbFindPwOkCommand implements Command {

	@Override
	public void execute(Model model) {
		MemberDTO dto = null;
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		Map<String, Object> map = model.asMap();
		
		String mb_id = (String)map.get("mb_id");
		System.out.println("Command mb_id : " + mb_id);
		String mb_name = (String)map.get("mb_name");
		System.out.println("Command mb_name : " + mb_name);
		String mb_email = (String)map.get("mb_email");
		System.out.println("Command mb_email : " + mb_email);
//		String mb_id = (String)model.getAttribute("mb_name");
//		String mb_name = (String)model.getAttribute("mb_name");
//		String mb_email = (String)model.getAttribute("mb_email");    

		final String SMTP_USERNAME = "wkrud94@naver.com";
		final String SMTP_PASSWORD = "npw794613!";
		String HOST = "smtp.naver.com";
		//int PORT = 587;

		Properties props = new Properties();   
		props.put("mail.smtp.host", HOST); 
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
			}   
		});
		
		try {
			dto = dao.selectPw(mb_id, mb_name, mb_email);
			int result = 0;
	        if(dto != null) {
	        	result++;
	        	
				// 메일 보내기
				String TO = dto.getMb_email();
				//String FROM = "itmoa@itmoa.com";
				
			   MimeMessage message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(SMTP_USERNAME));
			   message.addRecipient(Message.RecipientType.TO, new InternetAddress(TO));
	
			   
			   // 메일 제목
			   message.setSubject("[놀먹자] 비밀번호 안내입니다.");
			   
			   // 메일 내용
			   message.setText("놀먹자를 이용해주셔서 감사합니다.\n" + dto.getMb_name() + " 고객님의 비밀번호는 " + dto.getMb_pw() + "입니다.");
	
			   System.out.println("Sending...");
			   
			   // send the message
			   Transport.send(message);
			   System.out.println("message sent successfully...");
				
	           System.out.println("Email sent!");
	       
           } else {
        	   result = 0;
           }
           
           model.addAttribute("findPwOk", result);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

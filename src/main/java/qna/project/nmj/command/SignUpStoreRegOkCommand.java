package qna.project.nmj.command;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.StoreDTO;
import qna.project.nmj.beans.dao.MemberDAO;

public class SignUpStoreRegOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		
		boolean existFile = false;
		
		Map<String, Object> map = model.asMap();
		StoreDTO dto = (StoreDTO)map.get("dto");
		MultipartFile upload = (MultipartFile) map.get("upload");
		
		// 2. 이미지 파일 저장할 경로 만들기
		ServletContext context = C.context;
		String saveDirectory = context.getRealPath("img/store");
		
		// 3. 파일 있을 때와 없을 때 처리
		if(upload.getOriginalFilename() == "" || upload.getOriginalFilename() == null) {
			System.out.println("no file");
		} else {
			// 4. 확장자 체크 image/jpg, image/jpeg, image/png, image/gif
			String contentType = upload.getContentType();
			if(contentType.equals("image/jpg") || contentType.equals("image/jpeg") || contentType.equals("image/png") || contentType.equals("image/gif")) {
				// 5. 파일 경로 지정
				File saveFile = new File(saveDirectory, upload.getOriginalFilename());
				try {
					// 6. 지정된 경로에 파일 저장
					upload.transferTo(saveFile);
					existFile = true; //파일 저장 후 파일 첨부 여부 true로 바꿈
					dto.setStore_regImg_org(upload.getOriginalFilename()); //파일 원본명
					dto.setStore_regImg_sav(upload.getOriginalFilename()); //파일 저장명
				} catch (Exception e) {
					e.printStackTrace();
					cnt = 500; // 500 : 파일 저장 실패
					model.addAttribute("cnt", cnt);
					return;
				}
			} else {
				System.out.println("not an image file");
				cnt = 101; // 101 : 이미지가 아닌 다른 파일을 업로드 할 경우
				model.addAttribute("cnt", cnt);
				return;
			}
		}
		
//		String store_name = (String)map.get("store_name");
//		System.out.println("Command store_name : " + store_name);
//		int mb_uid = (Integer)map.get("mb_uid");
//		System.out.println("Command mb_uid : " + mb_uid);
//		String store_address = (String)map.get("store_address");
//		System.out.println("Command store_address : " + store_address);
//		String store_regNum = (String)map.get("store_regNum");
//		System.out.println("Command store_regNum : " + store_regNum);
//		String store_tel = (String)map.get("store_tel");
//		System.out.println("Command store_tel : " + store_tel);
//		String store_start = (String)map.get("store_start");
//		System.out.println("Command store_start : " + store_start);
//		String store_end = (String)map.get("store_end");
//		System.out.println("Command store_end : " + store_end);
//		String store_content = (String)map.get("store_content");
//		System.out.println("Command store_content : " + store_content);
//		int store_type = (Integer)map.get("store_type");
//		System.out.println("Command store_type : " + store_type);
//		int store_dtype = (Integer)map.get("store_dtype");
//		System.out.println("Command store_dtype : " + store_dtype);
		
		String store_hours = dto.getStore_start() + "~" + dto.getStore_end();
		dto.setStore_hours(store_hours);
		
		MemberDAO dao = C.sqlSession.getMapper(MemberDAO.class);
		
		cnt = dao.insertStore(dto);
		
		model.addAttribute("result", cnt);
	}

}

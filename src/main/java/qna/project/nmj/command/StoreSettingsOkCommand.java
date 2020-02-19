package qna.project.nmj.command;

import javax.servlet.ServletContext;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;

public class StoreSettingsOkCommand implements Command {

	@Override
	public void execute(Model model) {
		ServletContext context = C.context;
		String saveDirectory = context.getRealPath("img/store");
		
		int maxPostSize = 5 * 1024 * 1024;
	}

}

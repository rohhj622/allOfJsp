package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Main implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
//		return "mainPage";
		
		return "menu";
	}

}

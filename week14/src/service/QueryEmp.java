package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QueryEmp implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "queryEmpProc";
	}

}

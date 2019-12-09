package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetAllPropertiesRule;

import Model.Emp;
import dao.EmpDao;

public class QueryEmpProc implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		EmpDao empDao = EmpDao.getInstance();
		
		List<Emp> list = empDao.list();
		request.setAttribute("list", list);
		
		return "queryEmpResult";
	}

}

package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetAllPropertiesRule;

import dao.DiaryDao;
import model.Diary;

public class QueryDiaryProc implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		DiaryDao diaryDao = DiaryDao.getInstance();
		
		List<Diary> list = diaryDao.list();
		request.setAttribute("list", list);
		
		return "queryDiaryResult";
	}

}

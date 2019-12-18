package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetAllPropertiesRule;

import dao.MusicDao;
import model.Music;

public class QueryMusicProc implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		MusicDao musicDao = MusicDao.getInstance();
		
		List<Music> list = musicDao.list();
		request.setAttribute("list", list);
		
		return "queryMusicResult";
	}

}

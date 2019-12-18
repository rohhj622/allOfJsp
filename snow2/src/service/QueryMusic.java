package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetAllPropertiesRule;

import dao.MusicDao;
import model.Music;

public class QueryMusic implements CommandHandler{

	@Override

	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "queryMusicProc";
	}

}

package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetAllPropertiesRule;

import dao.MovieDao;
import model.Movie;

public class QueryMovie implements CommandHandler{

	@Override

	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "queryMovieProc";
	}

}

package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetAllPropertiesRule;

import dao.PlaceDao;
import model.Place;

public class QueryPlace implements CommandHandler{

	@Override

	public String process(HttpServletRequest request, HttpServletResponse response) {
		return "queryPlaceProc";
	}

}

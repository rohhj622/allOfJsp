package controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandHandler;

@WebServlet(urlPatterns = "*.do",
            initParams = {@WebInitParam(name="configFile",
                          value="/WEB-INF/commandHandler.properties")})
public class ControllerUsingFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	//<Ŀ�ǵ�, �ڵ鷯 �ν��Ͻ�> �������� ����
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

	//������ �����ϰ� �ʱ�ȭ �� �� ȣ��Ǵ� init() �޼���
    public void init() throws ServletException {
    	String configFile = getInitParameter("configFile"); //web.xml
    	Properties prop = new Properties();
    	
    	String configFilePath = getServletContext().getRealPath(configFile);
    	
    	try (FileReader fis = new FileReader(configFilePath)) {
    		prop.load(fis);
    	} catch (Exception e) {
			throw new ServletException(e);
		}
    	
    	//�Ӽ� ���� �ϳ��� �о Ű��(���ϸ�)�� ������� �ڵ鷯���� �ʿ� ����
    	Iterator<Object> keyIter = prop.keySet().iterator();
    	
    	while(keyIter.hasNext()) {
    		String command = (String) keyIter.next();
    		String handlerClassName = prop.getProperty(command);
    		
    		try {
    			Class<?> handlerClass = Class.forName(handlerClassName);
    			CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
    			
    			commandHandlerMap.put(command, handlerInstance);
    			
    		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
    			throw new ServletException(e);
			}
    	}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String command = request.getRequestURI(); // command = "/week14/main.do"
		command = command.substring(request.getContextPath().length()+1); //contextPath = /week14
		                                                                  //command = "main.do"
		
		CommandHandler handler = commandHandlerMap.get(command);
		
		String viewPage = null;
		
		try {
			viewPage = handler.process(request,  response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage+".jsp");
		    dispatcher.forward(request, response);
		}
	}
}

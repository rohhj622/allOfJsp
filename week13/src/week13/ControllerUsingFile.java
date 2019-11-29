package week13;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerUsingFile
 */
@WebServlet("/ControllerUsingFile")
public class ControllerUsingFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//<커맨드,핸들러인스턴스> 매핑정보 저장 
    private Map<String ,CommandHandler> commandHandlerMap = 
    		new HashMap<>();
    
    public void init() throws ServletException {
    	String configFile = getInitParameter("configFile");
    	Properties prop = new Properties();
    	String configFilePath = getServletContext().getRealPath(configFile);
    	
    	try(FileReader fr = new FileReader(configFilePath)) {
    		prop.load(fr);
    	}catch(IOException e) {
    		throw new ServletException(e);
    	}
    	
    	//속성 파일을 하나씩 읽어서 키값(파일명)과 실행명령 핸들러명을 맵에 저장
    	Iterator<Object> keyIter = prop.keySet().iterator();
    	
    	while(keyIter.hasNext()) {
    		String command = (String)keyIter.next();
    		String handlerClassName = prop.getProperty(command);
    		try {
    			Class<?> handlerClass = Class.forName(handlerClassName);
    			CommandHandler handlerInstance =(CommandHandler)handlerClass.newInstance();
    			
    			commandHandlerMap.put(command, handlerInstance);
    			
    		}catch(ClassNotFoundException|InstantiationException|IllegalAccessException e) {
    			throw new ServletException(e);
    		}
    	}
    }
    public ControllerUsingFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}
	
	

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String command = request.getParameter("cmd");
		
		CommandHandler handler = commandHandlerMap.get(command);
		String viewPage=null;
		
		try {
			viewPage = handler.process(request,response);
		}catch(Exception e) {
			throw new ServletException();
		}
		
		if(viewPage!=null) {
			RequestDispatcher dispatcher =request.getRequestDispatcher(viewPage);
			
			dispatcher.forward(request, response);
		}
	}

}

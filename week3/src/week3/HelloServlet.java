package week3;
 //처음에 servlet 안되어있으니 오른쪽 눌러서 buildpath 3번째에 library 추가 tomcat!

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 * servlet은 자바로 생성됨.
 */
@WebServlet("/HelloServlet") // 자동으로 맵핑시켜주는 것. web.xml 안해도 되는 이유 

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public HelloServlet() {
        // TODO Auto-generated constructor stub - 생성자 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 기본으로 주는 코드 response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h1>Hello Servlet!</h1>");
		out.println("</body></html>");
		out.close();
		// JAVA코드 안에 html 삽입 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	// doPost 보안성 구웃 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package week3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Address
 */
@WebServlet("/Address") // WebServlet annnotation URL mapping, important secure
public class Address extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Address() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=utf-8"); //응답할페이지 형식은 html이고,charset은 utf-8
		
		//servlet do not decide char type.
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		PrintWriter out = response.getWriter();
		
		out.println("<html><body><h1>");
		out.println(name +"님은 " + addr + "에 사시는 군요!</h1>");
		out.println("</html></body>");
		out.close();
		
		//out.println -> 웹에 뿌리기 
		//system.out.println  -> 콘솔에 뿌리기 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		response.setContentType("test/html; cahrset=utf-8"); //응답할페이지 형식은 html이고,charset은 utf-8
//		
//		String name = request.getParameter("name");
//		String addr = request.getParameter("addr");
//		
//		PrintWriter out = response.getWriter();
//		out.println("<html><body><h1>");
//		out.println(name +"님은" + addr + "에 사시는 군요!</h1>");
//		out.println("</html></body>");
//		out.close();
		request.setCharacterEncoding("utf-8");
		doGet(request,response);
	}

}

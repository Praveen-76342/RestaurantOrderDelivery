

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminAuthenticate
 */
@WebServlet("/AdminAuthenticate")
public class AdminAuthenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAuthenticate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Manager_Authentication manauth=new Manager_Authentication();
		boolean b = manauth.Authentication(username, password);
		int admin_id = manauth.managerID(username, password);
		if(b)
		{
			System.out.println(admin_id);
			HttpSession session=request.getSession();
			session.setAttribute("admin_id", admin_id);
			
			RequestDispatcher view=request.getRequestDispatcher("AdminSection.jsp");
			view.forward(request, response);
		}
		
		out.println("</body>");
		out.println("</html>");
	}

}

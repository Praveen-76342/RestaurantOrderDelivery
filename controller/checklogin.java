

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
 * Servlet implementation class checklogin
 */
@WebServlet("/checklogin")
public class checklogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checklogin() {
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
		{
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		String Username=request.getParameter("User");
		String Password=request.getParameter("npass");
		System.out.println(Username);
		System.out.println(Password);
		Check_Login  ckl = new Check_Login();
		int cust_id=ckl.cust_id(Username, Password);
		 boolean b = ckl.check(Username, Password);
		if(b)
		{
			HttpSession session=request.getSession();
			session.setAttribute("cust_id", cust_id);
			
			RequestDispatcher view=request.getRequestDispatcher("customer_home.jsp");
			view.forward(request, response);
		}
		else
		{
			out.println("Invalid Username or Password");
			RequestDispatcher view=request.getRequestDispatcher("Clogin.jsp");
			view.forward(request, response);
		}
		out.println("</body>");
		out.println("</html>");
	}
	}

}

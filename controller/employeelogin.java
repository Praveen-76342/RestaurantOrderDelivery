

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
 * Servlet implementation class employeelogin
 */
@WebServlet("/employeelogin")
public class employeelogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public employeelogin() {
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
		Employee_Login emp_log = new Employee_Login();
		boolean b = emp_log.empLogin(username, password);
		int emp_id= emp_log.getEmpId(username, password);
		if(b)
		{
			HttpSession session=request.getSession();
			session.setAttribute("emp_id", emp_id);
			
			RequestDispatcher view=request.getRequestDispatcher("emp_home.jsp");
			view.forward(request, response);
		}
		
		
		out.println("</body>");
		out.println("</html>");
	}
	}

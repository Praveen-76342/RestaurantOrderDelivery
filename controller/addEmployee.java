

import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addEmployee
 */
@WebServlet("/addEmployee")
public class addEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addEmployee() {
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
		double phno=Double.parseDouble(request.getParameter("phno"));
		String username=request.getParameter("username");
		String fname=request.getParameter("name");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String NewPass=request.getParameter("npass");
		String RePass=request.getParameter("rpass");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		
		Add_Employee addemp = new Add_Employee();
		boolean b = addemp.AddEmployee(fname, age, NewPass, RePass, email, gender, address, username, phno);
		System.out.println(b);
		if(b)
		{
			out.println("Registered");
			RequestDispatcher view=request.getRequestDispatcher("AdminSection.jsp");
			view.include(request, response);
		
		}
		else {RequestDispatcher view=request.getRequestDispatcher("addEmployee.jsp");
		view.include(request, response);
		}
		out.println("</body>");
		out.println("</html>");
	}

}

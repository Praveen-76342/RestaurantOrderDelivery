

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
 * Servlet implementation class Remove_Account
 */
@WebServlet("/removeaccount")
public class Remove_Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Remove_Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		HttpSession session =request.getSession();
		int cust_id=(Integer)session.getAttribute("cust_id");
		System.out.println(cust_id);
		Customersection cs = new CustomerImpl();
		Customer cust = new Customer();
		cust.setCust_id(cust_id);
		boolean b = cs.removeCustomer(cust);
		System.out.println(b);
		if(b)
		{
			out.println("you have deleted your account! SORRY to loose you.");
			RequestDispatcher view=request.getRequestDispatcher("Home.jsp");
			view.include(request, response);
		}
		else {
			out.println("Something went wrong!! please try again");
			RequestDispatcher view = request.getRequestDispatcher("customer_home.jsp");
			view.forward(request, response);
		}
		out.println("</body>");
		out.println("</html>");
	}

}

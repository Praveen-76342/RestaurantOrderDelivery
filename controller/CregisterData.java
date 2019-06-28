
import java.util.Random;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CregisterData
 */
@WebServlet("/CregisterData")
public class CregisterData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CregisterData() {
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
		Random rn= new Random();
		int y= rn.nextInt(10000);
		Customersection customer = new CustomerImpl();
		Customer cust  = new Customer();
		cust.setAddress(request.getParameter("address"));
		cust.setCust_id(y);
		cust.setCust_name(request.getParameter("Fname"));
		cust.setEmail(request.getParameter("email"));
		cust.setPassword(request.getParameter("npass"));
		cust.setPhonenumber(Double.parseDouble(request.getParameter("phno")));
		cust.setUsername(request.getParameter("User"));
		int cust_id = customer.addCustomer(cust);
		System.out.println(cust_id);
		if(cust_id>0)
		{
			out.println("Registered");
			RequestDispatcher view=request.getRequestDispatcher("Clogin.jsp");
			view.include(request, response);
		}
		else {
			out.println("not registered plz try again!!");
			System.out.println("kudisindi");
			RequestDispatcher view=request.getRequestDispatcher("Cregister.jsp");
			view.include(request, response);
		}
		out.println("</body>");
		out.println("</html>");
	}

}

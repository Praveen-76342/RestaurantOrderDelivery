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
 * Servlet implementation class brcheckout
 */
@WebServlet("/brcheckout")
public class brcheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public brcheckout() {
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
		String names[]=request.getParameterValues("names");
		String cost[]=request.getParameterValues("num");
		HttpSession session=request.getSession();
		int cust_id=(Integer)session.getAttribute("cust_id");
		Breakfast_Checkout brfchk = new Breakfast_Checkout();
		boolean b = brfchk.Checkout(names, cost, cust_id);
		if(b) {
			RequestDispatcher view=request.getRequestDispatcher("YourOrders.jsp");
			view.forward(request, response);
			System.out.println("done");
		}
		else {
			
		}
		
		out.println("</body>");
		out.println("</html>");
	}

}



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cancelorder
 */
@WebServlet("/cancelorder")
public class cancelorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelorder() {
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

		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        int order_id=Integer.parseInt(request.getParameter("ccust"));
        Emp_Cancel_Order eco =new Emp_Cancel_Order();
        boolean b=eco.EmpCancel(order_id);
        if(b)
        {
        	response.sendRedirect("PCOrders.jsp");
        }
        else
        {
        	out.println("cancelation could not be done! pls try again");
        	response.sendRedirect("PCOrders.jsp");
        	
        }
        out.println("</body>");
        out.println("</html>");
	}

}

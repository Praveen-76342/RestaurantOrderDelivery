

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		try {
			Connection con = DBConnect.connect();
		String Username=request.getParameter("User");
		String Password=request.getParameter("pass");
		String sql="Select * from cust_details where username=? and password=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, Username);
		ps.setString(2, Password);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			int cust_id=rs.getInt(5);
			System.out.println(cust_id);
			HttpSession session=request.getSession();
			session.setAttribute("cust_id", cust_id);
			
			RequestDispatcher view=request.getRequestDispatcher("customer_home.jsp");
			view.forward(request, response);
		}
		con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		out.println("</body>");
		out.println("</html>");
	}
	}

}


import java.sql.*;
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
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		try {
			Connection con = DBConnect.connect();
		double phno=Double.parseDouble(request.getParameter("phno"));
		String Username=request.getParameter("User");
		String NewPass=request.getParameter("npass");
		String RePass=request.getParameter("rpass");
		String email=request.getParameter("email");
		String Fname=request.getParameter("Fname");
		String address=request.getParameter("address");
		if(NewPass.equals(RePass))
		{
			Random rn= new Random();
			int y= rn.nextInt(10000);
			String sql="Insert into cust_details values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, Username);
			ps.setString(2, NewPass);
			ps.setDouble(3, phno);
			ps.setString(4, email);
			ps.setInt(5, y);
			ps.setString(6, Fname);
			ps.setString(7, address);
			ps.executeUpdate();
			out.println("Registered");
			RequestDispatcher view=request.getRequestDispatcher("Clogin.jsp");
			view.include(request, response);
			out.println("Registered");
			
		}
		else
		{
		out.println("Invalid Data");
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



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		try {
			Connection con = DBConnect.connect();
		double phno=Double.parseDouble(request.getParameter("phno"));
		String Username=request.getParameter("User");
		String NewPass=request.getParameter("npass");
		String RePass=request.getParameter("rpass");
		String email=request.getParameter("email");
		if(NewPass.equals(RePass))
		{
			Random rn= new Random();
			int y= rn.nextInt(10000);
			String sql="Insert into cust_details values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, Username);
			ps.setString(2, NewPass);
			ps.setDouble(3, phno);
			ps.setString(4, email);
			ps.setInt(5, y);
			ps.executeUpdate();
			out.println("Registered");
			RequestDispatcher view=request.getRequestDispatcher("Clogin.jsp");
			view.include(request, response);
			out.println("Registered");
			
		}
		else
		{
		out.println("Invalid Data");
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

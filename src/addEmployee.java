

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

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
		try {
			Connection con = DBConnect.connect();
		double phno=Double.parseDouble(request.getParameter("phno"));
		String Username=request.getParameter("username");
		String fname=request.getParameter("name");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String NewPass=request.getParameter("npass");
		String RePass=request.getParameter("rpass");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		if(NewPass.equals(RePass))
		{
			Random rn= new Random();
			int y= rn.nextInt(10000);
			String sql="Insert into emp_details values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, y);
			ps.setString(2, fname);
			ps.setInt(3, age);
			ps.setString(4, NewPass);
			ps.setString(5, email);
			ps.setString(6, gender);
			ps.setString(7, address);
			ps.setString(8, Username);
			ps.setDouble(9, phno);
			ps.executeUpdate();
			out.println("Registered");
			RequestDispatcher view=request.getRequestDispatcher("AdminSection.jsp");
			view.include(request, response);
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

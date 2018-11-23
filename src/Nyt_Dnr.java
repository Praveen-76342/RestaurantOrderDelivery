

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Nyt_Dnr
 */
@WebServlet("/Nyt_Dnr")
public class Nyt_Dnr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Nyt_Dnr() {
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
		PrintWriter pw = response.getWriter();
		String id = request.getParameter("id");
		int price=Integer.parseInt(request.getParameter("new_price"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		
			String url="jdbc:mysql://localhost:3306/restaurant";
			String user="root";
			String pass="1234";
			
			Connection con=DriverManager.getConnection(url,user,pass);
			String sql="update dinner set cost=? where dinid=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,price);
			ps.setString(2, id);
			ps.executeUpdate();
			
		con.close();
			System.out.println("saava denga");
			RequestDispatcher view=request.getRequestDispatcher("Nyt_Dnr.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("dengi poindi");
			e.printStackTrace();
		}
	}

}

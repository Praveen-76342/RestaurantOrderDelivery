

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

/**
 * Servlet implementation class Morn_brkfst
 */
@WebServlet("/Morn_brkfast")
public class Morn_brkfst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Morn_brkfst() {
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
			Connection con=DBConnect.connect();
			String sql="update breakfast set cost=? where brfid=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,price);
			ps.setString(2, id);
			ps.executeUpdate();
			
			
		con.close();
			System.out.println("saava denga");
			RequestDispatcher view=request.getRequestDispatcher("Morn_brkfst.jsp");
			view.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("dengi poindi");
			e.printStackTrace();
		}
		
	}

}

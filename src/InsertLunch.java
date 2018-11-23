

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
 * Servlet implementation class InsertLunch
 */
@WebServlet("/InsertLunch")
public class InsertLunch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLunch() {
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
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");		
		String url="jdbc:mysql://localhost:3306/restaurant";
		String user="root";
		String pass="1234";
		
		Connection con=DriverManager.getConnection(url,user,pass);
		int cost=Integer.parseInt(request.getParameter("cost"));
		String name=request.getParameter("lname");
		String id=request.getParameter("id");
			String sql="Insert into lunch values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, cost);
			ps.setString(3, id);
			ps.executeUpdate();
			out.println("Inserted");
			RequestDispatcher view=request.getRequestDispatcher("InsertLunch.jsp");
			view.forward(request, response);



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



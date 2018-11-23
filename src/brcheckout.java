import java.util.Random;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;

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
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<body>");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");		
			String url="jdbc:mysql://localhost:3306/restaurant";
			String user="root";
			String pass="1234";
			Connection con=DriverManager.getConnection(url,user,pass);
			
			String names[]=request.getParameterValues("names");
			int var=0;
			for(int i=0;i<names.length;i++)
			{
				System.out.println(names[i]);
				var++;
			}
			String cost[]=request.getParameterValues("num");
			Random rn=new Random();
			int x= rn.nextInt(100000);
			for(int i=0;i<names.length;i++)
			{
				HttpSession session=request.getSession();
				int cust_id=(Integer)session.getAttribute("cust_id");
				String item=names[i];
				Connection con1=DBConnect.connect();
				String sql="Select cost from breakfast where brfname=?";
				PreparedStatement ps=con1.prepareStatement(sql);
				ps.setString(1, names[i]);
				ResultSet rs1=ps.executeQuery();
				int price=0;
				
				while(rs1.next()) {
					price=rs1.getInt(1);
				}
				System.out.println(price);
				int tot_price=price*(Integer.valueOf(cost[i]));
				
				System.out.println(tot_price);
				String sqli="Insert into cust_orders values(?,?,?,?,?)";
				PreparedStatement psi=con1.prepareStatement(sqli);
				psi.setInt(1, cust_id);
				psi.setString(2, names[i]);
				psi.setInt(3, Integer.valueOf(cost[i]));
				psi.setInt(4, tot_price);
				psi.setInt(5, x);
				psi.executeUpdate();
				con1.close();
				
			}
			System.out.println("done");
			RequestDispatcher view=request.getRequestDispatcher("YourOrders.jsp");
			view.forward(request, response);
		}
		
		catch(Exception e) {
			
		}
		
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
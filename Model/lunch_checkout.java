

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class lunch_checkout
 */
@WebServlet("/lunch_checkout")
public class lunch_checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lunch_checkout() {
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
			String names[]=request.getParameterValues("names");
			String cost[]=request.getParameterValues("num");
			Random rn=new Random();
			int x= rn.nextInt(100000);
			for(int i=0;i<names.length;i++)
			{
				HttpSession session=request.getSession();
				int cust_id=(Integer)session.getAttribute("cust_id");
				Connection con1=DBConnect.connect();
				String sql="Select cost from lunch where lname=?";
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

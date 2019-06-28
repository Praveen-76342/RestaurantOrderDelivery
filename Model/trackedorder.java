

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class trackedorder
 */
@WebServlet("/trackedorder")
public class trackedorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trackedorder() {
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
			int order_id=Integer.parseInt(request.getParameter("order_id"));
		String sql1="Select * from cust_orders where order_id=?";
		PreparedStatement ps1=con.prepareStatement(sql1);
		ps1.setInt(1, order_id);
		ResultSet rs1=ps1.executeQuery();
		if(rs1.next())
		{	
			String str="your order hasn't been placed";
			System.out.println(str);
			request.setAttribute("str",str);
			RequestDispatcher view=request.getRequestDispatcher("trackedorder.jsp");
			view.forward(request, response);
		}
		String sql2="Select * from placed_orders where order_id=?";
		PreparedStatement ps2=con.prepareStatement(sql2);
		ps2.setInt(1, order_id);
		ResultSet rs2=ps2.executeQuery();
		if(rs2.next())
		{	
			String str="your order has been placed";
			System.out.println(str);
			request.setAttribute("str",str);
			RequestDispatcher view=request.getRequestDispatcher("trackedorder.jsp");
			view.forward(request, response);
		}
		String sql3="Select * from delivery_table where order_id=?";
		PreparedStatement ps3=con.prepareStatement(sql3);
		ps3.setInt(1, order_id);
		ResultSet rs3=ps3.executeQuery();
		if(rs3.next())
		{	
			String str="your order will be delivered within 30 minutes";
			System.out.println(str);
			request.setAttribute("str",str);
			RequestDispatcher view=request.getRequestDispatcher("trackedorder.jsp");
			view.forward(request, response);
		}
		String sql4="Select * from canceled_orders where order_id=?";
		PreparedStatement ps4=con.prepareStatement(sql4);
		ps4.setInt(1, order_id);
		ResultSet rs4=ps4.executeQuery();
		if(rs4.next())
		{	
			String str="your order is cancelled";
			System.out.println(str);
			request.setAttribute("str",str);		
			RequestDispatcher view=request.getRequestDispatcher("trackedorder.jsp");
			view.forward(request, response);
		}
		String sql5="Select * from delivered_table where order_id=?";
		PreparedStatement ps5=con.prepareStatement(sql5);
		ps5.setInt(1, order_id);
		ResultSet rs5=ps5.executeQuery();
		if(rs5.next())
		{	
			String str="your order is delivered";
			System.out.println(str);
			request.setAttribute("str",str);		
			RequestDispatcher view=request.getRequestDispatcher("trackedorder.jsp");
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



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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class confirmDelivery
 */
@WebServlet("/confirmDelivery")
public class confirmDelivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmDelivery() {
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
        try{
           
        	Connection con=DBConnect.connect();

        	int order_id=Integer.parseInt(request.getParameter("order_id"));
        	
                    String sql="Select * from delivery_table where order_id=?";
                    HttpSession session = request.getSession();
                    int empid=(Integer)session.getAttribute("emp_id");     
                    PreparedStatement ps=con.prepareStatement(sql);
                    ps.setInt(1, order_id);
                    ResultSet rs = ps.executeQuery();
                    String cpass=request.getParameter("cpass");
                    String epass=request.getParameter("epass");
                    while(rs.next())
                    {
                    int custid=rs.getInt(1);
                    String itemname=rs.getString(2);
                    int no_of_plates=rs.getInt(3);
                    int totalcost=rs.getInt(4);
                    
                    String sql1="select password from cust_details where cust_id=?";
                    PreparedStatement ps1=con.prepareStatement(sql1);
                    ps1.setInt(1,custid);
                    ResultSet rs1 = ps1.executeQuery();
                    String cust_pass="";
                    String emp_pass="";
                    while(rs1.next())
                    {
                    	cust_pass=rs1.getString(1);
                    }
                    String sql2="select password from emp_details where emp_id=?";
                    PreparedStatement ps2=con.prepareStatement(sql2);
                    ps2.setInt(1,empid);
                    ResultSet rs2 = ps2.executeQuery();
                    while(rs2.next())
                    {
                    	emp_pass=rs2.getString(1);
                    }
                    if(cpass.equals(cust_pass) && epass.equals(emp_pass))
                    {
                         String sql4="Insert into delivered_table values(?,?,?,?,?,?)";
                         PreparedStatement ps4=con.prepareStatement(sql4);
                         ps4.setInt(1, custid);
                         ps4.setString(2, itemname);
                         ps4.setInt(3, no_of_plates);
                         ps4.setInt(4, totalcost);
                         ps4.setInt(5, order_id);
                         ps4.setInt(6, empid);
                         ps4.executeUpdate();

                         
                         String sql3="delete  from delivery_table where order_id=?";
                         PreparedStatement ps3=con.prepareStatement(sql3);
                         ps3.setInt(1, order_id);
                         ps3.executeUpdate();
                    }
                    }
                    System.out.println("delivered");
                    RequestDispatcher view=request.getRequestDispatcher("emp_home.jsp");
        			view.forward(request, response);
                    con.close();
        }
        catch(Exception e)
        {
           e.printStackTrace();
        }
        out.println("</body>");
        out.println("</html>");
	}

}

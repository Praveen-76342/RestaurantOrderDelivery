import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class placeorder
 */
@WebServlet("/placeorder")
public class placeorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public placeorder() {
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

        	int order_id=Integer.parseInt(request.getParameter("pcust"));
        	
                    String sql="Select * from cust_orders where order_id=?";
     
                    PreparedStatement ps=con.prepareStatement(sql);
                    ps.setInt(1, order_id);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next())
                    {
                    int x = 0;
                    int y =0;
                    String one = new String();
                    int a=0;
                    int b=0;
                    
                    
                        x=rs.getInt(1);
                        one=rs.getString(2);
                        a=rs.getInt(3);        
                        y=rs.getInt(4);
                        b=rs.getInt(5);

                    

                    String sql1="delete  from cust_orders where item_name=?";
                    PreparedStatement ps1=con.prepareStatement(sql1);
                    ps1.setString(1, one);
                    ps1.executeUpdate();
                    

                    String sql2="Insert into placed_orders values(?,?,?,?,?)";
                    PreparedStatement ps2=con.prepareStatement(sql2);
                    
                    ps2.setInt(1, x);
                    ps2.setString(2, one);
                    ps2.setInt(3, a);
                    ps2.setInt(4, y);
                    ps2.setInt(5, b);
                    ps2.executeUpdate();
                    }
response.sendRedirect("PCOrders.jsp");
        }
        catch(Exception e)
        {
           e.printStackTrace();
        }
        out.println("</body>");
        out.println("</html>");
	}

}



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class sendDelivery
 */
@WebServlet("/sendDelivery")
public class sendDelivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendDelivery() {
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
		String orders[]=request.getParameterValues("order_id");
		int x=0;
		for(int i=0;i<orders.length;i++)
		{
			x++;
			System.out.println(orders[i]);
			}
		int orderid[] = new int[x];
		for(int i=0;i<orders.length;i++)
		{
		orderid[i] = Integer.parseInt(orders[i]);
		}
		System.out.println("1");
		for(int i=0;i<orderid.length;i++)
		{
			try {
				Connection con = DBConnect.connect();
			String sql="Select * from placed_orders where order_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, orderid[i]);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String sql1="insert into delivery_table values(?,?,?,?,?)";
				PreparedStatement ps1 = con.prepareStatement(sql1);
				ps1.setInt(1,rs.getInt(1));
				ps1.setString(2, rs.getString(2));
				ps1.setInt(3,rs.getInt(3));
				ps1.setInt(4,rs.getInt(4));
				ps1.setInt(5,rs.getInt(5));
				ps1.executeUpdate();
			}
			String sql1="delete from placed_orders where order_id=?";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setInt(1,orderid[i]);
			ps1.executeUpdate();
			request.getRequestDispatcher("emp_home.jsp");
			con.close();
			}
	
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			System.out.println("vongo petta");
		}
	}

}

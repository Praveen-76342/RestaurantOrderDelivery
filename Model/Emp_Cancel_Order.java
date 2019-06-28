import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Emp_Cancel_Order {
public boolean EmpCancel(int order_id)
{
	boolean b = false;
	 try{
         Connection con = DBConnect.connect();
			String sql="Select * from cust_orders where order_id=?";
         PreparedStatement ps=con.prepareStatement(sql);
         ps.setInt(1, order_id);
         ResultSet rs = ps.executeQuery();
         while(rs.next())
         {
           int x=rs.getInt(1);
           String one=rs.getString(2);
           int a=rs.getInt(3);        
           int y=rs.getInt(4);
           int bb=rs.getInt(5);
         String sql1="delete  from cust_orders where item_name=?";
         PreparedStatement ps1=con.prepareStatement(sql1);
         ps1.setString(1, one);
         ps1.executeUpdate();
         String sql2="Insert into canceled_orders values(?,?,?,?,?)";
         PreparedStatement ps2=con.prepareStatement(sql2);
         ps2.setInt(1, x);
         ps2.setString(2, one);
         ps2.setInt(3, a);
         ps2.setInt(4, y);
         ps2.setInt(5, bb);
         ps2.executeUpdate();
         b=true;
         }

}
catch(Exception e)
{
e.printStackTrace();
}
	return b;
	
}
}

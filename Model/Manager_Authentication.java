import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class Manager_Authentication {
public boolean Authentication(String username,String password)
{
	boolean b = false;
	try {
		Connection con = DBConnect.connect();
	String sql="Select * from admin_details where username=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, password);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		b=true;
		
	}
	con.close();
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return b;
}
public int managerID(String username,String password)
{
	int admin_id=0;
	try {
		Connection con = DBConnect.connect();
	String sql="Select * from admin_details where username=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, password);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		 admin_id=rs.getInt(1);
		 System.out.println(admin_id);
	}
	con.close();
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return admin_id;
}
}

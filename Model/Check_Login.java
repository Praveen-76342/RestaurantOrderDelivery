import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class Check_Login {

	public int cust_id(String Username,String Password)
	{
		int cust_id=0;
		try {
			Connection con = DBConnect.connect();
		
		String sql="Select * from cust_details where username=? and password=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, Username);
		ps.setString(2, Password);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			cust_id=rs.getInt(5);
			System.out.println(cust_id);
			return cust_id;
		}
		else
		{
			System.out.println("Invalid Username or Password");
			
		}
		con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return cust_id;
	}
	
	public boolean check(String Username,String Password)
	{
		boolean b=false;
		try {
			Connection con = DBConnect.connect();
		
		String sql="Select * from cust_details where username=? and password=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, Username);
		ps.setString(2, Password);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
          b=true;			
		}
		else
		{
			System.out.println("Invalid Username or Password");
		}
		con.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return b;
	}
	
}

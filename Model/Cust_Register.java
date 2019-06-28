import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;
public class Cust_Register {
public boolean Register(double phno,String Username,String NewPass, String Repass,String email,String Fname,String address)
{
	boolean b=false;
	try {
		Connection con = DBConnect.connect();
		Random rn= new Random();
		int y= rn.nextInt(10000);
		String sql="Insert into cust_details values(?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, Username);
		ps.setString(2, NewPass);
		ps.setDouble(3, phno);
		ps.setString(4, email);
		ps.setInt(5, y);
		ps.setString(6, Fname);
		ps.setString(7, address);
		ps.executeUpdate();
		System.out.println("after ps");
		b=true;
		con.close();
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return b;
}
}

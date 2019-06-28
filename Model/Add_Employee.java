import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

public class Add_Employee {
public boolean AddEmployee(String fname,int age,String NewPass,String RePass,String email,String gender,String address,String username,Double phno)
{
	boolean b=false;
	try {
		Connection con = DBConnect.connect();
	if(NewPass.equals(RePass))
	{
		Random rn= new Random();
		int y= rn.nextInt(10000);
		String sql="Insert into emp_details values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, y);
		ps.setString(2, fname);
		ps.setInt(3, age);
		ps.setString(4, NewPass);
		ps.setString(5, email);
		ps.setString(6, gender);
		ps.setString(7, address);
		ps.setString(8, username);
		ps.setDouble(9, phno);
		ps.executeUpdate();
		b=true;
		}
	else
	{
	b=false;
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

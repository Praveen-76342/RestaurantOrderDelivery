import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class Employee_Login {
public boolean empLogin(String username,String password)
{
	boolean b = false;
	try {
		Connection con = DBConnect.connect();
	String sql="Select * from emp_details where username=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, password);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		b=true;
		int emp_id=rs.getInt(1);
		System.out.println(emp_id);
	}
	con.close();
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	System.out.println("hello world");
	return b;

}
public int getEmpId(String username,String password)
{
	int emp_id=0;
	try {
		Connection con = DBConnect.connect();
	String sql="Select * from emp_details where username=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, password);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		emp_id=rs.getInt(1);
		System.out.println(emp_id);
		return emp_id;
	}
	con.close();
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return emp_id;

}
}

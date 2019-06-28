import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
public class Night_Dinner {
public boolean Dinner(String id,int price)
{
	boolean b = false;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");		
		String url="jdbc:mysql://localhost:3306/restaurant";
		String user="root";
		String pass="1234";
		
		Connection con=DriverManager.getConnection(url,user,pass);
		String sql="update dinner set cost=? where dinid=? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,price);
		ps.setString(2, id);
		ps.executeUpdate();
		b=true;
	con.close();
		System.out.println("saava denga");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("dengi poindi");
		e.printStackTrace();
	}

	return b;
}
}

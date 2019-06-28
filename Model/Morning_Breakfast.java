import java.sql.Connection;
import java.sql.PreparedStatement;
public class Morning_Breakfast {
public boolean mornbreakfast(String id,int price)
{
	boolean b = false;
	try {
		Connection con=DBConnect.connect();
		String sql="update breakfast set cost=? where brfid=? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,price);
		ps.setString(2, id);
		ps.executeUpdate();
		b = true;
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

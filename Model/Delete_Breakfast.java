import java.sql.Connection;
import java.sql.PreparedStatement;
public class Delete_Breakfast {
public boolean Delete(String id)
{
	boolean b= false;
	try {
		Connection con=DBConnect.connect();
		String sql="delete from breakfast where brfid=? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		b=true;
		con.close();
		System.out.println("saava denga");
		} catch (Exception e) {
		System.out.println("dengi poindi");
		e.printStackTrace();
	}
	return b;
}
}

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Insert_Lunch {
	public boolean insertLunch(String name,String id,int cost)
	{
		boolean b=false;
		try {
			Connection con = DBConnect.connect();
			String sql="Insert into lunch values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, cost);
			ps.setString(3, id);
			ps.executeUpdate();
			System.out.println("Inserted");
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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
public class Breakfast_Checkout {
public boolean Checkout(String names[],String cost[],int cust_id)
{
	boolean b= false;
	try
	{
		Connection con1=DBConnect.connect();
		Random rn=new Random();
		int x= rn.nextInt(100000);
		for(int i=0;i<names.length;i++)
		{
			System.out.println(names[i]);
		}
		for(int i=0;i<names.length;i++)
		{
			String sql="Select cost from breakfast where brfname=?";
			PreparedStatement ps=con1.prepareStatement(sql);
			ps.setString(1, names[i]);
			ResultSet rs1=ps.executeQuery();
			int price=0;
			while(rs1.next()) {
				price=rs1.getInt(1);
			}
			System.out.println(price);
			int tot_price=price*(Integer.valueOf(cost[i]));
			
			System.out.println(tot_price);
			String sqli="Insert into cust_orders values(?,?,?,?,?)";
			PreparedStatement psi=con1.prepareStatement(sqli);
			psi.setInt(1, cust_id);
			psi.setString(2, names[i]);
			psi.setInt(3, Integer.valueOf(cost[i]));
			psi.setInt(4, tot_price);
			psi.setInt(5, x);
			psi.executeUpdate();
		}
		con1.close();
		b=true;
		System.out.println("done");
		
	}
	
	catch(Exception e) {
		
	}
	return b;
}
}

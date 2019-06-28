import java.sql.Connection;
import java.sql.PreparedStatement;

public class CustomerImpl implements Customersection {

	

	@Override
	public int addCustomer(Customer customer) {
		try {
			int cust_id=customer.getCust_id();
			Connection con = DBConnect.connect();
			String INSERT="insert into cust_details values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(INSERT);
			ps.setString(1, customer.getUsername());
			ps.setString(2, customer.getPassword());
			ps.setDouble(3, customer.getPhonenumber());
			ps.setString(4, customer.getEmail());
			ps.setInt(5,customer.getCust_id());
			ps.setString(6,customer.getAddress());
			ps.setString(7,customer.getCust_name());
			ps.executeUpdate();
			System.out.println("done");
			con.close();

			return cust_id;
		} catch (Exception e) {
			System.out.println("not done");
			System.out.println(e);
			return 0;
			}
		
	}

	@Override
	public Customer getCustomer(int cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCustomer(Customer customer) {
		
	}

	@Override
	public boolean removeCustomer(Customer customer) {
		boolean b=false;
		try {
			int cust_id=customer.getCust_id();
			Connection con = DBConnect.connect();
			String DELETE="delete from cust_details where cust_id=?";
			PreparedStatement ps = con.prepareStatement(DELETE);
			ps.setInt(1, cust_id);
			ps.executeUpdate();
			b=true;
		}
		 catch (Exception e) {
				System.out.println("not done");
				System.out.println(e);
				}
	    return b;
	}
}

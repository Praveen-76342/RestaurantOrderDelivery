
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class DBConnect {


	public static Connection connect() {
	Connection con=null;
	try {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/praveen");
	    con = ds.getConnection();
	
	    System.out.println("database connected");
	}
	catch (Exception e) {
	System.out.println("not connected to database");
	}
	return con;
	}

	
	}


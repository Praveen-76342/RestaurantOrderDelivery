
	import java.awt.event.ActionEvent;
	import java.sql.*;
	import java.util.*;
public class DBConnect {


	public static Connection connect() {
	Connection con=null;
	try {

		Class.forName("com.mysql.cj.jdbc.Driver");		
		String url="jdbc:mysql://localhost:3306/restaurant";
		String user="root";
		String pass="1234";

	con = DriverManager.getConnection(url,user,pass);
	
	System.out.println("database connected");
	}
	catch (ClassNotFoundException | SQLException e) {
	System.out.println("not connected to database");
	}
	return con;
	}

	
	}


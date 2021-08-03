package Jsp_HW2;
import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;

/**
 * This class is in charge of communicating with the Oracle Database
 * to perform the queries to insert a professor, to insert a course,
 * and to retrieve the professors on their degrees.
 */
public class DataHandler {
	final String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";
	final String userid = "vu0027"; //your Oracle username
	// For security reasons, we suggest that you DON'T PUT YOUR PASSWORD
	// IN YOUR SOURCE FILE LIKE THIS:
	final String password = "KQls9Uw8"; // your Oracle password
	Connection conn;
	/**
	 * This class gets the current DB connection. This is not to be used in
	 * production environments. You should use a connection pool instead.
	 *
	 * @return
	 * @throws SQLException
	 */
	public Connection getDBConnection() throws SQLException{
		final OracleDataSource ds = new OracleDataSource();
		ds.setURL(jdbcUrl);
		if(conn == null) {
			conn = ds.getConnection(userid, password);
		}
		conn.setAutoCommit(true);
		return conn;
	}


	// Query 1
	public boolean insertManufacturer(String mname, String maddress) throws SQLException {
		// Connect to the database.

		int updatedRows = 0;
		final String sqlInsertManufacturer ="INSERT INTO microManu_tab(mname,maddress) VALUES(?, ?)";

		// Connect to the database
		getDBConnection();
		// Prepare the SQL query
		// Connect to the database

		try(
				final PreparedStatement stmt = conn.prepareStatement(sqlInsertManufacturer);
				){
			stmt.setString(1, mname);
			stmt.setString(2, maddress);
			// Run the query
			updatedRows = stmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return updatedRows != 0;
	}


	// Query 2
	public boolean insertLaptop(int s_no, int spd, int prce, int memo, String[] software, String mname, int wei) throws SQLException {
		// Connect to the database
		getDBConnection();
		int updatedRows = 0;

		String softwareStr = "software_typ(";
		for(int i = 0; i < software.length-1; i++) {
			softwareStr += "?, ";
		}
		if(software.length > 0) {
			softwareStr += "?";
		}
		softwareStr += ")";
		final String sqlInsertComputer =
				"INSERT INTO laptop_tab values" +
						"(?, ?, ?, ?, software_typ(?), " +
						"(select REF(manu) " +
						"FROM microManu_tab manu " +
						"WHERE mname = ?), ?)";

		// Prepare the SQL query
		try(
				final PreparedStatement stmt = conn.prepareStatement(sqlInsertComputer);
				){
			stmt.setInt(1, s_no);
			stmt.setInt(2, spd);
			stmt.setInt(3, prce);
			stmt.setInt(4, memo);

			// Now set the software
			for(int i=0; i < software.length; i++) {
				stmt.setString(5+i, software[i]);
			}
			stmt.setString(6, mname);
			stmt.setInt(7, wei);
			// Run the query
			updatedRows = stmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return updatedRows != 0;
	}

	// Query 2
	public boolean insertDesktop(int s_no, int spd, int prce, int memo, String[] software, String mname, String mtype) throws SQLException {
		// Connect to the database
		getDBConnection();
		int updatedRows = 0;

		String softwareStr = "software_typ(";
		for(int i = 0; i < software.length-1; i++) {
			softwareStr += "?, ";
		}
		if(software.length > 0) {
			softwareStr += "?";
		}
		softwareStr += ")";
		final String sqlInsertComputer =
				"INSERT INTO desktop_tab values" +
						"(?, ?, ?, ?, software_typ(?), " +
						"(select REF(manu) " +
						"FROM microManu_tab manu " +
						"WHERE mname = ?), ?)";

		// Prepare the SQL query
		try(
				final PreparedStatement stmt = conn.prepareStatement(sqlInsertComputer);
				){
			stmt.setInt(1, s_no);
			stmt.setInt(2, spd);
			stmt.setInt(3, prce);
			stmt.setInt(4, memo);

			// Now set the software
			for(int i=0; i < software.length; i++) {
				stmt.setString(5+i, software[i]);
			}
			stmt.setString(6, mname);
			stmt.setString(7, mtype);
			// Run the query
			updatedRows = stmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return updatedRows != 0;
	}

	// Query 3
	public boolean insertCustomer(int ord_number, int ord_month, int ord_year, String cname, int serial_no) throws SQLException {
		// Connect to the database
		getDBConnection();
		int updatedRows = 0;

		final String sqlInsertComputer =
				"INSERT INTO order_tab values" +
						"(?, date_obj(?, ?), " +
						"(select ref(cn) " +
						"FROM customer_tab cn " +
						"WHERE cname = ?),  (select ref(sn) from computer_tab sn where serial_no =?))";

		// Prepare the SQL query
		try(
				final PreparedStatement stmt = conn.prepareStatement(sqlInsertComputer);
				){
			stmt.setInt(1, ord_number);
			stmt.setInt(2, ord_month);
			stmt.setInt(3, ord_year);
			stmt.setString(4, cname);
			stmt.setInt(5, serial_no);
			// Run the query
			updatedRows = stmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return updatedRows != 0;
	}
	// Query 4
	public boolean insertTechSupport(String cname, String cstreet, String ccity, String cstate, int czipcode, int serial_no, String tech_sup) throws SQLException {
		// Connect to the database
		getDBConnection();
		int updatedRows = 0;

		final String sqlInsertComputer =
				"INSERT INTO customer_tab values" +
						"(?, address_obj(?,?, ?, ?), ?, " +
						"(select REF(sn) " +
						"FROM computer_tab sn " +
						"WHERE serial_no = ?))";

		// Prepare the SQL query
		try(
				final PreparedStatement stmt = conn.prepareStatement(sqlInsertComputer);
				){
			stmt.setString(1, cname);
			stmt.setString(2, cstreet);
			stmt.setString(3, ccity);
			stmt.setString(4, cstate);
			stmt.setInt(5, czipcode);
			stmt.setString(6, tech_sup);
			stmt.setInt(7, serial_no);


			// Run the query
			updatedRows = stmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return updatedRows != 0;
	}
	// Query 5
	public ResultSet findQuery5(int year, String cname) throws SQLException {
		// Connect to the database.
		getDBConnection();
		// Prepare the SQL query
		final String sql = 
				"select A1.serial_no as serial_no, A1.speed as speed, A1.price as price, A1.memory as memory, A1.weight as weight from laptop_tab A1, customer_tab A3 , order_tab A2  where  A3.cname = ? and A2.order_date.year = ?";

		final PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, year);
		stmt.setString(2, cname);
		return stmt.executeQuery();
	}
	// Query 6
	public ResultSet findQuery6(String mname) throws SQLException {
		// Connect to the database.
		getDBConnection();
		// Prepare the SQL query
		final String sql = 
				"SELECT A1.cname as Cname, A1.is_supported as Support, '"+ mname + "' as Mname " +
						"from customer_tab A1, micromanu_tab A3 " +
						"where A1.is_supported is not null " +
						"and A3.mname = ?"; 

		final PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, mname);
		return stmt.executeQuery();
	}

	// Query 7
	public ResultSet findQuery7(String software) throws SQLException {
		// Connect to the database.
		getDBConnection();
		// Prepare the SQL query
		final String sql = 
				"select distinct cname as cname from laptop_tab A2, customer_tab A1 where ? in (select * from table (A2.software))";

		final PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, software);
		return stmt.executeQuery();
	}

	// Query 8
	public ResultSet findQuery8(int price) throws SQLException {
		// Connect to the database.
		getDBConnection();
		// Prepare the SQL query
		final String sql = 
				"select distinct cname as cname, price as price from  desktop_tab A2, customer_tab A1 where A2.price > ?";

		final PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, price);
		return stmt.executeQuery();
	}

	// Query 9
	public ResultSet findQuery9(int serial_no) throws SQLException {
		// Connect to the database.
		getDBConnection();
		// Prepare the SQL query
		final String sql = 
				"select t.serial_no as sn, t.software as sf from laptop_tab t where serial_no = ?";

		final PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, serial_no);
		return stmt.executeQuery();
	}

	// Query 10
	public ResultSet findQuery10(int year) throws SQLException {
		// Connect to the database.
		getDBConnection();
		// Prepare the SQL query
		final String sql = 
				"delete from customer_tab where cname NOT IN (Select A2.cname from order_tab A1, customer_tab A2 where A1.order_date.year > ?)";

		final PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, year);
		return stmt.executeQuery();
	}

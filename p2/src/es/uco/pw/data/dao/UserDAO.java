package es.uco.pw.data.dao;

import java.util.Properties;
import java.io.*;
import java.sql.*;

import es.uco.pw.bussiness.user.User;

public class UserDAO extends DAO {

	@Override
	public Connection getConnection() {
		Connection con=null;
		try {
		  Class.forName("com.mysql.jdbc.Driver");
		  con= DriverManager.getConnection("jdbc:mysql://oraclepr.uco.es:3306/i82gaarj","i82gaarj","PW202021");
		} catch(Exception e) {
		  System.out.println(e);
		}
		return con;
	}

	@Override
	public int insert(User usuario) {
		int status = 0;
		Properties prop = new Properties();
		InputStream inputStream = this.getClass().getResourceAsStream("/sql.properties");
		try {
			prop.load(inputStream);
			String insert = prop.getProperty("insert");
			
			try {
				Connection conex=getConnection();
				PreparedStatement ps=conex.prepareStatement(insert);
				ps.setString(1,usuario.getEmail());
				ps.setString(2,usuario.getPassword());
				ps.setString(3,usuario.getFirstname());
				ps.setString(4,usuario.getLastname());
				status = ps.executeUpdate();
			}
			catch (Exception e1) {
				System.out.println(e1);
			}
		}
		catch (Exception e2){
			System.out.println(e2);
		}
		return status;
	}

	@Override
	public int modify(User usuario) {
		int status = 0;
		Properties prop = new Properties();
		InputStream inputStream = this.getClass().getResourceAsStream("/sql.properties");
		try {
			prop.load(inputStream);
			String modify = prop.getProperty("modify");
			try {
				Connection conex=getConnection();
				PreparedStatement ps=conex.prepareStatement(modify);
				ps.setString(1,usuario.getEmail());
				ps.setString(2,usuario.getPassword());
				ps.setString(3,usuario.getFirstname());
				ps.setString(4,usuario.getLastname());
				status = ps.executeUpdate();
			}
			catch (Exception e1) {
				System.out.println(e1);
			}
		}
		catch (Exception e2) {
			System.out.println(e2);
		}
		return status;
	}

	@Override
	public User queryByEmail(String email, String password) {
		Statement stmt = null;
		Properties prop = new Properties();
		InputStream inputStream = this.getClass().getResourceAsStream("/sql.properties");
		try {
			prop.load(inputStream);
			String query = prop.getProperty("query");
			try {
				Connection conex=getConnection();
				stmt = conex.createStatement();
			    ResultSet rs = stmt.executeQuery(query + email);
			    String passwordbbdd = rs.getString("password");
			    if(passwordbbdd.equals(password)) {
			    	String firstname = rs.getString("firstname");
			    	String lastname = rs.getString("lastname");
			    	User usuario = new User(email,password,firstname,lastname);
			    	return usuario;
			    }
			}
			catch(Exception e1){
				System.out.println(e1);
			}
		}
		catch(Exception e2) {
			System.out.println(e2);
		}
		return null;
	}

}

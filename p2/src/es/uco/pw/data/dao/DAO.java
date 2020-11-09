package es.uco.pw.data.dao;

import java.sql.*;
import es.uco.pw.bussiness.user.*;

public abstract class DAO {
	
	public abstract Connection getConnection();
	
	public abstract int insert(User usuario);
	
	public abstract int modify(User usuario);
	
	public abstract User queryByEmail(String email, String password);

}

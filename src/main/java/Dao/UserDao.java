package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entity.User;

public class UserDao {
	private Connection connection;
	private String query;
	private PreparedStatement psmt;
	private ResultSet rs;

	public UserDao(Connection connection) {
		this.connection = connection;
	}

	public User userLogin(String email, String password) {
		User user = null;
		try {
			query = "select * from users where email = ? and password = ?";
			psmt = connection.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);
			rs = psmt.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
//				user.setPswd(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}

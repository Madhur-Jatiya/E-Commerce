package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Entity.Order;

public class OrderDao {
	private Connection connection;
	private String query;
	private PreparedStatement psmt;
	private ResultSet rs;

	public OrderDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean insertOrder(Order order) {
		boolean result = false;

		try {
			query = "insert into orders(product_id,user_id,quantity) values(?,?,?)";
			psmt = connection.prepareStatement(query);
			psmt.setInt(1, order.getProductId());
			psmt.setInt(2, order.getuId());
			psmt.setInt(3, order.getQuantity());
			psmt.executeUpdate();
			result = true;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		return result;
	}

}

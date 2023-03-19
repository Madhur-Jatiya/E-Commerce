package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entity.Order;
import Entity.Product;

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

	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList();
		try {
			query = "select * from orders where user_id = ? order by order_id desc";
			psmt = connection.prepareStatement(query);
			psmt.setInt(1, id);

			rs = psmt.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				ProductDao productDao = new ProductDao(connection);
				int productId = rs.getInt("product_id");
				Product product = productDao.getSingleProduct(productId);
				order.setOrderId(rs.getInt("order_id"));
				order.setId(productId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice() * rs.getInt("quantity"));
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("order_date"));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void cancelOrder(int id) {
		try {
			query = "delete from orders where order_id = ?";
			psmt = connection.prepareStatement(query);
			psmt.setInt(1, id);
			psmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

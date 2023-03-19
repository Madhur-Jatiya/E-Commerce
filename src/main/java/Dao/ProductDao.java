package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Entity.Cart;
import Entity.Product;

public class ProductDao {
	private Connection connection;
	private String query;
	private PreparedStatement psmt;
	private ResultSet rs;

	public ProductDao(Connection connection) {
		this.connection = connection;
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		try {
			query = "Select * from products";
			psmt = connection.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				products.add(row);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return products;
	}

	public List<Cart> getCartProducts(List<Cart> cartList) {
		List<Cart> products = new ArrayList<Cart>();
		try {
			if (cartList.size() > 0) {

			}
			for (Cart items : cartList) {
				query = "Select * from products where id = ?";
				psmt = connection.prepareStatement(query);
				psmt.setInt(1, items.getId());
				rs = psmt.executeQuery();

				while (rs.next()) {
					Cart row = new Cart();
					row.setId(rs.getInt("id"));
					row.setName(rs.getString("name"));
					row.setPrice(rs.getDouble("price") * items.getQuantity());
					row.setCategory(rs.getString("category"));
					row.setQuantity(items.getQuantity());
					products.add(row);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "Select price from products where id = ?";
					psmt = connection.prepareStatement(query);
					psmt.setInt(1, item.getId());
					rs = psmt.executeQuery();
					while (rs.next()) {
						sum = sum + rs.getDouble("price") * item.getQuantity();
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return sum;
	}

	public Product getSingleProduct(int productId) {
		Product row = null;
		try {
			query = "select * from products where id = ?";
			psmt = connection.prepareStatement(query);
			psmt.setInt(1, productId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
}

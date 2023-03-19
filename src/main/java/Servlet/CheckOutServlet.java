package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.DbConnection;
import Dao.OrderDao;
import Entity.Cart;
import Entity.Order;
import Entity.User;

public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckOutServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();

			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");

			if (auth != null && cart_list != null) {
				for (Cart c : cart_list) {
					Order order = new Order();
					order.setProductId(c.getId()); // need to check
					order.setuId(auth.getId());
					order.setQuantity(c.getQuantity());

					OrderDao orderDao = new OrderDao(DbConnection.getConnection());
					boolean result = orderDao.insertOrder(order);
					if (!result) {
						break;
					}
				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
			}

			else {
				if (auth == null) {
					response.sendRedirect("login.jsp");
				} else {
					response.sendRedirect("card.jsp");	//by me
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

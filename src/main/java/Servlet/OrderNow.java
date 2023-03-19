package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.DbConnection;
import Dao.OrderDao;
import Entity.Order;
import Entity.User;

public class OrderNow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderNow() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			User auth = (User) request.getSession().getAttribute("auth");

			if (auth != null) {
				String productId = request.getParameter("id");
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));

				if (productQuantity <= 0) {
					productQuantity = 1;
				}
				Order order = new Order();
				order.setProductId(Integer.parseInt(productId));
				order.setuId(auth.getId());
				order.setQuantity(productQuantity);

				OrderDao orderDao = new OrderDao(DbConnection.getConnection());
				boolean result = orderDao.insertOrder(order);

				if (result) {
					response.sendRedirect("orders.jsp");
				} else {
					out.println("order failed");
				}

			} else {
				response.sendRedirect("login.jsp ");
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

package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.DbConnection;
import Dao.OrderDao;

public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CancelOrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String id = request.getParameter("id");
			if (id != null) {
				OrderDao orderDao = new OrderDao(DbConnection.getConnection());
				orderDao.cancelOrder(Integer.parseInt(id));
			}
			response.sendRedirect("orders.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

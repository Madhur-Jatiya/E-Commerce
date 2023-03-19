package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownServiceException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.DbConnection;
import Dao.UserDao;
import Entity.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-pswd");

		try {
			UserDao userDao = new UserDao(DbConnection.getConnection());
			User user = userDao.userLogin(email, password);
			if (user != null) {
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");
			} else {
				out.print("incorrect");
			}
		} catch (ClassNotFoundException e) {
//			System.out.println(e);
			e.printStackTrace();
		} catch (SQLException e) {
//			System.out.println(e);
			e.printStackTrace();
		}

	}

}

package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.Cart;

public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doget(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset-UTF-8");
		try {
			ArrayList<Cart> cartList = new ArrayList<Cart>();
			int id = Integer.parseInt(request.getParameter("id"));
			
			Cart cart = new Cart();
			cart.setId(id);
			cart.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cartList2 = (ArrayList<Cart>) session.getAttribute("ad");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

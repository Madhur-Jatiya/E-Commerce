<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
	pageEncoding="ISO-8859-1"%>
<%@page import="Entity.*"%>
<%@page import="java.util.ArrayList"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!doctype html>
<html lang="en">
<head>
<%@include file="includes/header.jsp"%>

<title>Shopping Cart Login</title>
</head>
<body>
	<%@include file="includes/nav.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="LoginServlet" method="post">
					<div class="form-group">
						<label for="11">Email Address</label> <input type="email" required
							placeholder="Enter your Email" class="form-control" id="11"
							name="login-email">
					</div>
					<div class="form-group">
						<label for="12">Password</label> <input type="password" required
							placeholder="Enter your password" class="form-control" id="12"
							name="login-pswd">
					</div>
					<div class="text-center">
						<button type="Submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
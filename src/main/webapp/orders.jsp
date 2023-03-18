<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
	pageEncoding="ISO-8859-1"%>
<%@page import="Entity.*"%>
<%@page import="java.util.ArrayList"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
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

<title>Orders</title>
</head>
<body>
	<%@include file="includes/nav.jsp"%>
	<%
	out.println(auth);
	%>
	<%@include file="includes/footer.jsp"%>
</body>
</html>
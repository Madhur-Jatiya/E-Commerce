<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Entity.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
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

	<%@include file="includes/footer.jsp"%>
</body>
</html>
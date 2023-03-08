<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="Connection.DbConnection"%>
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

<title>Welcome to Shopping Cart</title>
</head>
<body>
	<%@include file="includes/nav.jsp"%>
	<%
	out.println(auth);
	%>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
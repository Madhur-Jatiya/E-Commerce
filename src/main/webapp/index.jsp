<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDao"%>
<%@page import="java.awt.color.ProfileDataException"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="Connection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@page import="Entity.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbConnection.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
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
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>

			<div class="col-md-3">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-images/<%=p.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price :
							<%=p.getPrice()%>
							&#8377;

						</h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%>
						</h6>
						<div class="mt-3 d-flex justify-content-between"></div>
						<a href="Add?id=<%=p.getId()%>" class="btn btn-dark">Add to
							Cart</a> <a href="OrderNow" class="btn btn-primary">Buy Now</a>
					</div>
				</div>
			</div>

			<%
			}
			}
			%>

		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
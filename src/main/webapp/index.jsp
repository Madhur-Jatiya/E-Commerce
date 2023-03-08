<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDao"%>
<%@page import="java.awt.color.ProfileDataException"%>
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

ProductDao pd = new ProductDao(DbConnection.getConnection());
List<Product> products = pd.getAllProducts();
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
		<%if(!products.isEmpty())
		{
			for(Product p : products)
			{
				out.println(p.getName());
			}
		}
		
		else{
			out.print("by");
		}
			%>
			<div class="col-md-3">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-images/watches/watch.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Men's Watch</h5>
						<h6 class="price">Price : 1000&#8377;</h6>
						<h6 class="category">Category: some category</h6>
						<div class="mt-3 d-flex justify-content-between"></div>
						<a href="#" class="btn btn-primary">Add to Cart</a> <a href="#"
							class="btn btn-primary">Buy Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-images/watches/watch1.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Men's Royal Watch</h5>
						<h6 class="price">Price : 2000&#8377;</h6>
						<h6 class="category">Category: some category</h6>
						<div class="mt-3 d-flex justify-content-between"></div>
						<a href="#" class="btn btn-primary">Add to Cart</a> <a href="#"
							class="btn btn-primary">Buy Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
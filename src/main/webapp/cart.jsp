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

<title>Cart</title>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="includes/nav.jsp"%>
	<div class="container my-3">
		<div class="d-flex py-3">
			<h3>Total Price : 2423 &#8377;</h3>
			<a class="mx-3 btn btn-primary" href="#">Check out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Nike Sports Shoes</td>
					<td>Shoes</td>
					<td>2499.00 &#8377;</td>
					<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id" value="8" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-decre" href="#"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" value="8" class="form-control" readonly>
								<a class="btn bnt-sm btn-incre" href="#"><i
									class="fas fa-plus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="#">Remove</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>
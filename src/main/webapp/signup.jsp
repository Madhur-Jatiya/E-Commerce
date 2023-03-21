<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
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

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart Login</title>
    <%@ include file="includes/header.jsp"%>
    <script type="text/javascript">
        function validate() {
            var password = document.getElementById("pswd").value;
            var confirmPassword = document.getElementById("Cpswd").value;
            var warning = document.getElementById("warning");
            if (password === confirmPassword) {
                warning.innerHTML = "";
                return true;
            } else {
                warning.innerHTML = "Passwords must match";
                return false;
            }
        }
    </script>
</head>
<body>
    <%@ include file="includes/nav.jsp"%>
    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center font-weight-bold"
                style="font-size: 20px;">Register</div>
            <div class="card-body">
                <form action="SignupServlet" method="post" onsubmit="return validate()">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" required placeholder="Enter your Name" class="form-control" id="name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" required placeholder="Enter your Email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="pswd">Password</label>
                        <input type="password" required placeholder="Enter your password" class="form-control" id="pswd" name="pswd">
                    </div>
                    <div class="form-group">
                        <label for="Cpswd">Confirm Password</label>
                        <input type="password" required placeholder="Enter your password" class="form-control" id="Cpswd" name="Cpswd">
                    </div>
                    <div id="warning" style="color:red"></div>
                    <div class="text-center">
                        <p>Already Registered? <a href="login.jsp">Login</a></p>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="includes/footer.jsp"%>
</body>
</html>


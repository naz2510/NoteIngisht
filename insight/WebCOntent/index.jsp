<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DbConnect"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	/*background: url("img/bgimg2.jpeg");*/
	background-color: #7771df;
	height: 90vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}
</style>
<meta charset="UTF-8">
<title>HOME PAGE</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>


	<%
	Connection conn = DbConnect.getConn();
	System.out.println(conn);
	%>

	<div class="container-fluid back-img">
		<div class="text-center">
			<div>
				<div>
					<h1 class="text-white">E Notes: Save your notes</h1>
				</div>
				<a href="login.jsp" class="btn btn-light">Login</a> <a
					href="register.jsp" class="btn btn-light">Register</a>
			</div>
		</div>
	</div>




	<div class="container-fluid2 bg-dark">
		<%@include file="all_component/footer.jsp"%>

	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDetails user2 = (UserDetails) session.getAttribute("userD");
if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="card text-center">
			<div class="card-body mb-5">

				<img alt="" src="img/qlogo.jpg" class="img-fluid mx-auto mt-5 mb-5"
					style="max-width: 400px">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="addNotes.jsp" class="btn btn-outline-primary mt-2">START</a>
			</div>
		</div>
	</div>
	<div class="container-fluid2 bg-dark">
	<%@include file="all_component/footer.jsp"%>

</div>
</body>
</html>
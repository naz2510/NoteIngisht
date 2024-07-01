<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.User.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color:#7771df">
	<%@include file="all_component/navbar.jsp"%>

	<%
	String updateMsg = (String) session.getAttribute("updateMsg");

	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	<%
	String WrongMsg = (String) session.getAttribute("WrongMsg");

	if (WrongMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=WrongMsg%></div>
	<%
	session.removeAttribute("WrongMsg");
	}
	%>
	<div class="container background-color:red">
		<h2 class="text-center">All Notes:</h2>

		<div class="row">

			<div class="col-md-12">
				<%
				if (user3 != null) {
					PostDAO ob = new PostDAO(DbConnect.getConn());
					List<Post> post = ob.getData(user3.getId());
					for (Post po : post) {
				%>
				<div class="card mt-3">

					<img alt="" src="img/qlogo.jpg" class="card-img-top mt-3 mx-auto"
						style="max-width: 100px;">

					<div class="card-body p-4">


						<h5 class="card-title "><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>


						<br>
						<p>

							<b class="text-success">Published Date:<%=po.getPdate()%>
							</b></br> <b class="text-primary"></b>

						</p>
						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=po.getId() %>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>

			</div>
		</div>
	</div>
<div class="container-fluid2 bg-dark mt-5">
	<%@include file="all_component/footer.jsp"%>

</div>
</body>
</html>
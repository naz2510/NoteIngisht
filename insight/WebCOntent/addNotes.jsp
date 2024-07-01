<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
UserDetails user4 = (UserDetails) session.getAttribute("userD");
if (user4 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color:#7771df">
	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>


		<h1 class="text-center">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");

							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">
							<%
							}
							%>

							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Notes</label>
							<textarea rows="10" cols="" class="form-control" name="content"
								required="required"></textarea>
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid2 bg-dark mt-5">
		<%@include file="all_component/footer.jsp"%>

	</div>
</body>
</html>
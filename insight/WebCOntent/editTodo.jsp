<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.DAO.TodoDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.User.Todo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditTodo</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #7771df">
	<%
	int todoid = Integer.parseInt(request.getParameter("id"));

	TodoDAO dao = new TodoDAO(DbConnect.getConn());
	Todo t = dao.getTodoById(todoid);
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="conatiner">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Todo</h3>
						<form action="TodoEditServlet" method="post">
							<input type="hidden" value="<%=todoid%>" name="todoid">
							
							<div class="form-group col-md-10 ">
								<label for="exampleInputEmail1" class="font-weight-bold">Todo</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="todo" 
									value="<%=t.getTodo()%>">

							</div>
							
							<div class="form-group col-md-5">
								<label for="exampleInputEmail1" class="font-weight-bold">Target Date</label> <input type="date"
									class="form-control" id="exampleInputDate"
									aria-describedby="emailHelp" name="tododate" value="<%=t.getTododate()%>">

							</div>
							
							
							<div class="form-group col-md-5" >
								<label for="inputState" class="font-weight-bold">Status</label> <select id="inputState"
									class="form-control" name="status">

									<%
									if ("Pending".equals(t.getStatus())) {
									%>
									<option value="Pending">Pending</option>
									<option value="Complete">Complete</option>
									<%
									} else {
									%>
									<option value="Complete">Complete</option>
									<option value="Pending">Pending</option>

									<%
									}
									%>



								</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid2 bg-dark">
	<%@include file="all_component/footer.jsp"%>

</div>
</body>
</html>
<%@page import="com.DAO.TodoDAO"%>
<%@page import="com.User.Todo"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<title>Todo List</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color:#7771df">
	<%@include file="all_component/navbar.jsp"%>
	<h1 class="text-center mt-5">ToDo List</h1>


	<%
	String sucMsg = (String) session.getAttribute("sucMsg");
	if (sucMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=sucMsg%></div>
	<%
	}
	session.removeAttribute("sucMsg");
	%>
	<%
	String failMsg = (String) session.getAttribute("failMsg");
	if (failMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=failMsg%></div>
	<%
	}
	session.removeAttribute("failMsg");
	%>
	<div class="container">
		<table class="table table-striped mt-4 md-5 bg-light" border="1px" >
			<thead class=" text-white text-center">
				<tr style="background-color:#555193" ">
					<!--<th scope="col">ID</th>-->
					<th scope="col" style="width:150px">TODO</th>
					<th scope="col" style="width:80px">TARGET DATE</th>
					<th scope="col" style="width:80px">STATUS</th>
					<th scope="col" style="width:100px">ACTION</th>

				</tr>
			</thead>
			<tbody class="text-center ">
				<%
				if (user4 != null) {
				TodoDAO dao = new TodoDAO(DbConnect.getConn());
				List<Todo> todo = dao.getTodo(user4.getId());
				for (Todo t : todo) {
				%>
				<tr>
				<!-- <th scope="row"><%--<%=t.getId()%>--%></th> -->	
					<td><%=t.getTodo()%></td>
					<td><%=t.getTododate()%></td>
					<td><%=t.getStatus()%></td>
					<td><a href="editTodo.jsp?id=<%=t.getId()%>"
						class="btn btn-primary mr-3 ml-3 ">EDIT</a> <a
						href="delete?id=<%=t.getId()%>" class="btn btn-danger">DELETE</a>
					</td>
				</tr>
				<%
				}}
				%>


			</tbody>
		</table>
	</div>
	<div class="container-fluid2 bg-dark mt-5" style="margin-top:100px;" >
	<%@include file="all_component/footer.jsp"%>

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Login</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid div-color ">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-5">
				<div class="card  mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-circle" aria-hidden="true"></i>
						<h4>Login Page</h4>
					</div>



					<%--loginServlet--%>
					<%
					String invalidMsg = (String) session.getAttribute("login-failed");

					if (invalidMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=invalidMsg%></div>
					<%
					session.removeAttribute("login-failed");
					}
					%>


					<%
					String withoutLogin = (String) session.getAttribute("Login-error");
					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>

					<%
					session.removeAttribute("Login-error");
					}
					%>
					<%--LogoutServlet--%>
					<%
					String lgMsg = (String) session.getAttribute("LogoutMsg");
					if (lgMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=lgMsg%></div>
					<%
					session.removeAttribute("LogoutMsg");
					}
					%>



					<div class="card-body">
						<form action="loginServlet" method="post">

							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"> Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="upassword" required="required">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
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
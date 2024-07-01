package com.Servlet;

import com.DAO.TodoDAO;
import com.Db.DbConnect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addTodoServlet")
public class addTodoServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String todo = request.getParameter("todo");
		String tododate=request.getParameter("tododate");
		String status = request.getParameter("status");

		TodoDAO dao = new TodoDAO(DbConnect.getConn());
		boolean f = dao.addTodo(todo, tododate,status,uid);
		HttpSession session = request.getSession();
		if (f) {
//			session.setAttribute("sucMsg", "Todo added");
		response.sendRedirect("indexTodo.jsp");
		} else {
			session.setAttribute("sucMsg", "Todo  not added");
			response.sendRedirect("indexTodo.jsp");
		}

	}

}

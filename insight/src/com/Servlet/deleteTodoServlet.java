package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.Db.DbConnect;

@WebServlet("/delete")
public class deleteTodoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int todoid=Integer.parseInt(request.getParameter("id"));
		TodoDAO dao=new TodoDAO(DbConnect.getConn());
		boolean f=dao.DeleteTodo(todoid);
		HttpSession session=null;
		if (f) {
			 session=request.getSession();
			session.setAttribute("DeleteMsg", "todo Deleted");
			response.sendRedirect("indexTodo.jsp");
		} else {
			 session=request.getSession();
				session.setAttribute("WrongMsg", "Something went wrong on server");
				response.sendRedirect("indexTodo.jsp");

		}
		
	}
}

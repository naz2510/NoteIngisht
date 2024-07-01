package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.DAO.TodoDAO;
import com.Db.DbConnect;
import com.User.Todo;

@WebServlet("/TodoEditServlet")
public class TodoEditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int todoid = Integer.parseInt(request.getParameter("todoid"));
			String Todo = request.getParameter("todo");
			String Tododate = request.getParameter("tododate");
			
			String Status = request.getParameter("status");
			TodoDAO dao = new TodoDAO(DbConnect.getConn());

		com.User.Todo t = new Todo();
		t.setId(todoid);
		t.setTodo(Todo);
		t.setTododate(Tododate);
		t.setStatus(Status);

			boolean f = dao.TodoUpdate(todoid, Todo, Tododate,Status);
			HttpSession session = request.getSession();
			if (f) {

				session.setAttribute("updateTodoMsg", "todo Updated");
				response.sendRedirect("indexTodo.jsp");
			} else {
				session.setAttribute("failTodoMsg", "Something went wrong");
				response.sendRedirect("indexTodo.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error1");
		}
	}

}

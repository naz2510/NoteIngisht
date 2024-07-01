package com.User;

import java.time.LocalDate;
import java.util.Date;

public class Todo {
	private int id;
	private String todo;
	private String tododate;
	private String status;
	private UserDetails user;

	public Todo(int id, String todo, String tododate,String status, UserDetails user) {
		super();
		this.id = id;
		
		this.todo = todo;
		this.tododate=tododate;
		this.status = status;

		this.user = user;
	}
	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
	}

	public String getStatus() {
		return status;
	}
	
	public String getTododate() {
		return tododate;
	}
	
	public void setTododate(String tododate) {
		this.tododate = tododate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public UserDetails getUser() {
		return user;
	}

	public void setUser(UserDetails user) {
		this.user = user;

	}
}

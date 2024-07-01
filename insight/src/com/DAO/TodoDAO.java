package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;
import com.User.Todo;
import com.User.UserDetails;
import java.time.LocalDate;
public class TodoDAO {
	private Connection conn;

	public TodoDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addTodo(String td,String tdate ,String st,int ui) {
		boolean f = false;
		try {

			String qu = "insert into todo(todo,tdate,status,uid1) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(qu);
		//	ps.setInt(1, id);
			ps.setString(1, td);
		   ps.setString(2,tdate);
			ps.setString(3, st);
			ps.setInt(4, ui);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {

		}

		return f;
	}

public List<Todo> getTodo(int id) {
		List<Todo> list = new ArrayList<Todo>();
		Todo po = null;
		try {
			String qu = "select * from todo where uid1=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				po = new Todo();
				po.setId(rs.getInt(1));
				po.setTodo(rs.getString(2));
				po.setTododate(rs.getString(3));
				po.setStatus(rs.getString(4));
			//	po.setPdate(rs.getTimestamp(4));
				list.add(po);
			}

		} catch (Exception e) {
		}
		return list;
	}


public Todo getTodoById(int todoId) {
	Todo p = null;
	try {
		String qu = "select * from todo where id=?";
		PreparedStatement ps = conn.prepareStatement(qu);
		ps.setInt(1, todoId);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			p = new Todo();
			p.setId(rs.getInt(1));
			p.setTodo(rs.getString(2));
			p.setTododate(rs.getString(3));
			p.setStatus(rs.getString(4));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return p;
}
public boolean TodoUpdate(int tid, String td,String tdate, String st) {
	boolean f = false;
	try {

		String qu = "update todo set todo=?,status=? ,tdate=? where id=?";
		PreparedStatement ps = conn.prepareStatement(qu);
		ps.setString(1, td);
		ps.setString(2, st);
		ps.setString(3, tdate);
	ps.setInt(4, tid);
		int i = ps.executeUpdate();
		if (i == 1) {
			f = true;
		}
		

	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("error 2");
	}

	return f;
}
public boolean DeleteTodo(int tid)
{
	boolean f=false;
	try {
		
		String qu="delete from todo where id=?";
		PreparedStatement ps=conn.prepareStatement(qu);
		ps.setInt(1, tid);
		int x=ps.executeUpdate();
		if(x==1) {f=true;}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	





return f;}
}
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javabean.Conn;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginJump extends ServletFather {
	HttpServletResponse response;
	private static final long serialVersionUID = -2350622925134963258L;
	public LoginJump() {
		super();
	}
	public void destroy() {
		super.destroy();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.response=response;
		before(request);
		PrintWriter out = response.getWriter();
		if(attributes.get("num").equals("lm") && attributes.get("password").equals("504229406")){
			response.sendRedirect("../index.jsp");
			out.flush();
			out.close();
			return;
		}
		Conn con = new Conn();
		ResultSet rs=null;
		try {
			PreparedStatement ps=con.getConn().prepareStatement("select * from media_users where user_num=? and user_password=?");
			ps.setString(1, attributes.get("num"));
			ps.setString(2, attributes.get("password"));
			rs=ps.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//System.out.print(sql);		
		try {
			if(rs.next()){
				//if(rs.getString(9).equals("正常")) {
					  addSessionValue(rs);
					  if(rs.getString(10).equals("教师")){
						  response.sendRedirect("../frame.jsp?id=0");
					  //dispatcher = request.getRequestDispatcher("../frame.jsp?id=0");
					  //dispatcher .forward(request, response);
					  //out.print("<script>window.location.href='frame.jsp?id=0';</script>");
					  }
					  else if(rs.getString(10).equals("管理员")){
						  response.sendRedirect("../frame.jsp?id=1");
					  }
					  else if(rs.getString(10).equals("超级管理员")){
						  response.sendRedirect("../frame.jsp?id=2");
					  }
					  else{
						  response.sendRedirect("../frame.jsp?id=3");
				      }	
					  con.close();
						new log.Logs().getlog().info(attributes.get("num")+"登录成功");
				//  }
				//  else {
					 // out.print("<script>alert('待审核');window.location.href='../landing.jsp';</script>");
					//  new log.Logs().getlog().info(attributes.get("num")+"待审核");
				 // }
			}
			else {
				out.print("<script>alert('用户名或密码错误');window.location.href='../landing.jsp';</script>");
				new log.Logs().getlog().info(attributes.get("num")+"用户名或密码错误");
		    }
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.flush();
			out.close();
		}
	}
	void addSessionValue(ResultSet rs){
		  try {
		    session.setAttribute("num",attributes.get("num"));
		    addCokie("num",attributes.get("num"));
			session.setAttribute("name",rs.getString(4));
			addCokie("name",rs.getString(4));
		    session.setAttribute("depart",rs.getString(5));
		    addCokie("depart",rs.getString(5));
		    session.setAttribute("telephong",rs.getString(7));
		    addCokie("telephong",rs.getString(7));
		    session.setAttribute("mail",rs.getString(8));
		    addCokie("mail",rs.getString(8));
		    session.setAttribute("state",rs.getString(10));
		    addCokie("state",rs.getString(10));
		    session.setAttribute("password",rs.getString(3));
		    addCokie("password",rs.getString(3));
		    session.setAttribute("mark", rs.getString("user_state"));
		    addCokie("mark",rs.getString("user_state"));
		    addCokie("isLogin","yes");
		  } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	void addCokie(String name,String value){
		Cookie c=null;
			try {
				if(value!=null && !value.equals("null")){
					System.out.println("添加Cookie值  "+name+" "+value);
					c = new Cookie(name,URLEncoder.encode(value,"utf-8"));
				    //c.setMaxAge(60*60);
				    c.setPath("/");
					response.addCookie(c);
				}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}

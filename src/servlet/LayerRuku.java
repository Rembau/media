package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.TreeMap;

import javabean.Conn;
import javabean.SqlWork;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LayerRuku extends HttpServlet {

	private static final long serialVersionUID = 1L;
	TreeMap<String,String> attributes;
	Statement stmt;
	SqlWork s;
	Conn conn;
	HttpSession session;
	public LayerRuku() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void before(HttpServletRequest request){
		session=request.getSession();
		attributes=GetAttributes.getA(request);
		conn=(Conn)(request.getSession().getAttribute("conn"));
		s=new SqlWork(conn);
		stmt=conn.getOldStmt();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		response.setCharacterEncoding("GB18030");
		response.setContentType("text/html");
		String area=attributes.get("area");
		String layer=attributes.get("layer");
		PrintWriter out = response.getWriter();
		String sql;
		ResultSet rs;
		try{sql="select * from media_site where sit_area='"+area+"' and sit_name='"+layer+"'";
		//out.print(sql+"<br>");
		rs=s.select(stmt, sql);
		if(!rs.next()){ 
			sql="insert into media_site(sit_area,sit_name) values('"+area+"','"+layer+"')"; 
			//out.print(sql+"<br>");
			s.updata(sql);
		out.print("<script>alert('录入成功');window.location.href='lururoom.jsp';</script>");
		}
		else out.print("<script>alert('该楼已存在');window.location.href='lururoom.jsp';</script>");

		}
		catch(SQLException e){
			   out.println("sql异常");
		}
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

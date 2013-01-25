package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Remind extends ServletFather {

	private static final long serialVersionUID = 1L;

	public Remind() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		PrintWriter out = response.getWriter();
		String remind=attributes.get("remind");
		String content=attributes.get("content");
		String name=(String)(session.getAttribute("name"));
		 try {
			 String sql="select * from media_users where user_id='"+remind+"'";
			 ResultSet rs=s.select(stmt, sql);
			 rs.next();
			 sql="insert into media_remind(re_num,re_name,re_content,re_state,re_admin) values('"+rs.getString(2)+"','"+rs.getString(4)+"','"+content+"','未提醒','"+name.toString()+"')";
			 s.updata(sql);
			 System.out.println(request.getHeader("Referer"));
			 System.out.println((request.getHeader("Referer").split("jsp"))[0]);
			 out.print("<script>alert('发布完成');window.location.href='"+(request.getHeader("Referer").split("jsp"))[0]+"jsp?mark=教师';</script>");
			 }
			 catch(SQLException e1)
			{
				 e1.printStackTrace();
			     out.print("SQL异常");
			}
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

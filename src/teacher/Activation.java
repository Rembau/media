package teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javabean.Conn;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class Activation extends ServletFather {

	private static final long serialVersionUID = 1L;

	public Activation() {
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
		String code=attributes.get("code");
		String sql="select * from media_user where user_cardnum='"+code+"' and user_num='"+session.getAttribute("num")+"'";
		ResultSet rs=s.select(stmt, sql);
		try {
			sql="select * from media_users where user_num='"+session.getAttribute("num")+"'";
			Conn c=new Conn();
			c.getConn();
			ResultSet rs1=s.select(c.getStmt(), sql);
			if(rs.next()&&rs1.getString("user_state").equals("正常")){
				out.print("<script>alert('该帐号已经激活');window.location.href='./activation.jsp';</script>");
			}
			else if(rs.next()){
				sql="update media_users set user_state='正常' where user_num='"+session.getAttribute("num")+"'";
                s.updata(sql);
				out.print("<script>alert('激活成功');window.location.href='./activation.jsp';</script>");
			}
			else {
				out.print("<script>alert('多媒体证号错误,请仔细检查,如有疑问请联系电教部');window.location.href='./activation.jsp';</script>");
			}
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangePW extends ServletFather {
	private static final long serialVersionUID = 1644160503134340637L;
	public ChangePW() {
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
		try{
			String sql="select * from media_users  where user_num='"+attributes.get("number")+"' and user_password='"+attributes.get("oldpsw")+"' ";
			ResultSet rs = s.select(stmt, sql);

			if(rs.next()){
				sql="update media_users set  user_password='"+attributes.get("newpsw")+"' where user_num='"+attributes.get("number")+"' ";
				conn.stmt.executeUpdate(sql);
				out.print("<script>alert('修改成功');window.opener = null;window.open(' ', '_self', ' ');window.close();</script>");}
			else out.print("<script>alert('没有此用户或密码错误'); window.location.href='../change.jsp';</script>");
			}
			catch(SQLException e1)
			{
			 out.print("SQL异常");
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

	public void init() throws ServletException {
		// Put your code here
	}

}

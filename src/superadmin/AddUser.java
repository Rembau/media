package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class AddUser extends ServletFather {

	private static final long serialVersionUID = 1L;

	public AddUser() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String num=attributes.get("num");
		String telephone=attributes.get("telephone");
		String name=attributes.get("name");
		String depart=attributes.get("depart");
		String mail=attributes.get("mail");
		String mark=attributes.get("mark");
		try{
			   String sql;
			   ResultSet rs1;
			   sql="select * from media_users where user_num='"+num+"'";
				rs1=s.select(stmt, sql);
				if(!rs1.next()){
				String aa="正常";
				sql="insert into media_users(user_num,user_name,user_depart,user_telephone,user_mail,user_state,user_mark) values('"+num+"','"+name+"','"+depart+"','"+telephone+"','"+mail+"','"+aa+"','"+mark+"')";	
				s.insert(sql);
				out.print("<script>alert('添加成功');window.location.href='adduser.jsp';</script>");
			   }
			   else  out.print("<script>alert('工号已存在');window.location.href='adduser.jsp';</script>");
			   }
			 catch(SQLException e){
			   out.print("sql异常");
			   }
			 out.flush();
			 out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

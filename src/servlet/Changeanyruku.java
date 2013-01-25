package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Changeanyruku extends ServletFather{
	private static final long serialVersionUID = 1L;

	public Changeanyruku() {
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
		String name=attributes.get("name");
		String telephone=attributes.get("telephone");
		String mail=attributes.get("mail");
		String depart=attributes.get("depart");
		String num=session.getAttribute("num").toString();
	
		String strtelephone=null,strmail=null,strdepart=null,strname=null;
		if(!name.equals("")){
			strname=",user_name='"+name+"'";
		}
		 if(!telephone.equals("")){ 
			 strtelephone=",user_telephone='"+telephone+"'";
		 }
		 else strtelephone=" ";
		 if(!mail.equals("")){ 
			 strmail=",user_mail='"+mail+"'";
		 }
		 else strmail=" ";
		 if(!depart.equals("")){ 
			 strdepart=",user_depart='"+depart+"'";
		 }
		 else strdepart=" ";
		 try{
		      String sql="update media_users set user_num='"+num.toString()+"'"+strtelephone+" "+strmail+" "+strdepart+" "+strname+" where user_num='"+num.toString()+"'";
			  System.out.print(sql);
			  conn.stmt.executeUpdate(sql);
			  out.print("<script>alert('修改成功'); window.location.href='changeany.jsp';</script>");
		 }
		 
	catch(SQLException e1)
	{
	 out.print("SQL异常");
	}

		out.flush();
		out.close();
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}

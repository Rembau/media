package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javabean.Conn;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends ServletFather {
	private static final long serialVersionUID = 1L;

	public Register() {
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
		String num=attributes.get("num");
		String name=attributes.get("name");
		String password=attributes.get("password1");
		String depart=attributes.get("depart");
		String cardnum=attributes.get("cardnum");
		String telephone=attributes.get("telephone");
		String mail=attributes.get("mail");
		String sql=null;
		Conn c=null;
		c=new Conn();
		c.getConn();
		try{
			ResultSet rs1;
			sql="select * from media_user where user_num='"+num+"'";
			rs1=s.select(stmt, sql);
			if(rs1.next()){
			if(!rs1.getString("user_name").equals(name)){
				out.print("<script>alert('工号或姓名有误,请核对自己的工号和姓名,如果无误,请联系电教部');window.location.href='../register.jsp';</script>");
			}
			else if(rs1.getString("user_name").equals(name)){
				sql="select * from media_users where user_num='"+num+"'";
				System.out.print(sql);
				ResultSet rs=s.select(c.getStmt(), sql);
				if(rs.next()){
					out.print("<script>alert('该帐号已经注册\n提醒:进入系统可以使用多媒体证号激活帐号!');window.location.href='../landing.jsp';</script>");
				}
				else {
					if(cardnum.equals("无") || cardnum.length()==0){
					  if(rs1.getString(6)==null){ 
					    sql="insert into media_users set user_num='"+num+"',user_name='"+name+"',user_password='"+password+"',user_depart='"+depart+"',user_telephone='"+telephone+"',user_mail='"+mail+"'";
				        s.insert(sql);
					    out.print("<script>alert('注册完成,您没有输入多媒体使用证号');window.location.href='../help/loginhelp.jsp';</script>");
				      }
				      else {
				    	out.print("<script>alert('请输入多媒体使用证号码');window.location.href='../register.jsp';</script>");}
				   }
				   else {
					  if(rs1.getString(6)==null){
						out.print("<script>alert('您没有多媒体使用证号,如有疑问,请联系电教部');window.location.href='../register.jsp';</script>");
					  }
				       else if(rs1.getString(6).equals(cardnum)){
				    	sql="insert into media_users set user_num='"+num+"',user_name='"+name+"',user_password='"+password+"',user_depart='"+depart+"',user_telephone='"+telephone+"',user_mail='"+mail+"',user_state='正常'";
				        s.insert(sql);
				        out.print("<script>alert('注册成功');window.location.href='../landing.jsp';</script>");}
				      else {
				    	out.print("<script>alert('多媒体使用证号码错误');window.location.href='../register.jsp';</script>");
				       }			
				   }
				}
				c.close();
			}
			}
			else {
				sql="select * from media_users where user_num='"+num+"'";
				System.out.print(sql);
				ResultSet rs=s.select(c.getStmt(), sql);
				if(rs.next()){
					out.print("<script>alert('该帐号已经注册\\n提醒:进入系统可以使用多媒体证号激活帐号!');window.location.href='../landing.jsp';</script>");
				}
				else{
					sql="insert into media_users set user_num='"+num+"',user_name='"+name+"',user_password='"+password+"',user_depart='"+depart+"',user_telephone='"+telephone+"',user_mail='"+mail+"'";
				    s.insert(sql);
				    out.print("<script>alert('注册成功,你没有多媒体使用证,如有疑问,请联系电教部');window.location.href='../help/loginhelp.jsp';</script>");
				}
			}		
		}
		catch(SQLException e){
			c.close();
			out.print(sql);
			e.printStackTrace();
			out.print("sql异常");
		}
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

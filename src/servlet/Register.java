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
				out.print("<script>alert('���Ż���������,��˶��Լ��Ĺ��ź�����,�������,����ϵ��̲�');window.location.href='../register.jsp';</script>");
			}
			else if(rs1.getString("user_name").equals(name)){
				sql="select * from media_users where user_num='"+num+"'";
				System.out.print(sql);
				ResultSet rs=s.select(c.getStmt(), sql);
				if(rs.next()){
					out.print("<script>alert('���ʺ��Ѿ�ע��\n����:����ϵͳ����ʹ�ö�ý��֤�ż����ʺ�!');window.location.href='../landing.jsp';</script>");
				}
				else {
					if(cardnum.equals("��") || cardnum.length()==0){
					  if(rs1.getString(6)==null){ 
					    sql="insert into media_users set user_num='"+num+"',user_name='"+name+"',user_password='"+password+"',user_depart='"+depart+"',user_telephone='"+telephone+"',user_mail='"+mail+"'";
				        s.insert(sql);
					    out.print("<script>alert('ע�����,��û�������ý��ʹ��֤��');window.location.href='../help/loginhelp.jsp';</script>");
				      }
				      else {
				    	out.print("<script>alert('�������ý��ʹ��֤����');window.location.href='../register.jsp';</script>");}
				   }
				   else {
					  if(rs1.getString(6)==null){
						out.print("<script>alert('��û�ж�ý��ʹ��֤��,��������,����ϵ��̲�');window.location.href='../register.jsp';</script>");
					  }
				       else if(rs1.getString(6).equals(cardnum)){
				    	sql="insert into media_users set user_num='"+num+"',user_name='"+name+"',user_password='"+password+"',user_depart='"+depart+"',user_telephone='"+telephone+"',user_mail='"+mail+"',user_state='����'";
				        s.insert(sql);
				        out.print("<script>alert('ע��ɹ�');window.location.href='../landing.jsp';</script>");}
				      else {
				    	out.print("<script>alert('��ý��ʹ��֤�������');window.location.href='../register.jsp';</script>");
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
					out.print("<script>alert('���ʺ��Ѿ�ע��\\n����:����ϵͳ����ʹ�ö�ý��֤�ż����ʺ�!');window.location.href='../landing.jsp';</script>");
				}
				else{
					sql="insert into media_users set user_num='"+num+"',user_name='"+name+"',user_password='"+password+"',user_depart='"+depart+"',user_telephone='"+telephone+"',user_mail='"+mail+"'";
				    s.insert(sql);
				    out.print("<script>alert('ע��ɹ�,��û�ж�ý��ʹ��֤,��������,����ϵ��̲�');window.location.href='../help/loginhelp.jsp';</script>");
				}
			}		
		}
		catch(SQLException e){
			c.close();
			out.print(sql);
			e.printStackTrace();
			out.print("sql�쳣");
		}
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

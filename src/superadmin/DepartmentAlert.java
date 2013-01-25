package superadmin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class DepartmentAlert extends ServletFather {
	private static final long serialVersionUID = 1L;

	public DepartmentAlert() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String mark = attributes.get("mark");
		if(mark.equals("1"))
		{
			String old = attributes.get("old");
			String depart = attributes.get("depart");
			String sql="update media_department set de_name='"+depart+"' where de_name='"+old+"'";
			s.updata(sql);
			sql="update media_application set ap_depart='"+depart+"' where ap_depart='"+old+"'";
			s.updata(sql);
			sql="update media_clash set cl_depart='"+depart+"' where cl_depart='"+old+"'";
			s.updata(sql);
			sql="update media_users set user_depart='"+depart+"' where user_depart='"+old+"'";
			s.updata(sql);
			out.print("<script>alert('修改成功');window.location.href='../superadmin/depart.jsp';</script>");
		} else if(mark.equals("2"))
		{
			String name=attributes.get("name");
			String sql="insert into media_department(de_name) value('"+name+"')";
			s.insert(sql);
			out.print("<script>alert('添加成功');window.location.href='../superadmin/depart.jsp';</script>");
		} else if(mark.equals("3"))
		{
			String name=attributes.get("name");
			String sql="delete from media_department where de_name='"+name+"'";
			s.delete(sql);
			out.print("<script>alert('删除成功');window.location.href='../superadmin/depart.jsp';</script>");
		}
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	public void init() throws ServletException {
		// Put your code here
	}
}

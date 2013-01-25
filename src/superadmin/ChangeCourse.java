package superadmin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class ChangeCourse extends ServletFather {

	private static final long serialVersionUID = 1L;

	public ChangeCourse() {
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
		String mark=attributes.get("mark");
		if(mark.trim().equals("1"))
		{
			String id=attributes.get("id");
			String courseName=attributes.get("courseName");
			String courseCode=attributes.get("courseCode");
			String courseNum=attributes.get("courseNum");
			String sql="update media_course set co_courseName='"+courseName+"'," +
				"co_courseCode='"+courseCode+"',co_courseNum='"+courseNum+"' where co_id="+id;
			s.updata(sql);
			out.print("<script>alert('修改成功');window.location.href='guanlicourse.jsp';</script>");
		} else if(mark.trim().equals("2"))
		{
			String courseName=attributes.get("courseName");
			String courseCode=attributes.get("courseCode");
			String courseNum=attributes.get("courseNum");
			String num=attributes.get("num");
			String name=attributes.get("name");
			String sql="insert into media_course(co_name,co_num,co_courseName,co_courseCode,co_courseNum) value('"+name+"','"+num+"','"+courseName+"','"+courseCode+"',"+courseNum+")";
			s.insert(sql);
			out.print("<script>alert('添加成功');window.location.href='guanlicourse.jsp';</script>");
		} else if(mark.trim().equals("3"))
		{
			String id=attributes.get("id");
			String sql="delete from media_course where co_id='"+id+"'";
			s.delete(sql);
			out.print("<script>alert('删除成功');window.location.href='guanlicourse.jsp';</script>");
		}
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	public void init() throws ServletException {
	}
}

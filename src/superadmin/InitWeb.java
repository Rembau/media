package superadmin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class InitWeb extends ServletFather {
	private static final long serialVersionUID = 1L;
	public InitWeb() {
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
		String[] mark=request.getParameterValues("init");
		for(String s:mark)
		{
			if(s.equals("1"))
			{
				initApp();
				out.print("删除申请记录成功<br>");
			} else if(s.equals("2"))
			{
				initCourse();
				out.print("删除课时记录成功<br>");
			} else if(s.equals("3"))
			{
				initRemind();
				out.print("删除提醒成功<br>");
			} else if(s.equals("4"))
			{
				initAdminR();
				out.print("删除管理员记录成功<br>");
			}  
		}
		out.flush();
		out.close();
	}
	public void initAdminR()
	{
		String sql="delete from media_adminrecord where 1=1";
		 s.delete(sql);
	}
	public void initHoliday()
	{
		 String sql="delete from media_holiday where 1=1";
		 s.delete(sql);
	}
	public void initApp()
	{
		 initHoliday();
		 String sql="delete from media_table where 1=1";
		 s.delete(sql);
		 sql="delete from media_application where 1=1";
		 s.delete(sql);
		 sql="delete from media_clash where 1=1";
		 s.delete(sql);
		 sql="update media_situation set si_state='正常',si_holiday='正常' where 1=1";
		 s.updata(sql);
	}
	public void initCourse()
	{
		String sql="delete from media_course where 1=1";
		 s.delete(sql);
	}
	public void initRemind()
	{
		String sql="delete from media_remind where 1=1";
		 s.delete(sql);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

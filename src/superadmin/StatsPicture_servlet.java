package superadmin;

import java.io.IOException;
import java.io.PrintWriter;

import javabean.StatsPicture;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class StatsPicture_servlet extends ServletFather {

	private static final long serialVersionUID = 1L;

	public StatsPicture_servlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		PrintWriter out = response.getWriter();
		String strstartweek=attributes.get("startweek");
		String strendweek=attributes.get("endweek");
		int startweek=0,endweek=24;
		try{
			startweek=Integer.parseInt(strstartweek);
			endweek=Integer.parseInt(strendweek);
		}catch(Exception e){
			strstartweek="0";
			strendweek="24";
		}

		StatsPicture.make(startweek, endweek);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("<script>window.location.href='./stats.jsp?strstartweek="+strstartweek+"&strendweek="+strendweek+"';</script>");
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class Absendrecordruku extends ServletFather{
	private static final long serialVersionUID = 1L;

	public Absendrecordruku() {
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
		String topic=attributes.get("topic");
		String content=attributes.get("content");
		
			String sql="insert into media_adminrecord(adr_topic,adr_content) values('"+topic+"','"+content+"')";
			s.updata(sql);
			out.print("<script>alert('提交成功');window.location.href='suggestion.jsp';</script>");
			
			
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

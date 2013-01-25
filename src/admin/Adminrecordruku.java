package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class Adminrecordruku extends ServletFather{
	private static final long serialVersionUID = 1L;


	public Adminrecordruku() {
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
		String name=session.getAttribute("name").toString();
		String num=session.getAttribute("num").toString();
		
			String sql="insert into media_adminrecord(adr_topic,adr_content,adr_name,adr_num) values('"+topic+"','"+content+"','"+name.toString()+"','"+num.toString()+"')";
			s.updata(sql);
			out.print("<script>alert('提交成功');window.location.href='adminrecord.jsp';</script>");
			
			
			out.flush();
			out.close();
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}

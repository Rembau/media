package teacher;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class Suggestionruku extends ServletFather{

	private static final long serialVersionUID = 1L;

	public Suggestionruku() {
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
		String num=session.getAttribute("num").toString();
		String name=session.getAttribute("name").toString();
		String telephonestr=session.getAttribute("telephong").toString();
		String mailstr=session.getAttribute("mail").toString();
			String sql="insert into media_suggestion(su_name,su_topic,su_content,su_num,su_telephone,su_mail) value('"+name.toString()+"','"+topic+"','"+content+"','"+num.toString()+"','"+telephonestr+"','"+mailstr+"')";
			s.insert(sql);
			out.print("<script>alert('提交成功');window.location.href='suggestion.jsp';</script>");		
		
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

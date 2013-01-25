package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class SuggReply extends ServletFather {

	private static final long serialVersionUID = 1L;
	public SuggReply() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		String reply=attributes.get("reply");
		String id=attributes.get("id");
		PrintWriter out = response.getWriter();
		 String sql="update media_suggestion set su_state='已经回复',su_reply='"+reply+"' where su_id='"+id+"'";
		 s.updata(sql);
		 out.print("<script>alert('提交成功');window.location.href='suggestion.jsp?id="+id+"';</script>");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

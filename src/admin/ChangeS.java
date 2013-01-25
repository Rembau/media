package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class ChangeS extends ServletFather {

	private static final long serialVersionUID = 1L;

	public ChangeS() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		PrintWriter out = response.getWriter();
		String area=attributes.get("area");
		String room=attributes.get("room");
		String week=attributes.get("week");
		String id=attributes.get("id");
		String floor1=attributes.get("floor1");
		String mark=attributes.get("mark");
		String layer=attributes.get("layer");
		String page=attributes.get("page");
		String weekday=attributes.get("weekday");
		String intjieci=attributes.get("intjieci");
		String chose=attributes.get("chose");
		String sql="update media_application set "+mark+"='"+chose+"' where ap_id="+id+"";
		System.out.println("./looksq.jsp?area="+area+"&intjieci="+intjieci+"&week="+week+"&weekday="+weekday+"&floor1="+floor1+"&layer="+layer+"&room="+room+"&page="+page+"");
		s.updata(sql);
		out.print("<script>window.location.href='./looksq.jsp?area="+area+"&intjieci="+intjieci+"&week="+week+"&weekday="+weekday+"&floor1="+floor1+"&layer="+layer+"&room="+room+"&page="+page+"';</script>");
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

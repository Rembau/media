package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class DeletRoom extends ServletFather {

	private static final long serialVersionUID = 1L;

	public DeletRoom() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		try {
			doPost(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		PrintWriter out = response.getWriter();
		String room=attributes.get("room");
		String area=attributes.get("area");
		String sql="select * from media_application where ap_room='"+room+"'";
		ResultSet rs=s.select(stmt, sql);
		try {
			if(rs.next()){
				System.out.println(rs.getString(1)+"");
				out.print("<script> " +
						"if(window.confirm('该教室有申请记录,删除教室会删除该教室所有申请记录!确定删除吗')){ " +
						"window.location.href='.DeletRoomSure?room="+room+"&area="+area+"';" +
						"}" +
						"else window.location.href='lururoom.jsp';" +
						"</script>");
			}
			else out.print("<script>window.location.href='.DeletRoomSure?room="+room+"&area="+area+"';</script>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

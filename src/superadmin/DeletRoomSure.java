package superadmin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class DeletRoomSure extends ServletFather {

	private static final long serialVersionUID = 1L;

	public DeletRoomSure() {
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
		try{
			String sql="delete from media_rooms where ro_room='"+room+"' and ro_area='"+area+"'";
			s.delete(sql);
			new LuruRoomThread(room,area).start();
			out.print("<script>alert('É¾³ý³É¹¦');window.location.href='./lururoom.jsp';</script>");
		}catch(Exception e){
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

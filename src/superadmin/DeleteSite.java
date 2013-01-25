package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class DeleteSite extends ServletFather {

	private static final long serialVersionUID = 1L;

	public DeleteSite() {
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
		String site=attributes.get("site");
		String area=attributes.get("area");
		String sql="select * from media_rooms where ro_area='"+area+"' and ro_room like '"+site+"%'";
		ResultSet rs=s.select(stmt, sql);
		try {
			if(rs.next()){
				out.print("<script>alert('该楼有教室,请删除所有教室后再删除楼');window.location.href='lururoom.jsp';</script>");
			}
			else {
				sql="delete from media_site where sit_area='"+area+"' and sit_nummark='"+site+"'";
				s.delete(sql);
				out.print("<script>alert('删除成功');window.location.href='lururoom.jsp';</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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

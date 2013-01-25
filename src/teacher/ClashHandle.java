package teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javabean.InsertApplication;
import javabean.VetoAppExecption;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class ClashHandle extends ServletFather {

	private static final long serialVersionUID = 1L;

	public ClashHandle() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        before(request);
		PrintWriter out = response.getWriter();
		String page=attributes.get("page");
		String mark=attributes.get("mark");
		String cl_id=attributes.get("id");
		String message=null;
		if(mark.equals("通过")){
			message=pass(cl_id);
		}
		else {
			veto(cl_id);
			message="操作成功";
		}
		out.print("<script>alert('"+message+"');window.location.href='repeatsq.jsp?page="+page+"';</script>");
		out.flush();
		out.close();
	}
	String pass(String id){
		String sql="select * from media_clash where cl_id ='"+id+"'";
		ResultSet rs=s.select(stmt, sql);
		try {
			rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		String area=null,room=null,week=null,weekday=null,jieci=null,alljie=null,name=null,num=null,depart=null,jieciend=null;
		try {
			area=rs.getString("cl_area");
			room=rs.getString("cl_room");
			week=rs.getString("cl_week");
			weekday=rs.getString("cl_weekday");
			jieci=rs.getString("cl_jiecistart");
			alljie=rs.getString("cl_alljie");
			name=rs.getString("cl_name");
			num=rs.getString("cl_num");
			depart=rs.getString("cl_depart");
			jieciend=rs.getString("cl_jieciend");
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try{
			sql="select ap_id,ap_num,ap_name from media_application where ap_area='"+area+"' and ap_room='"+room+"' and ap_week='"+week+"' and ap_weekday='"+weekday+"' and (ap_jieci like '%"+jieci+"%'or ap_jieci like '%"+jieciend+"%') and ap_state='通过'";
			rs=s.select(stmt, sql);
			try {
				while(rs.next()){
					javabean.VetoApplication.handle(rs.getString("ap_id"),session.getAttribute("name").toString());
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}catch(VetoAppExecption e){
		}
		if(!InsertApplication.handle(area, room, week, weekday, jieci, alljie, name, num, depart).equals("3")){
			sql="update media_clash set cl_mark='通过' where cl_id='"+id+"'";
			s.updata(sql);	
			return "申请成功";
		}
		return "教师该时间段已经有申请!";
	}
	void veto(String id){
		String sql="update media_clash set cl_mark='未通过' where cl_id='"+id+"'";
		s.updata(sql);	
	}
	public void init() throws ServletException {
		// Put your code here
	}

}

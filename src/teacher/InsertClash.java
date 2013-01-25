package teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class InsertClash extends ServletFather {

	private static final long serialVersionUID = 1L;

	public InsertClash() {
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
		String jieci=attributes.get("jieci");
		String area=attributes.get("area");
		String week=attributes.get("week");
		String weekday=attributes.get("weekday");
		String room=attributes.get("room");
		String alljie=attributes.get("alljie");
		String sql="select * from media_table where ta_area='"+area+"' and ta_room='"+room+"' and ta_week='"+week+"' and ta_weekday='"+weekday+"' and ta_jiecistart='"+jieci+"'";
		ResultSet rs=s.select(stmt, sql);
		System.out.print(sql);
		try {
			rs.next();
			String apid=rs.getString("ta_sqid");
			sql="select * from media_clash where cl_num='"+session.getAttribute("num")+"' and cl_name='"+session.getAttribute("name")+"' and cl_apid='"+apid+"' and cl_jiecistart='"+jieci+"'";
			rs=s.select(stmt, sql);
			if(rs.next()){
				out.print("<script>alert('你已经申请过了,不要重复申请');window.location.href='application.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&ok=0';</script>");
			}
			else{
				String strjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
				    int jiecistart=0;
				    for(int ii=0;ii<12;ii++){
				    	if(strjieci[ii].equals(jieci)) 
				    		jiecistart=ii;
				    }
				    String jieciend=strjieci[jiecistart+Integer.parseInt(alljie)-1];
				sql="insert into media_clash(cl_num,cl_name,cl_apid,cl_jiecistart,cl_alljie,cl_week,cl_weekday,cl_area,cl_room,cl_depart,cl_jieciend) values('"+session.getAttribute("num")+"','"+session.getAttribute("name")+"','"+apid+"','"+jieci+"','"+alljie+"','"+week+"','"+weekday+"','"+area+"','"+room+"','"+session.getAttribute("depart")+"','"+jieciend+"')";
				//System.out.println(sql);
				s.insert(sql);	
				out.print("<script>alert('申请完成,等待管理员审核!');window.location.href='application.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"';</script>");
				//RequestDispatcher dispatcher = request.getRequestDispatcher("application.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci);
				//dispatcher.forward(request, response);
			}		
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

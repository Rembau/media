package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CancelApplication extends ServletFather {

	private static final long serialVersionUID = 1L;

	public CancelApplication() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		PrintWriter out = response.getWriter();
		String sql;
		String alljie=attributes.get("alljie");
		String id=attributes.get("id");
		String sqid=attributes.get("sqid");
		String area=attributes.get("area");
		String weekday=attributes.get("weekday");
		String room=attributes.get("room");
		String jieci=attributes.get("jieci");
		String week=attributes.get("week");
		int jiecistart=0;
		String strjieci1[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
		for(int ii=0;ii<12;ii++)
		 {if(strjieci1[ii].equals(jieci)) jiecistart=ii;}
		try{
			sql="delete from media_table where ta_id='"+id+"'";
			stmt.executeUpdate(sql);
			if(alljie.equals("2")){
				sql="update media_situation set si_state ='正常' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci1[jiecistart]+"','"+strjieci1[jiecistart+1]+"')";
				stmt.executeUpdate(sql);}
			if(alljie.equals("3")){
				sql="update media_situation set si_state ='正常' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci1[jiecistart]+"','"+strjieci1[jiecistart+1]+"','"+strjieci1[jiecistart+2]+"')";
				stmt.executeUpdate(sql);
			}
			sql="update media_application set ap_state='未通过' where ap_id='"+sqid+"'";
			stmt.executeUpdate(sql);
		}catch(SQLException e1){
		}
		out.print("<script>window.location.href='sqtable.jsp?week="+week+"';</script>");
		System.out.print("<script>window.location.href='sqtable.jsp&week="+week+"';</script>");
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void init() throws ServletException {
		// Put your code here
	}

}

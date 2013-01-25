package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class Addapplicationruku extends ServletFather{

	private static final long serialVersionUID = 1L;

	public Addapplicationruku() {
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
		String jieci=attributes.get("jieci");
		String alljie=attributes.get("alljie");
		String area=attributes.get("area");
		String room=attributes.get("room");
		String week=attributes.get("week");
		String weekday=attributes.get("weekday");
		String usernum=attributes.get("usernum");
		String username=attributes.get("username");
		String userdepart=attributes.get("userdepart");
		String note=attributes.get("note");
		String strjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
		   try{String sql=null;
		   int jiecistart=0;
		for(int ii=0;ii<12;ii++)
		{if(strjieci[ii].equals(jieci)) jiecistart=ii;}
		if(alljie.equals("3"))
		sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		else if(alljie.equals("2"))
		sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		//out.print(sql);
		ResultSet rs=conn.stmt.executeQuery(sql);

		int markstate=0;
		while(rs.next()){
		if(rs.getString(5).equals("占用")){ markstate=1;}
		}
		if(alljie.equals("3"))
		sql="select * from media_table where  ta_num='"+usernum+"' and ta_area='"+area+"' and ta_week='"+week+"' and ta_weekday='"+weekday+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		else if(alljie.equals("2"))
		sql="select * from media_table where ta_num='"+usernum+"' and  ta_area='"+area+"'  and ta_week='"+week+"' and ta_weekday='"+weekday+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		//out.print(sql);
		rs=conn.stmt.executeQuery(sql);
		while(rs.next()){markstate=2;break;}

		if(markstate==0){

		   sql="insert into media_table(ta_num,ta_week,ta_weekday,ta_jiecistart,ta_alljie,ta_area,ta_room) values('"+usernum+"','"+week+"','"+weekday+"','"+jieci+"','"+alljie+"','"+area+"','"+room+"')";
		  //out.print(sql);
		  conn.stmt.executeUpdate(sql);

		   	 //out.print(alljie);
			 String alljieci=null;
			if(alljie.equals("2")){ alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1]; }
			if(alljie.equals("3")){ alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1]+","+strjieci[jiecistart+2]; }
			sql="insert into media_application(ap_name,ap_week,ap_weekday,ap_room,ap_area,ap_jieci,ap_depart,ap_num,ap_note,ap_alljie,ap_startjieci) values('"+username+"','"+week+"','"+weekday+"','"+room+"','"+area+"','"+alljieci+"','"+userdepart+"','"+usernum+"','"+note+"','"+alljie+"','"+jieci+"')";
		   //out.print(sql+"<br>");
		   conn.stmt.executeUpdate(sql);

		   sql="select max(ap_id) from media_application";
		  // out.print(sql+"<br>");
		   rs=conn.stmt.executeQuery(sql);
			rs.next();
			String sqid=rs.getString(1);
			sql="select max(ta_id) from media_table";
			//out.print(sql+"<br>");
		   ResultSet rs1=conn.stmt.executeQuery(sql);
			rs1.next();
			//out.print(rs1.getString(1));
		   sql="update media_table set ta_sqid='"+sqid+"' where ta_id='"+rs1.getString(1)+"'";
		  // out.print(sql+"<br>");
		   String tableid=rs1.getString(1);
		   conn.stmt.executeUpdate(sql);
		   sql="update media_application set ap_tableid='"+tableid+"' where ap_id='"+sqid+"'";
		   //out.print(sql);
		   conn.stmt.executeUpdate(sql);
		   
		    if(alljie.equals("2")){
		   sql="update media_situation set si_state ='占用' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		   conn.stmt.executeUpdate(sql);}
		   if(alljie.equals("3")){
		   sql="update media_situation set si_state ='占用' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		   conn.stmt.executeUpdate(sql);}
		   //out.print(sql+"<br>");
		   
		out.print("<script>alert('提交成功');window.location.href='addapplication.jsp';</script>");
		   }
		   else if(markstate==1){out.print("<script>alert('该时段被占用');window.location.href='addapplication.jsp';</script>");}
		   else if(markstate==2){out.print("<script>alert('"+username+"该时段已经有课');window.location.href='addapplication.jsp';</script>");}
		   }
		   catch(SQLException e1)
		{
		 out.print("SQL异常");
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

package teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;
public class Applicationruku extends ServletFather {
	private static final long serialVersionUID = 1L;
	public Applicationruku() {
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
		String jieci=attributes.get("jieci");
		String area=attributes.get("area");
		String week=attributes.get("week");
		String weekday=attributes.get("weekday");
		String room=attributes.get("room");
		String note=attributes.get("note");
		String alljie=attributes.get("alljie");
		String num=session.getAttribute("num").toString();
		String depart=session.getAttribute("depart").toString();
		String name=session.getAttribute("name").toString();
		String courseName=attributes.get("courseName");
		
		String strjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
		try{
			String sql=null;
		    int jiecistart=0;
		    for(int ii=0;ii<12;ii++){
		    	if(strjieci[ii].equals(jieci)) 
		    		jiecistart=ii;
		    }
		    if(alljie.equals("3"))
    			sql="select * from media_table where  ta_num='"+num.toString()+"' and ta_area='"+area+"' and ta_week='"+week+"' and ta_weekday='"+weekday+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
    		else if(alljie.equals("2"))
    			sql="select * from media_table where ta_num='"+num.toString()+"' and  ta_area='"+area+"'  and ta_week='"+week+"' and ta_weekday='"+weekday+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
    		//out.print(sql);
		    int markstate=0;
		    ResultSet rs=s.select(stmt, sql);
    		while(rs.next()){
    			markstate=2;
    			out.print("<script>alert('您该时段已经有课');window.location.href='application.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&ok=0';</script>");
	    		new log.Logs().getloga().info(session.getAttribute("num")+" "+session.getAttribute("name")+"与自己课时时间段冲突"+sql);
    			out.flush();
    			out.close();
    			return;
    		}
    		
		    if(alljie.equals("3"))
		    	sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		    else if(alljie.equals("2"))
		    	sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		    rs=s.select(stmt, sql);
    		while(rs.next()){
    			if(rs.getString(5).equals("占用")){ 
    				markstate=1;
    				out.print("<script>if(window.confirm('该时段已经有人占用,继续申请?')){" +
	    					"window.location.href='.InsertClash?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&room="+room+"&alljie="+alljie+"';" +
	    							"}" +
	    					"else window.location.href='application.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&ok=0';" +
	    							"</script>");
	    			new log.Logs().getloga().info(session.getAttribute("num")+" "+session.getAttribute("name")+"课时被占用"+sql);
    				out.flush();
	    			out.close();
	    			return;
    			}
    		}
    	
    		sql="select courseNum from sqcount where ap_num='"+num+"' and ap_courseName='"+courseName+"'";
    		rs=s.select(stmt, sql);
    		int used=0;
    		if(rs.next())
    		{
    			used=rs.getInt("courseNum");
    		}
    		sql="select co_courseNum from media_course where co_num='"+num+"' and co_courseName='"+courseName+"'";
    		int total=0;
    		rs=s.select(stmt, sql);
    		if(rs.next())
    		{
    			total=rs.getInt("co_courseNum");
    		}
    		System.out.println(used+" "+total);
    		if(Integer.valueOf(alljie)>(total-used))
    		{
    			markstate=3;
    			out.print("<script>alert('您的课时不足');window.location.href='application.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&ok=0';</script>");
	    		new log.Logs().getloga().info(session.getAttribute("num")+" "+session.getAttribute("name")+"课时不足"+sql);
    			out.flush();
    			out.close();
    		}
    		if(markstate==0){
    			sql="insert into media_table(ta_num,ta_week,ta_weekday,ta_jiecistart,ta_alljie,ta_area,ta_room,ta_courseName) values('"+num.toString()+"','"+week+"','"+weekday+"','"+jieci+"','"+alljie+"','"+area+"','"+room+"','"+courseName+"')";
    			//out.print(sql);
    			s.insert(sql);
    			//out.print(alljie);
    			String alljieci=null;
    			if(alljie.equals("2")){ 
    				alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1];
    			}
    			if(alljie.equals("3")){ 
    				alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1]+","+strjieci[jiecistart+2]; 
    			}
    			sql="insert into media_application(ap_name,ap_week,ap_weekday,ap_room,ap_area,ap_jieci,ap_depart,ap_num,ap_note,ap_alljie,ap_startjieci,ap_courseName) values('"+name.toString()+"','"+week+"','"+weekday+"','"+room+"','"+area+"','"+alljieci+"','"+depart.toString()+"','"+num.toString()+"','"+note+"','"+alljie+"','"+jieci+"','"+courseName+"')";
    			//out.print(sql+"<br>");
    			s.insert(sql);
    			sql="select max(ap_id) from media_application";
    			// out.print(sql+"<br>");
    			rs=s.select(stmt, sql);
    			rs.next();
    			String sqid=rs.getString(1);
    			sql="select max(ta_id) from media_table";
    			//out.print(sql+"<br>");
    			ResultSet rs1=s.select(stmt, sql);
    			rs1.next();
    			//out.print(rs1.getString(1));
    			sql="update media_table set ta_sqid='"+sqid+"' where ta_id='"+rs1.getString(1)+"'";
    			// out.print(sql+"<br>");
    			String tableid=rs1.getString(1);
    			s.updata(sql);
    			sql="update media_application set ap_tableid='"+tableid+"' where ap_id='"+sqid+"'";
    			//out.print(sql);
    			s.updata(sql);
   
    			if(alljie.equals("2")){
    				sql="update media_situation set si_state ='占用' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
    				s.updata(sql);
    			}
    			if(alljie.equals("3")){
    				sql="update media_situation set si_state ='占用' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
                    s.updata(sql);
                }
    			//out.print(sql+"<br>");
    			out.print("<script>alert('提交成功');window.location.href='application.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&ok=0';</script>");
    		    new log.Logs().getloga().info(session.getAttribute("num")+" "+session.getAttribute("name")+"申请成功"+sql);
    		}
		   }catch(SQLException e1){
			   out.print("SQL异常");
			   new log.Logs().getloga().info(session.getAttribute("num")+" "+session.getAttribute("name")+"未知错误"+e1.getMessage());
		   }
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}

<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>教师</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
%>
<%
String week=null;
     week=request.getParameter("week");
	 if(week!=null){
	 week=new String(week.getBytes("ISO-8859-1"),"GB2312");}
	 else {week="0";}
	 
String beforeweek=null;
     beforeweek=request.getParameter("beforeweek");
	 if(beforeweek!=null){
	 beforeweek=new String(beforeweek.getBytes("ISO-8859-1"),"GB2312");}
	 else {beforeweek="0";}

%>

<%
String sql;
ResultSet rs;
try{
sql="select * from media_table where ta_num='"+num.toString()+"' and ta_week='"+beforeweek+"'";
rs=stmt.executeQuery(sql);
String strjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
while(rs.next())
{
	String alljie=rs.getString(6);
   	String jieci=rs.getString(5);
   	int jiecistart=0;
	for(int ii=0;ii<12;ii++)
	{
		if(strjieci[ii].equals(jieci)) jiecistart=ii;
	}
	int markstate=0;
	if(alljie.equals("3"))
		sql="select * from media_situation where si_area='"+rs.getString(7)+"' and si_room='"+rs.getString(8)+"' and si_week='"+week+"' and si_weekday='"+rs.getString(4)+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
	else if(alljie.equals("2"))
		sql="select * from media_situation where si_area='"+rs.getString(7)+"' and si_room='"+rs.getString(8)+"' and si_week='"+week+"' and si_weekday='"+rs.getString(4)+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		//out.print("markstate=1"+sql+"<br>");
	ResultSet rs3=stmt1.executeQuery(sql);
	while(rs3.next()){
		if(rs3.getString(5).equals("占用")){ 
			markstate=1;
		}
	}
	if(markstate==1)
	{
		out.print("第"+week+"周,"+rs.getString(4)+" "+rs.getString(8)+" "+rs.getString(5)+"已经有课<br>"); 
		continue;
	}
	if(alljie.equals("3"))
		sql="select * from media_table where  ta_num='"+rs.getString(2)+"' and ta_area='"+rs.getString(7)+"' and ta_week='"+week+"' and ta_weekday='"+rs.getString(4)+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
	else if(alljie.equals("2"))
		sql="select * from media_table where ta_num='"+rs.getString(2)+"' and ta_area='"+rs.getString(7)+"' and ta_week='"+week+"' and ta_weekday='"+rs.getString(4)+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		//out.print("markstate=2"+sql+"<br>");
	rs3=stmt1.executeQuery(sql);
	if(rs3.next())
	{
		markstate=2;
		out.print("您在第"+week+"周,"+rs.getString(4)+" "+rs.getString(5)+"已经有课<br>");
		continue;
	}
	sql="select courseNum from sqcount where ap_num='"+num+"' and ap_courseName='"+rs.getString("ta_courseName")+"'";
    		rs3=stmt1.executeQuery(sql);
    		int used=0;
    		if(rs3.next())
    		{
    			used=rs3.getInt("courseNum");
    		}
    		sql="select co_courseNum from media_course where co_num='"+num+"' and co_courseName='"+rs.getString("ta_courseName")+"'";
    		int total=0;
    		rs3=stmt1.executeQuery(sql);
    		if(rs3.next())
    		{
    			total=rs3.getInt("co_courseNum");
    		}
    		System.out.println(used+" "+total);
    		if(Integer.valueOf(alljie)>(total-used))
    		{
    			markstate=3;
    			out.println("您的"+rs.getString("ta_courseName")+"课时不足<br>");
    		}
   	//out.print(markstate);
 	if(markstate==0){
 		sql="insert into media_table(ta_num,ta_week,ta_weekday,ta_jiecistart,ta_alljie,ta_area,ta_room,ta_sqid,ta_courseName) values('"+num.toString()+"','"+week+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"','"+rs.getString(7)+"','"+rs.getString(8)+"','1','"+rs.getString("ta_courseName")+"')";
  		//out.print(sql+"<br>");
   		stmt1.executeUpdate(sql);
    	if(alljie.equals("2")){
   			sql="update media_situation set si_state ='占用' where si_area='"+rs.getString(7)+"' and si_room='"+rs.getString(8)+"' and si_week='"+week+"' and si_weekday='"+rs.getString(4)+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
   			stmt1.executeUpdate(sql);
   		}
   		if(alljie.equals("3")){
   			sql="update media_situation set si_state ='占用' where si_area='"+rs.getString(7)+"' and si_room='"+rs.getString(8)+"' and si_week='"+week+"' and si_weekday='"+rs.getString(4)+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
   			stmt1.executeUpdate(sql);
   		}
   		//out.print(sql);
   
   		String alljieci=null;
		if(alljie.equals("2")){ alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1]; }
		if(alljie.equals("3")){ alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1]+","+strjieci[jiecistart+2]; }
		sql="insert into media_application(ap_name,ap_week,ap_weekday,ap_room,ap_area,ap_jieci,ap_depart,ap_num,ap_note,ap_alljie,ap_startjieci,ap_courseName) values('"+name.toString()+"','"+week+"','"+rs.getString(4)+"','"+rs.getString(8)+"','"+rs.getString(7)+"','"+alljieci+"','"+depart.toString()+"','"+num.toString()+"','无','"+alljie+"','"+jieci+"','"+rs.getString("ta_courseName")+"')";
		//out.print(sql+"<br>");
   		stmt1.executeUpdate(sql);
   		ResultSet rs2;
   		sql="select max(ap_id) from media_application";
  		// out.print(sql+"<br>");
   		rs2=stmt1.executeQuery(sql);
		rs2.next();
		String sqid=rs2.getString(1);
		sql="select max(ta_id) from media_table";
		//out.print(sql+"<br>");
   		ResultSet rs1=stmt1.executeQuery(sql);
		rs1.next();
		//out.print(rs1.getString(1));
   		sql="update media_table set ta_sqid='"+sqid+"' where ta_id='"+rs1.getString(1)+"'";
  		// out.print(sql+"<br>");
   		String tableid=rs1.getString(1);
   		stmt1.executeUpdate(sql);
   		sql="update media_application set ap_tableid='"+tableid+"' where ap_id='"+sqid+"'";
   		//out.print(sql);
   		stmt1.executeUpdate(sql);
   		out.print("申请成功<br>");
   	}
}
//out.print("<script>alert('ok');window.location.href='sqtable.jsp?week="+beforeweek+"';</script>");
out.print("<script>alert('ok');</script>");
}
   catch(SQLException e1)
{
 out.print("SQL异常");
}
%>
<a href="sqtable.jsp?week=<%=beforeweek%>">返回</a>


</body>
</html>